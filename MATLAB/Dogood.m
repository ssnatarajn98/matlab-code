x=1;
S = 1050;
b=1;
while ( b >  10^(-50));
    b = .5*(x+(S/x)) - x;
    x = x+.00001;
end
display (x-.00001);
    
    
    
    