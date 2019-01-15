MODULE MainModule
	CONST robtarget ini_calib:=[[513.37,-8.21,709.60],[0.694864,0.0178388,0.718894,0.00609548],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget home:=[[443.79,-6.03,647.43],[0.011892,-0.694236,-0.719505,0.0144055],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    	CONST robtarget prep_tiro:=[[232.33,-487.86,752.30],[0.584036,0.581642,0.557308,-0.100011],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget tiro:=[[226.47,-481.84,676.00],[0.556048,0.628426,0.537461,-0.0838329],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget check:=[[-2.87,412.23,659.19],[0.0367079,-0.702818,0.709832,0.0289372],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget place:=[[230.93,468.25,645.60],[0.0295245,-0.519968,0.853521,0.016261],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget uno:=[[-218.00,460.63,527.08],[0.00170817,-0.725236,0.688457,-0.00747331],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget dos:=[[-127.79,462.77,528.46],[0.000724799,-0.697285,0.716793,0.0010589],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget tres:=[[-21.55,458.93,526.84],[0.00907101,-0.711528,0.702522,0.010378],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget cuatro:=[[-22.96,541.16,528.83],[0.0235663,-0.70958,0.703751,0.0259729],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget cinco:=[[-125.31,541.05,527.81],[0.0200637,-0.701507,0.711598,0.033372],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget seis:=[[-218.29,540.01,527.18],[0.011518,-0.705568,0.708093,0.0254155],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget uno_ubi:=[[76.55,460.03,528.62],[0.0135862,-0.710663,0.70333,0.0100371],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget dos_ubi:=[[160.53,462.97,530.59],[0.0206012,-0.702979,0.710834,0.0105474],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget tres_ubi:=[[240.04,464.16,530.42],[0.029173,-0.699184,0.714276,0.0100106],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget cuatro_ubi:=[[238.38,556.84,533.27],[0.044002,-0.699097,0.713431,0.018539],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget cinco_ubi:=[[157.42,553.82,529.83],[0.0249028,-0.700748,0.712825,0.0145902],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget seis_ubi:=[[74.53,551.18,528.95],[0.0151343,-0.701004,0.712892,0.012201],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

CONST robtarget uno_check:=[[-213.60,447.91,557.52],[0.014322,-0.725874,0.687212,0.0253319],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget dos_check:=[[-125.93,452.12,560.22],[0.019827,-0.697482,0.715425,0.0359428],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget tres_check:=[[-21.24,452.34,567.06],[0.0448284,-0.710034,0.701018,0.0491508],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget cuatro_check:=[[-22.74,536.01,564.97],[0.051818,-0.707942,0.7021,0.0564678],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget cinco_check:=[[-124.99,534.85,557.65],[0.0372401,-0.700939,0.709591,0.061476],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget seis_check:=[[-213.15,526.90,568.00],[0.0274766,-0.704238,0.706607,0.0632498],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget uno_ubi_check:=[[75.40,452.28,557.29],[0.0437942,-0.709637,0.702505,0.0313734],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget dos_ubi_check:=[[160.41,453.88,556.65],[0.0492496,-0.699996,0.712027,0.0244531],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget tres_ubi_check:=[[237.61,451.44,569.18],[0.0715254,-0.694955,0.715094,0.0236986],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget cuatro_ubi_check:=[[236.93,548.17,556.78],[0.0644588,-0.696949,0.713714,0.0268442],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget cinco_ubi_check:=[[157.50,539.50,564.92],[0.0555392,-0.697079,0.714134,0.0317447],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget seis_ubi_check:=[[74.66,544.71,561.77],[0.0439698,-0.699412,0.712531,0.0344844],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

!CALIBRATION
	CONST robtarget check1:=[[603.54,-136.15,660.29],[0.00695073,-0.699697,-0.714359,-0.0081626],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget calib1:=[[605.93,-142.28,634.90],[0.0213599,-0.670558,-0.741546,0.00213134],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget check2:=[[637.83,-153.44,654.30],[0.0310703,0.715673,0.697073,0.0306035],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget calib2:=[[643.49,-150.51,635.79],[0.00567651,-0.659228,-0.751884,-0.00753887],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget check3:=[[622.63,-52.60,673.57],[0.0683725,0.722923,0.684493,0.0646287],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget calib3:=[[641.50,-58.26,638.32],[0.0208219,0.647769,0.76136,0.017078],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

!COMUNICATION!////TESTED AND CHANGES THE VALUE OF THE VARIABLE
PERS num dice_txt:=0; 
PERS num angle_txt:=0;
PERS num x_txt:=0;
PERS num y_txt:=0;
PERS num roffset:=210.075;
VAR num x_aux:=0;
VAR num y_aux:=0;
!COMUNICATION!
VAR robtarget distancia1;
VAR robtarget distancia2;
VAR robtarget distancia3;
VAR robtarget distancia4;
VAR intnum dice;
VAR num num_dice:=0;
VAR bool data_dice:=FALSE;

VAR bool one:=FALSE;
VAR bool two:=FALSE;
VAR bool three:=FALSE;
VAR bool four:=FALSE;
VAR bool five:=FALSE;
VAR bool six:=FALSE;

VAR bool repeat_one:=FALSE;
VAR bool repeat_two:=FALSE;
VAR bool repeat_three:=FALSE;
VAR bool repeat_four:=FALSE;
VAR bool repeat_five:=FALSE;
VAR bool repeat_six:=FALSE;
    
VAR num x:=0;
VAR num y:=0;
VAR num z:=0;
VAR num Toff:=0;
VAR num Timed:=0;
VAR num Velc:=0;
VAR num dist_y0:=0;
VAR num dist_y:=0;
VAR num angle:=0;
VAR num aux:=0;
VAR num cont:=0;
    
VAR num u1:=0;
VAR num u2:=0;
VAR num u3:=0;
VAR num v1:=0;
VAR num v2:=0;
VAR num v3:=0;
    !Calib data
VAR num x1:=0;
VAR num x2:=0;
VAR num x3:=0;
VAR num y1:=0;
VAR num y2:=0;
VAR num y3:=0;
VAR num z3:=0;
    !Home tool position!
VAR num hx:=0;
VAR num hy:=0;
VAR num hz:=0;
    !Coefficients for target calc!
VAR num Kx:=0;
VAR num Ky:=0;

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
PROC initi_vars()
	num_dice:=0;
	!data_dice:=FALSE;
	one:=FALSE;
	two:=FALSE;
	three:=FALSE;
	four:=FALSE;
	five:=FALSE;
	six:=FALSE;
	repeat_one:=FALSE;	
	repeat_two:=FALSE;
	repeat_three:=FALSE;
	repeat_four:=FALSE;	
	repeat_five:=FALSE;
	repeat_six:=FALSE;  
	x:=0;
	y:=0;
	z:=0;
	x_aux:=0;
	y_aux:=0;
	Timed:=0;
	Velc:=0;
	dist_y0:=0;
	dist_y:=0;
	angle:=0;
	aux:=0;
	cont:=0;
	Toff:=1500;  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	u1:=0;
	u2:=0;
	u3:=0;
	v1:=0;
	v2:=0;
	v3:=0;
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
    !Calib data
	x1:=calib1.trans.x; !-7.51
	x2:=calib2.trans.x;
	x3:=calib3.trans.x;
	y1:=calib1.trans.y;
	y2:=calib2.trans.y;
	y3:=calib3.trans.y;
	z3:=calib3.trans.z;    !!!safety tracking, check3 (z) !!!
    !Home tool position!
	hx:=home.trans.x;
	hy:=home.trans.y;
	hz:=home.trans.z;
    !Coefficients for target calc.!
	Kx:=0;
	Ky:=0;
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ENDPROC
    
PROC CALIB()
	MoveJ check,v60,z30, tool0;
	MoveJ uno_check,v60,fine, tool0;
        MoveL uno,v40,fine, tool0;
        WaitTime 1;
	SetDO pinzas, 1;
	WaitTime 1;
	MoveJ uno_check,v60,fine, tool0;
	MoveJ check,v60,z30, tool0;
	
MoveJ home, v100, z30, tool0;
MoveJ check1, v40, z30, tool0;	
MoveJ calib1,v20,fine,tool0;
	SetDO pinzas, 0;
WaitTime 2;	

MoveJ check1, v40, z30, tool0;	
MoveJ home, v60, z30, tool0;
        
WHILE CONT<200 DO
        MoveJ home, v60, z30, tool0;  
        IF (x_txt>0 AND y_txt>0) THEN
        u1:=x_txt;
        v1:=y_txt;
        ENDIF
        CONT:=CONT+1;
ENDWHILE
CONT:=0;

MoveJ check1, v40, z30, tool0;	
MoveJ calib1,v20,fine, tool0;
	SetDO pinzas, 1;
WaitTime 1;
MoveJ check1, v40, z30, tool0;	

MoveJ check2,v40,z30, tool0;
MoveJ calib2,v20,fine, tool0;
SetDO pinzas, 0;
WaitTime 2;
MoveJ check2,v40,z30, tool0;
MoveJ home,v60, z30, tool0;

WHILE cont<200 DO
        MoveJ home,v60, z30, tool0;
        IF (y_txt>0) THEN
        v2:=y_txt;
	    u2:=u1;
        ENDIF
CONT:=CONT+1;
ENDWHILE
CONT:=0;
	
MoveJ check2,v40,z30, tool0;
MoveJ calib2,v20,fine, tool0;
	SetDO pinzas, 1;
WaitTime 1;
MoveJ check2,v40,z30, tool0;
MoveJ check3,v40,z30, tool0;
MoveJ calib3,v20,fine, tool0;
	SetDO pinzas, 0;
WaitTime 2;
MoveJ check3,v40,z30, tool0;
MoveJ home,v60, z30, tool0;

WHILE cont<200 DO
    MoveJ home,v60, z30, tool0;
     IF (x_txt>0) THEN
        u3:=x_txt;
	    v3:=v2;
        ENDIF 
    CONT:=CONT+1;
ENDWHILE
CONT:=0;

MoveJ check3,v40,z30, tool0;
MoveJ calib3,v20,fine, tool0;
	SetDO pinzas, 1;
WaitTime 1;
MoveJ check3,v40,z30, tool0;
MoveJ home,v60, z30, tool0;

	MoveJ check,v60,z30, tool0;
	MoveJ uno_check,v60,fine, tool0;
        MoveL uno,v40,fine, tool0;
	WaitTime 1;
	SetDO pinzas, 0;
	WaitTime 1;
	MoveJ uno_check,v60,fine, tool0;
	MoveJ check,v60,z30, tool0;

Kx:=(x2-x1)/(v2-v1);
Ky:=(y3-y2)/(u3-u2);

TPWrite"Kx:"\Num:=Kx;
TPWrite"Ky:"\Num:=Ky;

ENDPROC
    
PROC ReadFile() 
   IF(dice_txt=0) THEN
   data_dice:=FALSE;
   ELSE IF (dice_txt>0) THEN
   data_dice:=TRUE;
        IF(dice_txt=1) THEN
            one:=TRUE;
        ELSEIF (dice_txt=2) THEN
            two:=TRUE;
        ELSEIF (dice_txt=3) THEN
            three:=TRUE;
        ELSEIF (dice_txt=4) THEN
            four:=TRUE;
        ELSEIF (dice_txt=5) THEN
            five:=TRUE;
        ELSEIF (dice_txt=6) THEN
            six:=TRUE;
        ENDIF
   ENDIF
   ENDIF   
ENDPROC

PROC DICE_PICKING()
     MoveJ check,v100,z100,tool0;
     WaitTime 1;
       IF(num_dice=5) THEN
	    MoveJ uno_check,v60,z30,tool0;
            MoveL uno,v40,fine,tool0;
            WaitTime 1;
	    SetDO pinzas, 1;
	    WaitTime 1;
	    MoveJ uno_check,v60,z30,tool0;
	    MoveJ check,v60,z30,tool0;         
        ELSEIF(num_dice=4) THEN
	    	MoveJ dos_check,v60,z30,tool0;
            	MoveL dos,v40,fine,tool0;
           	WaitTime 1;
	    	SetDO pinzas, 1;
		WaitTime 1; 
		MoveJ dos_check,v60,z30,tool0;
		MoveJ check,v60,z30,tool0;
            ELSEIF(num_dice=3) THEN
	    		MoveJ tres_check,v60,z30,tool0;
            		MoveL tres,v40,fine,tool0;
            		WaitTime 1;
	    		SetDO pinzas, 1;
			WaitTime 1;
			MoveJ tres_check,v60,z30,tool0;
			MoveJ check,v60,z30,tool0;        
                ELSEIF(num_dice=2) THEN
	    			MoveJ cuatro_check,v60,z30,tool0;
            			MoveL cuatro,v40,fine,tool0;
            			WaitTime 1;
	    			SetDO pinzas, 1;
				WaitTime 1;
				MoveJ cuatro_check,v60,z30,tool0;
				MoveJ check,v60,z30,tool0; 
                    ELSEIF(num_dice=1) THEN
	    				MoveJ cinco_check,v60,z30,tool0;
            				MoveL cinco,v40,fine,tool0;
            				WaitTime 1;
	    				SetDO pinzas, 1;
					WaitTime 1;
					MoveJ cinco_check,v60,z30,tool0;
					MoveJ check,v60,z30,tool0; 
                        ELSEIF(num_dice=0) THEN
	    					MoveJ seis_check,v60,z30,tool0;
            					MoveL seis,v40,fine,tool0;
            					WaitTime 1;
	    					SetDO pinzas, 1;
						WaitTime 1;
						MoveJ seis_check,v60,z30,tool0;
						MoveJ check,v60,z30,tool0; 
        ENDIF
ENDPROC

PROC DICE_THROWING()
    MoveJ home, v100, z30, tool0;
    MoveJ prep_tiro, v100, z30, tool0;
    MoveJ tiro, v100, z30, tool0;
    WaitTime 1; 
    SetDO pinzas, 0;
ENDPROC

PROC DICE_TRACKING()
        x_aux:=x_txt;
        y_aux:=y_txt;
        angle:=angle_txt;
	TPWrite"read_angle:"\Num:=angle; !Optional for testing
	IF(angle<0 or angle>90)THEN
	angle:=0;
	ENDIF
	IF(angle>0 and angle<45)THEN
	angle:=-angle;
	ELSE IF (angle>45 and angle<90)THEN
	angle:=90-angle;
	ENDIF
	ENDIF
	TPWrite"angle:"\Num:=angle; !Optional for testing
        x:=((y_aux-v1)*Kx) + x1;
        y:=((x_aux-u2)*Ky) + y2;
        x:=x-hx;
        y:=y-hy;
        z:=z3-hz;
   	roffset:=roffset/1000;
	TPWrite"off:"\Num:=roffset; !Optional for testing
	dist_y:=y+Velc*(Timed+Toff+roffset); !there is 1.5 + 0.216 s. offset

        MoveJ home, v100, z30, tool0;
        distancia1:=Offs(home, x,dist_y,13);
        distancia2:=Offs(distancia1, 0,70,-9); ! TESTING
	distancia3:=Offs(distancia2, 0,20,z); ! TESTING 
	distancia4:=Offs(distancia3, 5,0,40);                   
        MoveL RelTool(distancia1,0,0,0,\Rz:=angle), vmax\T:=Timed, fine, tool0;
	MoveL RelTool(distancia2,0,0,0,\Rz:=angle), vmax\V:=Velc, fine, tool0;
	MoveL RelTool(distancia3,0,0,0,\Rz:=angle), vmax\V:=Velc, fine, tool0;	
	SetDO pinzas, 1; 
	MoveL distancia4, vmax\V:=Velc, fine, tool0;  
ENDPROC

PROC DICE_PLACEMENT()
        MoveJ place,v100,z100,tool0;
        IF(one=TRUE and repeat_one=FALSE) THEN
            num_dice:=num_dice+1;
            repeat_one:=TRUE;
	    MoveJ uno_ubi_check,v60,z30,tool0;		
            MoveL uno_ubi,v40,fine,tool0;
            WaitTime 1;
	    SetDO pinzas, 0;
	    WaitTime 1;
            MoveJ uno_ubi_check,v60,z30,tool0;
            TPWrite "1";
        ELSEIF(two=TRUE and repeat_two=FALSE) THEN
            	num_dice:=num_dice+1;
            	repeat_two:=TRUE;
	    	MoveJ dos_ubi_check,v60,z30,tool0;		
            	MoveL dos_ubi,v40,fine,tool0;
            	WaitTime 1;
	    	SetDO pinzas, 0;
		WaitTime 1;
		MoveJ dos_ubi_check,v60,z30,tool0;
            	TPWrite "2";
            ELSEIF(three=TRUE and repeat_three=FALSE) THEN
                	num_dice:=num_dice+1;
                	repeat_three:=TRUE;
	    		MoveJ tres_ubi_check,v60,z30,tool0;		
            		MoveL tres_ubi,v40,fine,tool0;
            		WaitTime 1;
	    		SetDO pinzas, 0;
			WaitTime 1;
			MoveJ tres_ubi_check,v60,z30,tool0;
               		TPWrite "3";
                ELSEIF(four=TRUE and repeat_four=FALSE) THEN
                    		num_dice:=num_dice+1;
                    		repeat_four:=TRUE;
	    			MoveJ cuatro_ubi_check,v60,z30,tool0;		
            			MoveL cuatro_ubi,v40,fine,tool0;
            			WaitTime 1;
	    			SetDO pinzas, 0;
				WaitTime 1;
				MoveJ cuatro_ubi_check,v60,z30,tool0;
                    		TPWrite "4";
                    ELSEIF(five=TRUE and repeat_five=FALSE) THEN
                        		num_dice:=num_dice+1;
                        		repeat_five:=TRUE;
	    				MoveJ cinco_ubi_check,v60,z30,tool0;		
            				MoveL cinco_ubi,v40,fine,tool0;
            				WaitTime 1;
	    				SetDO pinzas, 0;
					WaitTime 1;
					MoveJ cinco_ubi_check,v60,z30,tool0;
                        		TPWrite "5";
                        ELSEIF(six=TRUE and repeat_six=FALSE) THEN
                            			num_dice:=num_dice+1;
                            			repeat_six:=TRUE;
	    					MoveJ seis_ubi_check,v60,z30,tool0;		
            					MoveL seis_ubi,v40,fine,tool0;
            					WaitTime 1;
	    					SetDO pinzas, 0;
						WaitTime 1;
						MoveJ seis_ubi_check,v60,z30,tool0;
                            			TPWrite "6";
        ENDIF
ENDPROC

PROC DICE_ANALYSIS()
 IF(one=TRUE and repeat_one=FALSE) THEN ! Si es un 1 i no esta repetit fes                                                        
        DICE_TRACKING; !busca el dau
        DICE_PLACEMENT;!situa el dau
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF
    ELSEIF (two=TRUE and repeat_two=FALSE) THEN ! Si es un 2 i no esta repetit fes  
        DICE_TRACKING;
        DICE_PLACEMENT;
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF
    ELSEIF (three=TRUE and repeat_three=FALSE) THEN ! Si es un 3 i no esta reptit fes
        DICE_TRACKING;
        DICE_PLACEMENT;
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF
    ELSEIF (four=TRUE and repeat_four=FALSE) THEN ! Si es un 4 i no esta repetit fes                             
        DICE_TRACKING;
        DICE_PLACEMENT;
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF
    ELSEIF (five=TRUE and repeat_five=FALSE) THEN ! Si es un 5 i no esta repetit fes 
        DICE_TRACKING;
        DICE_PLACEMENT;
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF
    ELSEIF (six=TRUE and repeat_six=FALSE) THEN ! Si es un 6 i no esta repetit fes 
        DICE_TRACKING;
        DICE_PLACEMENT;
        IF (num_dice<=5) THEN
        DICE_PICKING;  !agafa un altre
        DICE_THROWING; !tira-ho
        ENDIF                           
   !Amb les dades rebudes analitza                            
    ELSEIF(one=TRUE and repeat_one=TRUE) THEN ! Si es un 1 i esta repetit
        DICE_TRACKING; !el buscas 
        DICE_THROWING; !el tornas a tirar
    ELSEIF (two=TRUE and repeat_two=TRUE) THEN ! Si es un 2 i esta repetit                           
        DICE_TRACKING;
        DICE_THROWING;
    ELSEIF (three=TRUE and repeat_three=TRUE) THEN ! Si es un 3 i esta repetit
        DICE_TRACKING;
        DICE_THROWING;
    ELSEIF (four=TRUE and repeat_four=TRUE) THEN ! Si es un 4 i esta repetit                          
        DICE_TRACKING;
        DICE_THROWING;
    ELSEIF (five=TRUE and repeat_five=TRUE) THEN ! Si es un 5 i esta repetit                            
        DICE_TRACKING;
        DICE_THROWING; 
    ELSEIF (six=TRUE and repeat_six=TRUE) THEN ! Si es un 6 i esta repetit                            
        DICE_TRACKING;
        DICE_THROWING;
    ENDIF          
ENDPROC

    PROC main()
SetDO pinzas, 0;
MoveJ ini_calib, v40, fine, tool0;       
initi_vars;
TPReadNum Velc," Itrodueix velocitat de la cinta :";
TPReadNum Timed,"Itrodueix temps de recollida    :";

        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        !!!!!!!!!!!!!!!CALIBRATION!!!!!!!!!!!!!!!!!!!!!!!
        MoveJ home, v40, z30, tool0;
        CALIB; !JUST FOR TESTING provisional values Kx:=0.355417 and Ky:=0.281433
        !!!!!!!!!!!!!!!CALIBRATION!!!!!!!!!!!!!!!!!!!!!!!
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        DICE_PICKING; !Agafa el primer dau
        DICE_THROWING; !El tiras
        WHILE(num_dice<=5)DO ! Mentre no acabis amb tots el daus fes                
                   WHILE(data_dice=FALSE)DO ! Mentre no hi han dades del dau espera
                   ! LLEGEIXO L'ARXIU AMB DADES DE CAMERA
                   ! EN EL MOMENT QUE OBTENIM LA LECTURA DEL DAU DIFERENT A 0
                   ! JA DISPOSO DE TOTES LES DADES NECESÀRIES PER RECOLLIR EL DAU
                   ! SURTO DEL BUCLE PER PODER ATENDRE LA RECOLLIDA.
                   ReadFile;
                   ! S'HA DE TENIR MOLT EN COMPTE EL RETARD I OFFSET PER ANAR A BUSCAR EL DAU               
                   MoveJ home, v100, fine, tool0;
                    ENDWHILE
                    data_dice:=FALSE;
                    !Amb les dades rebudes analitza
                    DICE_ANALYSIS;

        ENDWHILE 
        MoveJ home, v100, z30, tool0;             
    ENDPROC

    
ENDMODULE