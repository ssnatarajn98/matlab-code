 S = randi(1, 10, 15)
 function [] = QuickSort(lowerIndex, higherIndex)
 i = lowerIndex;
 j = higherIndex;
 pivot = S(lowerIndex+(higherIndex - lowerIndex)/2);
 while ( i <=j)
     while (S(i) < pivot)
         i = i+1;
     end
     while (S(j) > pivot)
         j=j-1;
     end
     if(i<=j)
         S(i) = S(j);
         i=i+1;
         j=j-1;
     end
if ( lowerIndex < j)
    quickSort(lowerIndex, j);
end
if (i < higherIndex)
    quickSort(i,higherIndex1);
end
 end
 

    
     