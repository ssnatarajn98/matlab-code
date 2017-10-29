clear
myev3 = legoev3('usb')
rotmotor = motor(myev3,'A');
ballcount = 0;
LocationCases = 1:9;
LocationDegrees = [ 0.5 ,30, 59, 91, 120, 150, 180, 210, 240 ] 
CurrentLocation = 1;

while(ballcount~=75)
   NewLocation = input('enter value');
   NegativeDirection = ((LocationDegrees(NewLocation) - LocationDegrees(CurrentLocation))-360)*-1;
   PositiveDirection =  (LocationDegrees(NewLocation) - LocationDegrees(CurrentLocation));
   if(PositiveDirection>=NegativeDirection)
       resetRotation(rotmotor)
       RotationVal = 0;
       start(rotmotor)
       while(RotationVal < (NegativeDirecation*-1)-10)
              RotationVal = readRotation(rotmotor);
       end
       
       stop(rotmotor)
   else  
       resetRotation(rotmotor)
       RotationVal = 0;
       start(rotmotor)
       while(RotationVal < PositiveDirection)
       RotationVal = readRotation(rotmotor);
       end
       stop(rotmotor)
   end
   CurrentLocation = NewLocationCase
   BallCount = BallCount+ 1;
end
           
           
    
    
  
    