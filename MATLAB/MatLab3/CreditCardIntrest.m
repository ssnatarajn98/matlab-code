% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 11 207
% Assignment: CreditCardBalance
% Date: 18 11 2016
ccb = input('credit card balance?');
mir = input(' Monthly Interest rate?');
mir = (mir*.01)/12;
x = zeros(1,25);
for i=1:1:25
z = (i*.01)*ccb;
if((1-((mir*ccb)/z))<0)
    disp('Interest accumulates faster than the monthly payment')

else
    x(i) = -(log(1-((mir*ccb)/z)))/(log(1+mir));
end    
end
disp(x)