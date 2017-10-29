% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Krishna Goswami
% Section: ENGR111-207

% Assignment: Leap Year
% Date: 11/18/2016
function [] = LeapYearKrishna(i, g )

if(i > g)
    d = g;
    q = i;
    i = d;
    g = q;
end
while(i <= g)
    if(mod(i, 4) == 0)
        if(mod(i, 100) == 0)
            if(mod(i, 400) == 400)
                fprintf('%.0f \n', i)
            end
        else
            fprintf('%.0f \n', i)
        end
    end
    i = i +1;
end 
end