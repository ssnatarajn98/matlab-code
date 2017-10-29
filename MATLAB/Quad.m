% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 11 - 207
% 
% Assignment: BONUS_MATLAB2_ QUADRATIC
% Date: 11 16 2016
function [ ] = Quad(a, b, c)
if(isscalar(a)~=1 | isscalar(b)~=1 | isscalar(c)~=1);
    disp('Please enter scalar numbers \n');
    x1 = 'NaN \n';
    fprintf('x1 = %s\n',x1)
elseif(isreal(a)~=1 | isreal(b)~=1 | isreal(c)~=1);
    disp('Please enter real numbers \n');
    x1 = 'NaN \n';
    fprintf('x1 = %s\n',x1)
elseif(isnumeric(a)~=1 | isnumeric(b)~=1 | isnumeric(c)~=1);
    disp('Please enter numeric numbers \n');
    x1 = 'NaN \n';
    fprintf('x1 = %s\n',x1)
elseif(a ==0);
    disp('A is 0 \n')
    x1 = -c/b;
    x2 = 'NaN \n';
    fprintf('x1 = %f \n',x1)
    fprintf('x2 = %s \n',x2)
elseif((b^2-(4*a*c))==0);
    disp('The discriminant is 0')
    x1 = (-b)/(2*a);
    x2 = x1;
    disp(x1)
    fprintf('x1 = %f\n',x1)
    fprintf('x2 = %f\n',x2) 
elseif((b^2-(4*a*c))<0);
    disp('The discriminant is negative')
    x1 = (-b+sqrt(b^2-(4*a*c)))/(2*a);
    fprintf('x1 = %f \n',x1)
    x2 = (-b-sqrt(b^2-(4*a*c)))/(2*a);
    fprintf('x2 = %f \n',x2)
end