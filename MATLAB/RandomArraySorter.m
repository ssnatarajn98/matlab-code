RandomArray = randi(10,100,15);
count =0;
SArray = size(RandomArray);
for i=1:1:SArray;
    for j=i+1:1:SArray;
        if(RandomArray(i) > RandomArray(j));
            count = RandomArray(i);
            RandomArray(i) = RandomArray(j);
           
        end
    end
end
disp(RandomArray)

            
