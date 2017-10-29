A =   [1 0 0 0 0 0 0 0 ; 
   0 0 0 0 0 0 1 0 ;  
   0 0 0 0 1 0 0 0 ;  
   0 0 0 0 0 0 0 1 ;  
   0 1 0 0 0 0 0 0 ;  
   0 0 0 1 0 0 0 0 ;  
   0 0 0 0 0 1 0 0 ;  
   0 0 1 0 0 0 0 0]  ;
Tot1 = 1:16;
Tot2 = 1:13;
Tot3 = 1:13;
B = rot90(A);
program = true;
for(i=1:1:8)
    Tot1(i) = sum(A(i,:));
    Tot1(i+8) = sum(A(:,i));
end
count=1;
for(i=-6:1:6)
    Tot2(count) = sum(diag(A,i));
    Tot3(count) = sum(diag(B,i));
    count  = count + 1;
end
for(i=1:1:13)
    if(Tot2(i)>=2||Tot3(i)>=2)
        program = false;
    end
end
for(i=1:1:16)
    if(Tot1(i)>=2)
        program = false;
    end
end
if(sum(sum(A))~=8)
    program = false;
end
    



