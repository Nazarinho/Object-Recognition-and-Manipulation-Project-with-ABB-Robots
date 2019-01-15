/*
You are responsible for your own computer security. If your machine is compromised you will lose your ether, 
access to any contracts and maybe more.

You are responsible for your own actions. If you mess something up or break any laws while using this software, 
it's your fault, and your fault only.

You are responsible for your own karma. Don't be a jerk and respect others.
This software is open source under a GNU Lesser General Public License license.
*/
#include <Windows.h> 
#include <cstdio> 
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include <opencv2/core.hpp>
#include "opencv2/objdetect.hpp"
#include <opencv2/features2d.hpp>
#include <opencv2/cvconfig.h>
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <time.h>
#include <fstream>

using namespace std;
using namespace cv;


int count_dots(Mat dice, int num) {

	num = 0;

	// resize
	resize(dice, dice, Size(150, 150));
	Mat gray;
	Mat filter;

	//Grayscale
	cvtColor(dice, gray, COLOR_BGR2GRAY);

	//medianBlur(gray, gray, 7);
	bilateralFilter(gray, filter, 8, 150, 150, BORDER_DEFAULT);

	//Canny(filter, filter, 0, 120, 3);
	threshold(filter, filter, 150, 300, THRESH_BINARY | CV_THRESH_OTSU);

	// Setup SimpleBlobDetector parameters.
	SimpleBlobDetector::Params params;
	params.filterByInertia = true;
	params.minInertiaRatio = 0.5;

	//create vector for blobs
	vector<KeyPoint> keypoints;

	// Set up and create new blob detector with our parameters
	Ptr<SimpleBlobDetector> blobDetector = SimpleBlobDetector::create(params);

	//start detector
	blobDetector->detect(filter, keypoints);

	//save number of detected points
	num = keypoints.size();

	// show
	namedWindow("ROI processed", true);
	imshow("ROI processed", filter);

	// return number of pips
	return num;
}

void wright_data(int dice_value, int angle, int x, int y) {

	ofstream myfile("C:/Users/Nazarinho/Documents/RobotStudio/Systems/System3/HOME/example.txt", ios::trunc);
	if (myfile.is_open())
	{
		//////RobotStudio simulation
		//myfile << dice_value << endl;
		//myfile << angle << endl; //angle
		//myfile << 507 << endl; // x
		//myfile << -150 << endl; // y
		////////////////////////////

		//add this lines for real controller ->>>>
		myfile << x << endl;
		myfile << y << endl;
		myfile << dice_value << endl;
		myfile << angle << endl;
	}
	else cout << "Unable to open file";
	//myfile.clear();
	myfile.close();
}

void image_proc(Mat main_Frame, vector<vector<Point>> shapes, int&max, int&min_shape, int&min) {

	//time_t start, end;
	vector<RotatedRect> minRect(shapes.size());
	Point center_of_rect, actual;
	int dice_dots = 0, dist = 0, x = 0, y = 0, dice_value = 0;
	float angle = 0;

	// iterate over dice contours
	for (int i = 0; i < int(shapes.size()); i++) {

		// get contour area
		double diceContourArea = contourArea(shapes[i]);
		// filter contours based on our dice size

		if (diceContourArea > 23000 && diceContourArea < 25000) {

			min_shape = shapes.size();

			// get bounding rect
			Rect diceBoundsRect = boundingRect(Mat(shapes[i]));
			minRect[i] = minAreaRect(Mat(shapes[i]));

			// set dice roi
			Mat diceROI = main_Frame(diceBoundsRect);

			//dots counting
			dice_dots = count_dots(diceROI, dice_dots);

			// Max value counted
			if (dice_dots > max) {
				max = dice_dots;
			}
			dice_value = max;

			ostringstream diceText;
			diceText << "Dice: " << max;
			diceText << " Dice:" << diceContourArea;

			// draw dice value
			putText(main_Frame, diceText.str(),
				Point(diceBoundsRect.x, diceBoundsRect.y + diceBoundsRect.height + 20),
				FONT_HERSHEY_COMPLEX_SMALL, 0.8, Scalar::all(255), 1, 8);

			// Color of bounding rect
			Scalar color = Scalar(255, 0, 0);
			// Draw contours 

			Point2f rect_points[4]; minRect[i].points(rect_points);
			for (int j = 0; j < 4; j++) {
				line(main_Frame, rect_points[j], rect_points[(j + 1) % 4], color, 2, 8);
			}

			// angle calculation 
			angle = atan2(rect_points[1].y - rect_points[2].y, rect_points[1].x - rect_points[2].x);
			angle = 180 - (angle * 180 / 3.141592);
			angle = int(angle);
			// take the center point "x" and "y" coordinates 
			center_of_rect = (diceBoundsRect.br() + diceBoundsRect.tl())*0.5;

			//draw corner circle points
			circle(main_Frame, rect_points[1], 2, Scalar(0, 255, 0), 3, LINE_AA);
			circle(main_Frame, rect_points[2], 2, Scalar(0, 255, 0), 3, LINE_AA);
		}
		else if (min_shape != shapes.size()) {
			max = 0;
		}
	}
	if (max == 0) {
		cout << " no dice " << shapes.size() << endl;
	}
	else {
		cout << " " << max;
		cout << " p = " << center_of_rect << ";" << endl;
		cout << " angle  " << angle << " " << endl;
	}

	//register data
	x = center_of_rect.x;
	y = center_of_rect.y;
	wright_data(dice_value, int(angle), x, y);

	// show result
	imshow("video", main_Frame);
}

