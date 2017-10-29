% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 111-207
% Assignment: Quadratic
% Date: 11 16 2016
function [Fee] = MATLAB_2_ticketfee(Hours)
ahp = abs(Hours);
Fee = 0;
ahp = abs(Hours);
Fee = 0;

% check the hours parked and return the total fee
        if((ahp <= 2 && ahp > 0))
            Fee = 4;
        elseif((ahp > 2 && ahp <=4))
            Fee = 7;
        elseif((ahp > 4 && ahp <=21))
            Fee = 7 + (ahp - 4);
        elseif((ahp > 21 && ahp <=24))
            Fee = 24;
        elseif((ahp >= 24))
            remainder = mod(ahp,24);
            wdh = ahp - remainder;
            Fee = Fee + wdh;
            ahp = remainder;
            if(ahp <=2)
                Fee = Fee + 4;
            elseif (ahp <=4)
                Fee = Fee + 7;
            elseif (ahp <=21)
                Fee = Fee + 7 + ahp;
            else (ahp <=24)
                Fee = Fee + 24;
            end
        end
        
        if(Hours < 0)   
            Fee = Fee + 36;
        end

end