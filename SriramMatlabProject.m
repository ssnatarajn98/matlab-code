
clear

sriram = menu ('The sriram Project', 'What is the username?','Set the output filename','What is the data file being used?','Statistics for the Data',  ...
    'Plot the histogram', 'Plot histogram fit', 'Plot probability plots', 'Find probability given x','Find probability given z','Find x given the probability',...
    'Find z given the probability','Clear data from the memory','Exit')
A = [];
R = [];
count = 0;
username = [];
filename = 0;
while sriram ~= 20
    %Make sure to click the buttons in order to ensure a smooth transition
    %of the program.
    
    switch sriram
        
        case 1
            %What us the username?
            clc;
            %Username can be anything but name is preferred.
            username = inputdlg ('State your name','Input');
            
            
        case 2
            
         %Sets the output filename
            clc
            %Make sure that the output filename is either a .txt or .m
            outputname = input('Select an output filename','s');
            %This output name is what the file with the data from the
            %program will be saved to.
            fid = fopen(outputname, 'wt');
            
        case 3
            %What is the data file being used?
                filename = inputdlg ('What is the data file called?','String');
                filename = char(filename)
                %Make sure the file name is something that is downloaded in
                %the same folder as the matlab program
                if exist(filename,'file')
                    A =importdata(filename)
                    A = A(:)
                else
                    %This error will pop up if the file isn't downloaded in
                    %the same folder as the matlab program.
                    errordlg('The file not here');
                end
        
         
        case 4
            %Finds the Statistics of the Data
            %Be sure to load the data prior to trying to find statistics
           
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                clc
                fprintf('Data is already loaded\n');
                   Mean = mean(A); %Finds mean
                   Median = median(A); %Finds median
                   Mode = mode(A); %Finds mode
                   Var = var(A); %Finds variance
                   Stdev = std(A); %Finds standard deviation
                   Min = min(A); %Finds minimum
                   Max = max(A); %Finds maximum
                   Count = size(A); %Finds count
               
                   fprintf(fid,'Mean: %f\n', Mean); %Prints Mean
                   fprintf(fid,'Median: %f\n',Median); %Prints Median
                   fprintf(fid,'Mode: %f\n', Mode); %Prints Mode
                   fprintf(fid,'Var: %f\n', Var); %Prints Variance
                   fprintf(fid,'Stdev: %f\n', Stdev); %Prints Standard Deviation
                   fprintf(fid,'Min: %f\n', Min); %Prints Minimum
                   fprintf(fid,'Max: %f\n', Max); %Prints Maximum
                   fprintf(fid,'Count: %f\n', Count); %Prints Count
            
            else
                %If something is wrong like no data loaded this will be
                %printed
               errordlg('You messed up!!!!') 
            end
    
        case 5
             %Plot the histogram
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
            %Make sure to load data prior
            graphinghistogram = questdlg('Do you want to graph a histogram?','Input');
            switch graphinghistogram
                %This  is what will happen when the user chooses either yes
                %or no plot the histogram. It will be plotted with both
                %options.
                case 'Yes'
                    histogram(A)
                case 'No'
                    histogram(A)
                     
            end
            end
    
        case 6
             %Plots the histogram fit
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %It is important to ensure that you load the data prior.
                %This will ensure that there are no errors.
            graphinghistogramfit = questdlg('Do you want to graph a histogram fit?','default');
            switch graphinghistogramfit
                %Regardless of the option choice a histogram fit will be
                %graphed. 
                case 'Yes'
                    histfit(A)
                case 'No'
                    histfit(A)
            end    
            end
        case 7
            %Plot the probability plots
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %be sure to load the data prior to trying to graph a
                %probability plot as that way there will be no errors
            probabilityplot = questdlg('Do you want to graph a probability plot?','default');
            switch probabilityplot
                %Regardless of which option is chosen a proability plot
                %will be graphed
                case 'Yes'
                    probplot(A)
                case 'No'
                    probplot(A)
            end
            end
        case 8
            %Find probability given x
        if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %be sure to load the data prior to trying to graph a
                %probability plot as that way there will be no errors
             distribution = questdlg('Does the data have normal distribution?','default');
                   if (distribution == 0)
                       fprintf ('Only normal distribution will work')
                   elseif (distribution > 0)
                       %make sure to load data prior to ensure it works
                       variableinfo = questdlg('Do you have X?','default');
                       switch variableinfo
                       case 'Yes'
                           %this will take the X and give a probability
                           variablevalue = input('What is X?');
                           cdfdistribution = normcdf(variablevalue, Mean, Stdev)
                           fprintf('normcdf: %f\n',cdfdistribution);
                      case 'No'
                          %this will take the X and give a probability
                      variablevalue = input('What is X?');
                      cdfdistribution = normcdf(variablevalue, Mean, Stdev)
                      fprintf('normcdf: %f\n',cdfdistribution);
                       end
                   else
                           %this is the error that will occur if the data
                           %is not loaded
                           errordlg('Does not work. You messed up.');
                   end
        end
     
          case 9
              %Find probability given Z
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %be sure to load the data prior to trying to graph a
                %probability plot as that way there will be no errors
            distribution = questdlg('Does the data have normal distribution?','default');
                   if (distribution == 0)
                       fprintf ('Only normal distribution will work')
                   elseif (distribution > 0)
                       %make sure to load data prior to ensure it works
                       variableinfo = questdlg('Do you have Z?','default');
                       switch variableinfo
                       case 'Yes'
                       %this will take the Z and give a probability
                       variablevalue = input('What is Z?');
                       cdfdistribution = normcdf(variablevalue, 0, 1)
                       fprintf(fid,'normcdf: %f\n',cdfdistribution);
                      case 'No'
                      %this will take the Z and give a probability
                      variablevalue = input('What is Z?');
                      cdfdistribution = normcdf(variablevalue, 0, 1)
                      fprintf(fid,'normcdf: %f\n',cdfdistribution);
                       end
                   else
                           %this is the error that will occur if the data
                           %is not loaded
                           errordlg('Does not work. You messed up.');
                   end
            end
                   
        case 10
            %Given probability find X
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %be sure to load the data prior to trying to graph a
                %probability plot as that way there will be no errors
          prob = questdlg('Does the data have normal distribution?','default');
                   if (prob == 0)
                       fprintf ('Only normal distribution will work')
                   elseif (prob > 0)
                        %make sure to load data prior to ensure it works
                       probabilitydata = questdlg('Do you have probability?','default');
                       switch probabilitydata
                       case 'Yes'
                           %this will take the probability and give a X
                           %value
                       probabilitydata = input('What is the probability?','s');
                       probabilitydata = str2num(probabilitydata);
                       probabilitydata = norminv( probabilitydata, Mean, Stdev);
                       fprintf(fid,'norminv: %f\n',probabilitydata);
                      case 'No'
                          %this will take the probability and give a X
                           %value
                      probabilitydata = input('What is the probability?');
                       probabilitydata = norminv(probability, Mean, Stdev)
                       fprintf(fid,'norminv: %f\n',probabilitydata);
                       end
                   else
                           %this is the error that will occur if the data
                           %is not loaded
                           errordlg('Does not work. You messed up.');
                   end
            end
                   
        case 11
                %Find Z given the probability
            if(length(A)==0)
                fprintf(' please load a data file first by clicking case 2');
            elseif (length(A)> 0)
                %be sure to load the data prior to trying to graph a
                %probability plot as that way there will be no errors
            prob = questdlg('Does the data have normal distribution?','default');
                   if (prob == 0)
                       fprintf ('Only normal distribution will work')
                   elseif (prob > 0)
                        %make sure to load data prior to ensure it works
                       probabilitydata = questdlg('Do you have probability?','default');
                       switch probabilitydata
                       case 'Yes'
                           %this will take the probability and give a Z
                           %value
                        probabilitydata = input('What is the probability?','s');
                        probabilitydata = str2num(probabilitydata);
                        probabilitydata = norminv(probabilitydata, 0, 1)
                        fprintf(fid,'norminv: %f\n',probabilitydata);
                       case 'No'
                           %this will take the probability and give a Z
                           %value
                        probabilitydata = input('What is the probability?');
                        probabilitydata = norminv(probability, 0, 1)
                        fprintf(fid,'norminv: %f\n',probabilitydata);
                     end
                   else
                       %this is the error that will occur if the data
                        %is not loaded
                           errordlg('Does not work. You messed up.');
                   end
            end
        case 12
            %Clears data from memory
            
           dataremoval = questdlg ('Do you want to clear the data?','default');
           switch dataremoval
            case 'Yes'
            srirammatlabproj();
            case 'No'
            filename = filename
           end    
        case 13
            %Exits the program
            clc
            endingtheproject = questdlg('Do you want to end the program?','default');
            switch endingtheproject
                case 'Yes'
                    %ends the program
                    break
                case 'No'
                    %lets the program keep running
                    run(sriram)
            end
            
        otherwise

    end
    sriram = menu ('The sriram Project', 'What is the username?','Set the output filename','What is the data file being used?','Statistics for the Data',  ...
    'Plot the histogram', 'Plot histogram fit', 'Plot probability plots', 'Find probability given x','Find probability given z', 'Find x given the probability',...
    'Find z given the probability','Clear data from the memory','Exit')
end

%some of your varible names are pretty bad, fix those also