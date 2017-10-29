A=  [2 5, 20 , 5;
 4 , 9,1 , 11;
 3,6,2,    15]
b = size(a);
n_rows =  b(1);
n_cols = b(2);
maxv = 0;
for(i=1:1:n_rows)
    for(i=1:1:n_cols)
        if (maxv < A(i,j))
            maxv = A(i,j)
