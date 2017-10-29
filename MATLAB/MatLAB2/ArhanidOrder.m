% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Sriram Natarajan
% Section: ENGR 111-207
% Assignment: Quadratic
% Date: 11 16 2016
function [] = Classify_Archanid()

Question1 = input('Has a tail or a stinger? Enter 1 for Yes and 0 for No.');
if(Question1 == 1);
    Question2 = input('Tail is straight like a needle Enter 1 for Yes and 0 for No. ');
    if (Question2 == 1)
        fprintf('The order uropygi');
    else
        fprintf(' Order Scorpiones');
    end
else
    Question3 = input('Has Claws? Enter 1 for Yes and 0 for No.');
    if(Question3 == 1);
        Question4 = input('Is less than 5mm long and is flat? Enter 1 for Yes and 0 for No.');
        if (Question4 == 1)
            fprintf('The order Pseudoscorpione ');
        else
            fprintf(' Order Amblypygi');
        end
    else
        Question5 = input('Has thin, stilt-like legs with high knees and a low body? Enter 1 for Yes and 0 for No.');
        if(Question5 == 1);
            fprintf('order opilones');
        else
            Question6 = input('Body is oval-shaped and lacks a waist?');
            if(Question6 == 1);
                fprintf('Order Acari ');
            else
                Question7 = input('Has 7 segments on each leg and the 1st pair are not longer than the rest? Enter 1 for Yes and 0 for No.');
                if(Question7 == 1);
                    fprintf('Order Araneae');
                else
                    fprintf('Order Solifugae ');
                end
            end
        end 
    end
end 
            
        