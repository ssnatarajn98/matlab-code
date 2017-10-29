    lowerIndex = 1;
    higherIndex = 10;
    S = randi(higherIndex, lowerIndex, 15);
    i = lowerIndex;
    j = higherIndex;
    pivot = S(lowerIndex + ((higherIndex - lowerIndex)/2));
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
            QuickSort(lowerIndex, j);
        elseif (i < higherIndex)
            QuickSort(i , higherIndex);
        end
    end
    
 end
 