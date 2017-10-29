str1 = 'a telescope';
str2 = 'to see place';
a = regexprep(str1, ' ', '');
b = regexprep(str2, ' ', '');
c = length(a);
d = length(b);
e = upper(a);
f = upper(b);
sum = 0;
for(i=1:1:c)
    for(z=1:1:c)
        if e(i)==f(z)
            sum = sum+1;
        else
            sum = sum;
        end
    end
end
if sum >= c;
    y = 1
else
    y = 0
end







