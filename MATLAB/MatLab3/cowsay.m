
fprintf(' \\   ^__^ \n')
fprintf('  \\  (oo)\\_______ \n')
fprintf('     (__)\\       )\\/\\ \n')
fprintf('         ||----w |\n')
fprintf('         ||     || \n')
function [] = cowsay()
S = input(' what would u like the cow to say')
Sstring = string(S);
count = celi(length(Sstring),40);
StartingValue = 0;
for(i=1:1:count-1)
    Sstring(StartingValue,40*i)
    StartingValue = 40*i;
end
remString = rem(Sstring,40);
Sstring(40*(count - 1), remString)
end

    
    


