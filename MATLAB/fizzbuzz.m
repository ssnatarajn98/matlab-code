% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram
% Section: ENGR 111 - 207
% Assignment: CFU 3
% Date: 9 11 2016
function [] = fizzbuzz( fizz , buzz , Ulimit)
for (i = 1:1:Ulimit)
    if ( rem(i,fizz) == 0);
        if (rem(i,buzz) ==0);
            fprintf('fizzbuzz \n');
        else
            fprintf('fizz \n')
        end
    
    end
    if ( rem(i,buzz) == 0);
        if (rem(i,fizz) ==0);
            fprintf('fizzbuzz \n');
        else
            fprintf('buzz \n');
        end        
    end 
    if (rem(i,buzz) ~= 0 && rem(i,fizz) ~= 0)
        disp(i)
    end
end

            
        
     
    