% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 111 - 207
% Assignment: CFU 5
% Date: 28 11 2016
function [] = find_2D_max()
A = [ 12, 4, 3, 6; 
    11, 9, 1, 15; 
    5 , 14,16, 18; 
    10,2, 7 ,12 ];
s = size(A);
disp(s)
n_rows = s(1);
n_col = s(2);
maxValue = 0;
maxvaluex = 0;
Maxvaluey = 0;
disp(A)

for(i=1:1:n_rows)
    for(j=1:1:n_col)
        if( A(i,j) > maxValue)
            maxValue = A(i,j);
            maxvaluex = i;
            Maxvaluey = j;
            
        end
    end
end
A(i,j) = 0;
disp(A);
fprintf(' The max value of the aray is %f \n',maxValue)
fprintf(' The max value is located at ( %f, %f) ' , maxvaluex, Maxvaluey)
