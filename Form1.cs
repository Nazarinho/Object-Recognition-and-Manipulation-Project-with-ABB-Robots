using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ABB.Robotics;
using ABB.Robotics.Controllers;
using ABB.Robotics.Controllers.Discovery;
using ABB.Robotics.Controllers.RapidDomain;
using System.Threading;
using System.IO;

namespace PCSDK_Csharp_BasicScanApp_560
{
    public partial class Form1 : Form
    {
        System.Windows.Forms.Timer timer = new System.Windows.Forms.Timer();

        //ABB Variables to be transfered
        private NetworkScanner scanner = new NetworkScanner();
        private Controller controller = null;
        ABB.Robotics.Controllers.RapidDomain.Task[] aTask;
        ABB.Robotics.Controllers.RapidDomain.RapidData rdice;
        ABB.Robotics.Controllers.RapidDomain.RapidData rangle;
        ABB.Robotics.Controllers.RapidDomain.RapidData rx;
        ABB.Robotics.Controllers.RapidDomain.RapidData ry;
        ABB.Robotics.Controllers.RapidDomain.RapidData roffset;
        ABB.Robotics.Controllers.RapidDomain.Num val;
        public bool flag;
        public double max=0;
        string ubicacion = @"C:\Users\Nazarinho\Documents\RobotStudio\Systems\System3\HOME\example.txt";

        public Form1()
        {
            InitializeComponent();
            InitializeTimer();
            flag = false;
        }
        void update_values()
        {
            DateTime t0 = DateTime.Now;

            rdice = aTask[0].GetRapidData("MainModule", "dice_txt");
            rangle = aTask[0].GetRapidData("MainModule", "angle_txt");
            rx = aTask[0].GetRapidData("MainModule", "x_txt");
            ry = aTask[0].GetRapidData("MainModule", "y_txt");
            roffset = aTask[0].GetRapidData("MainModule", "roffset");
            try
            {
                if (rx.Value is ABB.Robotics.Controllers.RapidDomain.Num)
                {
                    val = (ABB.Robotics.Controllers.RapidDomain.Num)rx.Value;
                    val.FillFromNum(arr[0]);
                    using (Mastership.Request(this.controller.Rapid))
                    {
                        rx.Value = val;
                    }
                }

                if (ry.Value is ABB.Robotics.Controllers.RapidDomain.Num)
                {
                    val = (ABB.Robotics.Controllers.RapidDomain.Num)ry.Value;
                    val.FillFromNum(arr[1]);
                    using (Mastership.Request(this.controller.Rapid))
                    {
                        ry.Value = val;
                    }
                }
                if (rdice.Value is ABB.Robotics.Controllers.RapidDomain.Num)
                {
                    val = (ABB.Robotics.Controllers.RapidDomain.Num)rdice.Value;
                    val.FillFromNum(arr[2]);
                    using (Mastership.Request(this.controller.Rapid))
                    {
                        rdice.Value = val;
                    }
                }
                if (rangle.Value is ABB.Robotics.Controllers.RapidDomain.Num)
                {
                    val = (ABB.Robotics.Controllers.RapidDomain.Num)rangle.Value;
                    val.FillFromNum(arr[3]);
                    using (Mastership.Request(this.controller.Rapid))
                    {
                        rangle.Value = val;
                    }
                }

                //Register time intervar for updating//
                double total_D;
                DateTime t1 = DateTime.Now;

                TimeSpan total = new TimeSpan(t1.Ticks - t0.Ticks);
                total_D = total.TotalMilliseconds;
                if (total_D > max)
                {
                    max = total_D;
                }

                textBox2.Text = (max.ToString());
                /////////////////////////////////////
                if (roffset.Value is ABB.Robotics.Controllers.RapidDomain.Num)
                {
                    val = (ABB.Robotics.Controllers.RapidDomain.Num)roffset.Value;
                    val.FillFromNum(total_D);
                    using (Mastership.Request(this.controller.Rapid))
                    {
                        roffset.Value = val;
                    }
                }
            }

            catch (System.Exception ex)
            {
               MessageBox.Show("Reading ERROR: " + ex.Message);
            }
        }

        private void btnScan_Click(object sender, EventArgs e)
        {
            DisableControllerFunctionality();
            listView1.Items.Clear();
            this.scanner.Scan();
            ControllerInfoCollection controllers = scanner.Controllers;

            ListViewItem item = null;
            foreach (ControllerInfo controllerInfo in controllers)
            {
                item = new ListViewItem(controllerInfo.IPAddress.ToString());
                item.SubItems.Add(controllerInfo.Availability.ToString());
                item.SubItems.Add(controllerInfo.IsVirtual.ToString());
                item.SubItems.Add(controllerInfo.SystemName);
                item.SubItems.Add(controllerInfo.Version.ToString());
                item.SubItems.Add(controllerInfo.ControllerName);
                this.listView1.Items.Add(item);
                item.Tag = controllerInfo;
            }
        }

        private void EnableControllerFunctionality()
        {
            // put all the enable and disable functionality in the same place so that it is easy to reuse
            label1.Visible = false;
            listView1.Enabled = false;
            gbxControllerSelected.Visible = true;

        }
        private void DisableControllerFunctionality()
        {
            // put all the enable and disable functionality in the same place so that it is easy to reuse
            label1.Visible = true;
            listView1.Enabled = true;
            gbxControllerSelected.Visible = false;
            if (this.controller != null) //if selecting a new controller
            {
                this.controller.Logoff();
                this.controller.Dispose();
                this.controller = null;
            }
        }

