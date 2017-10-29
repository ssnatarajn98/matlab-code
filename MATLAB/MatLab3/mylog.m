% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Krishna Goswami
% Section: ENGR111-207
% Assignment: myLog
% Date:11/18/2016
function [] = mylog(L,tol)
nlog = 0;
if(L>0 && L<=2)
for(t= 1:1:100000)
   if((((L-1)^t)/(t))<tol)
     L=L;
   else
     nlog = nlog + ((-1)^(t))*(((L-1)^t)/t);
   end
end

disp(nlog*-1)
disp(log(L))
elseif(L<0 || L>=2)
fprintf(' put another value')
end