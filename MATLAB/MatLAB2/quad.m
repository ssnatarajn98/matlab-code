function [ ] = quad(a, b, c)
if(isscalar(a)~=1 || isscalar(b)~=1 || isscalar(c)~=1)
    disp('Please enter scalar numbers');
    x1 = 'NaN';
    fprintf('x1 = %s\n',x1)
elseif(isnumeric(a)~=1 || isnumeric(b)~=1 || isnumeric(c)~=1)
    disp('Please enter numeric numbers');
    x1 = 'NaN';
    fprintf('x1 = %s\n',x1)
elseif(isreal(a)~=1 || isreal(b)~=1 || isreal(c)~=1)
    disp('Please enter real numbers');
    x1 = 'NaN';
    fprintf('x1 = %s\n',x1)
elseif(a ==0)
    disp('A is 0')
    x1 = -c/b;
    x2 = 'NaN';
    fprintf('x1 = %f\n',x1)
    fprintf('x2 = %s\n',x2)
elseif((b^2-(4*a*c))<0)
    disp('The discriminant is negative')
    x1 = (-b+sqrt(b^2-(4*a*c)))/(2*a);
    fprintf('x1 = %f\n',x1)
    x2 = (-b-sqrt(b^2-(4*a*c)))/(2*a);
    fprintf('x2 = %f\n',x2)
elseif((b^2-(4*a*c))==0)
    disp('The discriminant is 0')
    x1 = (-b)/(2*a);
    x2 = x1;
    disp(x1)
    fprintf('x1 = %f\n',x1)
    fprintf('x2 = %f\n',x2)
end