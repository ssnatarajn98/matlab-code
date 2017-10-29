A = [5 ,6 ,8, 7, 10, 10];
Alength = length(A);
sum = 0;
MeanofA = 5;
SkewnessSum = 0;
for( n=1:1:Alength);
    VarianceSum =  VarianceSum +  (MeanofA - A(n))^2;
end
fprintf ('the variance is %f \n', VarianceSum)
StandardDeviation =  (VarianceSum/Alength)^.5;
for( j=1:1:Alength);
    SkewnessSum =  SkewnessSum +  (MeanofA - A(j))^3 ;
end
SkewnessFinal = SkewnessSum/ ((Alength -1)*(StandardDeviation));
fprintf ('the skewness is %f \n', SkewnessFinal)

for ( h =1:1:Alength)
    if (A(h) < A(h+1))
        A(h) = A[]
        A(h+1) = B(1)
            
    







