% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”

% Name: Sriram Natarajan
% Section: ENGR 111 - 207
% Assignment: Hailstone
% Date: 17 11 2016
function [] = HailStone(n)
disp(n)
c=0;
while ( n ~= 1)
    if (rem(n,2) == 0)
        n = n/2;
    else
        n = (3*n) + 1;
    end
    disp(n)
    if ( n > c)
        c = n;
    end
end
fprintf('The largest integer in the set is %f', c)

