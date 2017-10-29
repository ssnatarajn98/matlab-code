% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: YOUR NAME
% Section: YOUR SECTION NUMBER
% Team: YOUR TEAM NUMBER
% Assignment: THE NAME OF THE ASSIGNMENT
% Date: DAY MONTH YEAR

function [] = verify_magic()
A = magic(3);
s = (size(A));
disp(A)
n_rows = s(1);
n_cols = s(2);

for(j=1:1:n_cols)
    SumRow=0;
    for(i=1:1:n_rows)
        SumRow = SumRow + A(i,j);
    end
    disp(SumRow)
end
for(a=1:1:n_rows)
    SumRow=0;
    for(b=1:1:n_cols)
        SumRow = SumRow + A(a,b);
    end
    disp(SumRow)
end
SumRow=0;

for(h=1:1:n_rows)
    SumRow = SumRow + A(h,h);
end
disp(SumRow)
p=0;
SumRow=0;
for(h=n_rows:-1:1)
    p=p+1;
    SumRow = SumRow + A(h,p);
end
disp(SumRow)






    
    
