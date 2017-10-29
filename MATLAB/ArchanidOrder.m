

Question1 = input('Has a tail or a stinger?', 's');
if(Question1 == 'YES');
    Question2 = input('Tail is straight like a needle','s');
    if (Question2 == YES)
        fprintf('The order uropygi');
    else
        fprintf(' Order Scorpiones');
    end
else
    Question3 = input('Has Claws?');
    if(Question3 == YES);
        Question4 = input('Is less than 5mm long and is flat');
        if (Question4 == YES)
            fprintf('The order Pseudoscorpione ');
        else
            fprintf(' Order Amblypygi');
        end
    else
        Question5 = input('Has thin, stilt-like legs with high knees and a low body?');
        if(Question5 == YES);
            fprintf('order opilones');
        else
            Question6 = input('Body is oval-shaped and lacks a waist?');
            if(Question6 == YES);
                fprintf('Order Acari ');
            else
                Question7 = input('Has 7 segments on each leg and the 1st pair are not longer than the rest?');
                if(Question7 == YES);
                    fprintf('Order Araneae');
                else
                    fprintf('Order Solifugae ');
                end
            end
        end 
    end
end 
            
        