        private void StartProduction()
        {
            try
            {
                if (controller.OperatingMode == ControllerOperatingMode.Auto)
                {
                    using (Mastership m = Mastership.Request(controller.Rapid))
                    {
                        aTask[0].SetProgramPointer("MainModule", "main");
                        this.controller.Rapid.Start();
                    }
                }
                else
                {
                    MessageBox.Show("Automatic mode is required to start execution from a remote client.");
                }
            }
            catch (System.InvalidOperationException ex)
            {
                MessageBox.Show("Mastership is held by another client. " + ex.Message);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Unexpected error occurred: " + ex.Message);
            }
        }

        private void listView1_DoubleClick_1(object sender, EventArgs e)
        {
            ListViewItem item = this.listView1.SelectedItems[0]; if (item.Tag != null)
            {
                ControllerInfo controllerInfo = (ControllerInfo)item.Tag;
                if (controllerInfo.Availability == Availability.Available)
                {
                    if (controllerInfo.IsVirtual)
                    {
                        this.controller = ControllerFactory.CreateFrom(controllerInfo);
                        this.controller.Logon(UserInfo.DefaultUser);
                        listView1.Items.Clear();
                        listView1.Items.Add(item);
                        EnableControllerFunctionality();
                    }
                    else //real controller
                    {
                        if (MessageBox.Show("This is NOT a virtual controller, do you really want to connect to that?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.Yes)
                        {
                            this.controller = ControllerFactory.CreateFrom(controllerInfo);
                            this.controller.Logon(UserInfo.DefaultUser);
                            listView1.Items.Clear();
                            listView1.Items.Add(item);
                            EnableControllerFunctionality();
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Selected controller not available.");
                }

            }
        }

        private void btnProduction_Click_1(object sender, EventArgs e)
        {
            if (controller.IsVirtual)
            {
                StartProduction();
            }
            else
            {
                if (MessageBox.Show("Do you want to start production for the selected controller?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.Yes)
                {
                    StartProduction();
                }
            }
        }

        private void InitializeTimer()
        {
            // Call this procedure when the application starts.  
            // Set to 1,5 second. CHECK IT OUT FOR SOME MUTEX   
            timer1.Interval = 1500;
            timer1.Tick += new EventHandler(timer1_Tick);

            // Enable timer.  
            timer1.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (controller.State == ABB.Robotics.Controllers.ControllerState.MotorsOff)
            {
                controller.State = ABB.Robotics.Controllers.ControllerState.MotorsOn;
            }
            else
            {
                controller.State = ABB.Robotics.Controllers.ControllerState.MotorsOff;
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();

            openFileDialog1.Title = "Open RAPID Program";
            openFileDialog1.FileName = "mainModule";
            openFileDialog1.Filter = "RAPID Modules (*.mod,*.sys)|*.mod;*.sys";
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                string ModuleFileName = openFileDialog1.FileName;
                //MessageBox.Show(ModuleFileName);
                loadModule(ModuleFileName);
            }
        }

        void loadModule(string ModuleFileName)
        {
            bool load_flag = true;
            aTask = controller.Rapid.GetTasks();
            
            string ProgramFileName = Path.ChangeExtension(ModuleFileName, ".prg");
            try
            {
                using (Mastership m = Mastership.Request(controller.Rapid))
                {
                    controller.FileSystem.RemoteDirectory = "(HOME)$";
                    if (controller.FileSystem.FileExists(Path.GetFileName(ModuleFileName)) == true)
                    {
                        controller.FileSystem.RemoveFile(Path.GetFileName(ModuleFileName));
                    }
                    if (controller.FileSystem.FileExists(Path.GetFileName(ProgramFileName)) == true)
                    {
                        controller.FileSystem.RemoveFile(Path.GetFileName(ProgramFileName));
                    }
                    controller.FileSystem.PutFile(ModuleFileName, Path.GetFileName(ModuleFileName));
                    controller.FileSystem.PutFile(ModuleFileName, Path.GetFileName(ProgramFileName));
                    if (controller.IsVirtual)
                    {
                        aTask[0].LoadModuleFromFile(ModuleFileName, ABB.Robotics.Controllers.RapidDomain.
                        RapidLoadMode.Replace);
                    }
                    else
                    {
                        aTask[0].LoadProgramFromFile(Path.GetFileName(ProgramFileName), ABB.Robotics.
                        Controllers.RapidDomain.RapidLoadMode.Replace);
                    }
                }
                 load_flag = false;
                 flag = false;
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message);
            }
            catch (System.InvalidOperationException ex)
            {
                MessageBox.Show("Mastership is held by another client. " + ex.Message);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Unexpected error occurred: " + ex.Message);
            }

            if (!load_flag)
            {
                flag = true;
                update_values();
            }
        }

        int i = 0;
        string line, leer;
        public int[] arr = new int[4];
        private void timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                leer = File.ReadAllText(ubicacion);//Optional for testing.
                textBox1.Text = leer;//Optional for testing.    

                System.IO.StreamReader file = new System.IO.StreamReader(ubicacion);
                while ((line = file.ReadLine()) != null)
                {
                    arr[i] = Convert.ToInt16(line);
                    i++;
                }
                file.Close();
                file.Dispose();
                i = 0;
                if (flag)
                {
                    update_values();
                }
            }
            catch (System.Exception ex)
            {
               //MessageBox.Show("Writing ERROR: " + ex.Message);
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {
            label3.Text = "update( )";
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}