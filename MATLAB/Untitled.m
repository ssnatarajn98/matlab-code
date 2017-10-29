
b= 6;
for(i=1:1:12)
    for(j=1:1:11)
        b=b+1
        A(i,j) = b;
    end
end
c = size(A)
disp(c)
disp(A)