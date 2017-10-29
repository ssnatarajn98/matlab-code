% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 111 207

% Assignment: LeapYEar
% Date: 18 11 2016
function [] = leapyear(a, b )

if(a > b)
    z = b;
    q = a;
    a = z;
    b = q;
end
while(a <= b)
    if(mod(a, 4) == 0)
        if(mod(a, 100) == 0)
            if(mod(a, 400) == 400)
                fprintf('%.0f \n', a)
            end
        else
            fprintf('%.0f \n', a)
        end
    end
    a = a +1;
end 
end