void image_proc_calib(Mat Frame_calib, Point&W, Point&H) {

	Point2i center_1, center_2;
	vector<Vec3f> circles;
	Vec3f c1, c2;
	int j = 0;

	//Method for searching control circles and resize the main frame
	HoughCircles(Frame_calib, circles, HOUGH_GRADIENT, 1,
		Frame_calib.rows / 16,//detect circles with different distances to each other
		100, 30, 1, 40        //last two parameters
							  //(min_radius & max_radius) detect larger circles
	);

	for (size_t i = 0; i < circles.size(); i++)
	{
		Vec3i c = circles[i];
		Point center = Point(c[0], c[1]);

		// circle center
		circle(Frame_calib, center, 1, Scalar(0, 100, 100), 3, LINE_AA);

		// circle outline
		int radius = c[2];
		circle(Frame_calib, center, radius, Scalar(255, 0, 255), 3, LINE_AA);
		j = i;
	}

	if (circles.size() >= 2) {
		c1 = circles[j - 1];
		c2 = circles[j];

		//Save points for the ROI
		center_1 = Point(c1[0], c1[1]);
		center_2 = Point(c2[0], c2[1]);
		Scalar color2 = Scalar(255, 0, 0);

		//Define the rectangle
		rectangle(Frame_calib, center_1, center_2, color2, 2, 8, 0);

		//Set roi
		Rect R(center_1, center_2);
		Mat Roi = Frame_calib(R);

		//Save control points for width and height of the rectangle
		W = center_1;
		H = center_2;

		//show result
		imshow("calib", Roi);
	}
}


// GLOBAL USED VARIABLES
int lowThreshold;
int const max_lowThreshold = 255;
int threshold_type = 3;
int ratio = 3;
int kernel_size = 3;
int lowFilter_calib;
int const max_lowFilter_calib = 30;
int lowFilter;
int const max_lowFilter = 30;
Mat frame, unprocessFrame, first_filter, calib_filter, backgroundFrame, calibr, Roi, Roi_B, buffer;

int main(int argc, char** argv)
{
	//***VARIABLES***//
	double time = 0;
	unsigned t0, t1;
	Point W, H;
	//ORIENTATION VARIABLES//
	int max = 0, min_shape = 0, min = 0;

	// open the default IP camera
	VideoCapture cap("http://admin:tfgadmin@192.168.0.20/video.cgi");
	//VideoCapture cap(0);///CÁMARA DE WEB

	// check if we succesfully opened the camera stream
	if (!cap.isOpened()) {
		return -1;
	}

	//Open calibration frame
	namedWindow("calib", true);

	//////////CALIBRATION//////////
	while (true) {

		for (int i = 0; i < 5; i++) { 
			cap >> calibr; 
		}

		//Starting the trackbar for adjustments
		createTrackbar("Calibration:", "calib", &lowFilter_calib, max_lowFilter_calib);

		//Grayscale
		cvtColor(calibr, calibr, CV_BGR2GRAY);
		//Filtering
		medianBlur(calibr, calibr, 7);
		bilateralFilter(calibr, calib_filter, lowFilter_calib, lowFilter_calib * 2, lowFilter_calib / 2);
		//OPTIONAL Filtering//for (int i = 1; i < 31; i = i + 2) bilateralFilter(calibr, calib_filter, i, i * 2, i / 2);

		//process the image calibraition method
		image_proc_calib(calib_filter, W, H);

		if (waitKey(30) >= 0) break;
	}

	//Set the roi for calibrated frame
	Rect Roi_M(W, H);

	// open main process window frames
	namedWindow("video", true);
	namedWindow("filtering process", true);
	while (true)

	{
		t0 = clock();
		for (int i = 0; i < 15; i++)
		{
			cap >> buffer;
			frame = buffer;
		}

		//Setting the main Roi
		frame = frame(Roi_M);

		// hold unprocessed framed
		unprocessFrame = frame.clone();

		// convert to grayscale
		cvtColor(frame, frame, CV_BGR2GRAY);

		// first stage filtering
		createTrackbar("Threshold:", "filtering process", &lowThreshold, max_lowThreshold);
		createTrackbar("Filter:", "filtering process", &lowFilter, max_lowFilter);
		medianBlur(frame, frame, 5);

		bilateralFilter(frame, first_filter, lowFilter, lowFilter * 2, lowFilter / 2);

		//PREDEFINED threshold METHOD
		//threshold(first_filter, first_filter, lowThreshold, max_lowThreshold, THRESH_OTSU | THRESH_BINARY);

		threshold(first_filter, first_filter, lowThreshold, max_lowThreshold, threshold_type);
		
		// detect dice shapes
		vector<vector<Point>>diceContours;
		vector<Vec4i>diceHierarchy;
		findContours(first_filter, diceContours, diceHierarchy, CV_RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);

		//main image process
		image_proc(unprocessFrame, diceContours, max, min_shape, min);
		t1 = clock();
		time = (double(t1 - t0) / CLOCKS_PER_SEC);
		cout << "T: " << time;

		//check filtering process
		imshow("filtering process", first_filter);
		// on key press exit
		if (waitKey(30) >= 0) break;

	}

}
