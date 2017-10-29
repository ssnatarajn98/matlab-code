%%%%%%%%%%%%%%%% SUBSTASK 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
myev3 = legoev3('usb')
mytouch = touchSensor(myev3,1)
mytouch3 = touchSensor(myev3,2)
mymotor2 = motor(myev3,'A')
mymotor3 = motor(myev3,'B')

mymotor2.Speed = 0;
mymotor3.Speed = 30;
start(mymotor2)
start(mymotor3)
y = 'speed1';
x = 0;
oldy='speed1';
oldy = y
b=1
    while(b ==1)
        if(readTouch(mytouch)==1)
            switch y
                case 'speed1'
                    y = 'speed2'
                    pause(.3)
                case 'speed2'
                    y='speed3'
                    pause(.3)
                case 'speed3'
                    y='speed1'
                    pause(.3)
            end
            oldy = y
        elseif(readTouch(mytouch3)==1)
            
             pause(.3)
             switch x
                 case 0
                     x=1
                     y=oldy;
                     pause(.3)
                 case 1
                     x = 0
                     y='stop'
                     pause(.3)
             end
        end
         switch y 
             case 'speed1'
                 mymotor2.Speed = 18;
             case 'speed2'
                 mymotor2.Speed = 20;
             case 'speed3'
                 mymotor2.Speed = 30;
             case 'stop'
                 mymotor2.Speed = 0;
                 
             case 'start'
                 switch oldy
                    case 'speed1'
                        mymotor2.Speed = 18;
                        
                        pause(1)
                    case 'speed2'
                        mymotor2.Speed = 20;
                        
                        pause(1)
                    case 'speed3'
                        mymotor2.Speed = 30;
                        
                        pause(1)
                 end
         end
         

    end
                 
          
             
            
   






%%%%%% BARCODE READER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
%This is the Array where we will store data the colors in binary
myev3 = legoev3('usb')
mymotor3 = motor(myev3,'A')
mymotor4 = motor(myev3,'D')
mylight = colorSensor(myev3,4)

for(b=1:1:8)
    mymotor3.Speed = 10;
    mymotor4.Speed=-10;
%Starting the speed relatively fast since accuracy doesnt matter 
    start(mymotor3)
    start(mymotor4)
y=100;

%some random value that is greater than 10;
while(y>12)%black value
    y = readLightIntensity(mylight,'reflected')

    %reads the light value as reflected light and gives a value between 0
    %and 100
end
stop(mymotor3);
stop(mymotor4);
pause(1);

%for each slot, even if it doesnt matter, we will record a 0 or 1 based on



for(i=1:1:8)
   
    mymotor3.Speed = 10;
    mymotor4.Speed = -10;
    start(mymotor4)
    start(mymotor3)
    if(i==2)
        pause(1.15)
    elseif(i==3)
        pause(1.1)
    
    elseif(i==8)
        pause(1.5)
    elseif(i==4)
        pause(1.15)
    elseif(i==5)
        
        pause(1)
    else
        
    pause(1.1)
    end
    stop(mymotor3);
    stop(mymotor4);
    pause(1)
    p = readLightIntensity(mylight,'reflected')
    if(p>30)
        o=0
    else
        o=1
    end
    inputArray(i) = o;
end
disp(inputArray)
A = inputArray(1:3)
A = fliplr(A)
A = mat2str(A)
B = inputArray(4:8)
B = fliplr(B)
B = mat2str(B)
Type1Size = ' dog';
Type2Size = 'cat';
Type1 = 0;
Type2 = 0;
%now we split the arrray into the approriate size and analyze individually
DecimalNumber = 0;
switch A
    case '[0 0 1]'
        A = 'White Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[0 1 0]'
        A = 'Red Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[0 1 1]'
        A = 'Blue Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[1 0 0]'
        A = 'Steel/HDPE'
        Type1Size = 'Steel'
        Type2Size = 'HDPE'
end
switch B
    case '[0 0 0 0 1]'
        Type1 = 0
        Type2 = 0
        DecimalNumber = 1
     case '[0 0 0 1 0]'
        Type1 = 1
        Type2 = 0
        DecimalNumber = 2
      case '[0 0 0 1 1]'
        Type1 = 2
        Type2 = 0
        DecimalNumber = 3
      case '[0 0 1 0 0]'
        Type1 = 3
        Type2 = 0
        DecimalNumber = 4
      case '[0 0 1 0 1]'
        Type1 = 0
        Type2 = 1
        DecimalNumber = 5
      case '[0 0 1 1 0]'
        Type1 = 1
        Type2 = 1
        DecimalNumber = 6
       case '[0 0 0 0 1]'
        Type1 = 2
        Type2 = 1
        DecimalNumber = 7
       case '[0 1 0 0 0]'
        Type1 = 3
        Type2 = 1
        DecimalNumber = 8
       case '[0 1 0 0 1]'
        Type1 = 1
        Type2 = 2
        DecimalNumber = 9
       case '[0 1 0 1 0]'
        Type1 = 1
        Type2 = 2
        DecimalNumber = 10
       case '[0 1 0 1 1]'
        Type1 = 2
        Type2 = 2
        DecimalNumber = 11
       case '[0 1 1 0 0]'
        Type1 = 3
        Type2 = 2
        DecimalNumber = 12
       case '[0 0 0 0 1]'
        Type1 = 0
        Type2 = 3
        DecimalNumber = 13
       case '[0 1 1 1 0]'
        Type1 = 1
        Type2 = 3
        DecimalNumber = 14
       case '[0 1 1 1 1]'
        Type1 = 2
        Type2 = 3
        DecimalNumber = 15
       case '[1 0 0 0 0]'
        Type1 = 3
        Type2 = 3
        DecimalNumber = 16
