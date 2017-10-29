function [] = Hailstone(X)
n=X;
s=0;
disp(n);
while ( n ~=1)
    
    if (rem(n,2) == 0)
        n = n/2;
    else
        n = 3*(n) + 1;
    end
    if ( n > s )
        s=n;
    end
    disp(n)
end
    