end
mymotor3.Speed = -20;
mymotor4.Speed = 20;
start(mymotor3)
start(mymotor4)
pause(4.1)
stop(mymotor4)
stop(mymotor3)
Type1 = int2str(Type1);
Type2 = int2str(Type2);
clearLCD(myev3)
writeLCD(myev3,A,1,1)
writeLCD(myev3,Type1,1+1,1)
writeLCD(myev3,Type2,1+2,1)
writeLCD(myev3,Type1Size,1+1,1+1)
writeLCD(myev3,Type2Size,1+2,1+1)
pause(10)
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PELLET IDENTIFIER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
myev3 = legoev3('usb')
b=1;
mymotor2 = motor(myev3,'A')
mylight = colorSensor(myev3,1)
mysonicsensor = sonicSensor(myev3,4)
Size = readDistance(mysonicsensor);
for(i=1:1:50)
CompareColor = 1:12;
CorrectColorLocation = -1;
ColorColor = 'sdfdsf';

SizeSorter = 5;
if(Size>.048)
    Size = 'big'
    SizeSorter = 1;
else
    Size = 'small'
    SizeSorter = 0;
   
end
Color = readColorRGB(mylight);
R = Color(1);
G = Color(2);
B = Color(3);
ColorCorrect = [98 57 30;
                180 150 39;
                70 130 55;
                53 90  88;
                190 233 170;
                173 226 110;
                100 120 85;
                66 68 45;
                80 57 30;
                56 90 43;
                115 100 36;
                50 75 77;
                ]
            
for(i=1:1:12)
    Tester = ColorCorrect(i,:)
    RTest = Tester(1);
    GTest = Tester(2);
    BTest = Tester(3);
    
    sum = (abs(R-RTest))/RTest + (abs(G-GTest))/GTest + (abs(B-BTest))/BTest/3;
    CompareColor(i) = sum;
end
TheFinalRightColor = min(CompareColor);
for(i=1:1:12)
    if (TheFinalRightColor == CompareColor(i))
        CorrectColorLocation = i;
    end
end
switch CorrectColorLocation
    case 1
        ColorColor = 'red big';
        clearLCD(myev3)
        writeLCD(myev3,'SIZE:BIG',1,1)
        writeLCD(myev3,'COLOR:RED',2,1)
        writeLCD(myev3,'TYPE:GLASS',3,1)
    case 2
        ColorColor = 'yellow big';
         clearLCD(myev3)
                writeLCD(myev3,'SIZE:BIG',1,1)
                writeLCD(myev3,'COLOR:YELLOW',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 3
        ColorColor = 'Green big';
         clearLCD(myev3)
                writeLCD(myev3,'SIZE:BIG',1,1)
                writeLCD(myev3,'COLOR:GREEN',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 4
        ColorColor = 'blue big';
         clearLCD(myev3)
               writeLCD(myev3,'SIZE:BIG',1,1)
               writeLCD(myev3,'COLOR:BLUE',2,1)
               writeLCD(myev3,'TYPE:GLASS',3,1)
    case 5
        ColorColor = 'white big';
         clearLCD(myev3)
                writeLCD(myev3,'SIZE:BIG',1,1)
                writeLCD(myev3,'COLOR:WHITE',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 6
        ColorColor = 'white small';
         clearLCD(myev3)
                writeLCD(myev3,'SIZE:SMALL',1,1)
                writeLCD(myev3,'COLOR:WHITE',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 7
        ColorColor = 'opaque small';
         clearLCD(myev3)
                        writeLCD(myev3,'SIZE:SMALL',1,1)
                        writeLCD(myev3,'COLOR:WHITE',2,1)
                        writeLCD(myev3,'TYPE:HDPE',3,1)
    case 8
        ColorColor = 'metal small';
         clearLCD(myev3)
                        writeLCD(myev3,'SIZE:SMALL',1,1)
                       
                        writeLCD(myev3,'TYPE:STEEL',3,1)
    case 9
        ColorColor = 'red small';
         clearLCD(myev3)
                            writeLCD(myev3,'SIZE:SMALL',1,1)
                writeLCD(myev3,'COLOR:RED',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 10
        ColorColor = 'green small';
         clearLCD(myev3)
                            writeLCD(myev3,'SIZE:SMALL',1,1)
                writeLCD(myev3,'COLOR:GREEN',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 11
        ColorColor = 'yellow small';
         clearLCD(myev3)
                        writeLCD(myev3,'SIZE:SMALL',1,1)
                writeLCD(myev3,'COLOR:YELLOW',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
    case 12
         ColorColor = 'blue small';
         clearLCD(myev3)
                        writeLCD(myev3,'SIZE:SMALL',1,1)
                writeLCD(myev3,'COLOR:BLUE',2,1)
                writeLCD(myev3,'TYPE:GLASS',3,1)
        
    
end
pause(2)
 mymotor2.Speed = -20;%speed kicking the ball
    start(mymotor2)
    pause(.65)%how long it is kicking
    stop(mymotor2)
    pause(2)%how long it stays
    mymotor2.Speed = +5;%speed pulling out
    start(mymotor2)
    pause(.75)%how long it is pulling out
    stop(mymotor2)
    pause(5);
    end










    
    
    


   



