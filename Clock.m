%By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do” 
% “I have not given or received any unauthorized aid on this assignment” % 
% Name: Sriram Natarajan
% Section: 204
% Team: 3
% Assignment: Clock
% Date: 3/18/17

classdef Clock
    properties
        second
        minute
        day
        month
        year
        hour      
    end
    methods
        
         function [obj] = Clock()
            obj.second = 0;
            obj.minute = 0;
            obj.hour = 0;
            obj.day = 1;
            obj.month = 1;
            obj.year = 1970;    
         end
         
         function [obj] = tick(obj)
             obj.second = obj.second +1;
             if(obj.second>59)
                 obj.second = 0;
                 obj = addOneMinute(obj);
             end
         end
         
         % Add one Functions
         
         function [obj] = addOneMinute(obj)
             obj.minute = obj.minute + 1;
             if(obj.minute>59)
                 obj.minute = 0;
                 obj = addOneHour(obj);
             end
         end
         
         function [obj] = addOneHour(obj)
             obj.hour = obj.hour + 1;
             if(obj.hour>23)
                 obj.hour = 0;
                 obj = addOneDay(obj);
             end
         end
         
         function [obj] = addOneDay(obj)
            obj.day = obj.day + 1;
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             if(mod(obj.year,4)==0)
                 if(obj.day>LeapYear(obj.month))
                     obj.day = 1;
                     obj = addOneMonth(obj);
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))
                     obj.day = 1;
                     obj = addOneMonth(obj);
                 end
             end
         end
         
        function [obj] = addOneMonth(obj)
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             obj.month = obj.month + 1;
             if(obj.month>12)
                 obj.month = 1;
                 obj = addOneYear(obj);
             end
             if(mod(obj.year,4)==0)
                 if(obj.day>LeapYear(obj.month))
                     obj.day = LeapYear(obj.month);
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))
                     obj.day = NonLeapYear(obj.month);
                 end
             end
        end
         
         function [obj] = addOneYear(obj)
             obj.year = obj.year + 1;
             if(obj.month==2&&obj.day==29&&mod(obj.year,4)~=0)
                 obj.day = 28;
             end
         end   
         
         %Subtract One Functions
         
        function [obj] = subSecond(obj)
             obj.second = obj.second - 1;
             if(obj.second==-1)
                 obj.second = 59;
                 obj = subMinute(obj);
             end
        end
         
         function [obj] = subMinute(obj)
             obj.minute = obj.minute - 1;
             if(obj.minute==-1)
                 obj.minute = 59;
                 obj = subHour(obj);
             end
         end
         
         function [obj] = subHour(obj)
             obj.hour = obj.hour - 1;
             if(obj.hour==-1)
                 obj.hour = 23;
                 obj = subDay(obj);
             end
         end
         
         function [obj] = subDay(obj)
             obj.day = obj.day - 1;
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             if(mod(obj.year,4)==0)
                 if(obj.day==0)
                     if(obj.month == 1)
                         obj.day = 31;
                     else   
                         obj.day = LeapYear(obj.month-1);
                     end
                     obj = subMonth(obj);
                 end
             else
                 if(obj.day==0)
                      if(obj.month == 1)
                         obj.day = 31;
                      else   
                         obj.day = NonLeapYear(obj.month-1);
                     end
                     obj = subMonth(obj);
                 end
             end
         end
         
        function [obj] = subMonth(obj)
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             obj.month = obj.month - 1;
             if(obj.month==0)
                 obj.month = 12;
                 obj = subYear(obj);
             end
             if(mod(obj.year,4)==0)
                 if(obj.day>LeapYear(obj.month))
                     obj.day = LeapYear(obj.month);
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))
                     obj.day = NonLeapYear(obj.month);
                 end
             end
        end
         
         function [obj] = subYear(obj)
             obj.year = obj.year - 1;
             if(obj.month==2&&obj.day==29&&mod(obj.year,4)~=0)
                 obj.day = 28;
             end  
         end 
         
         %Add Positive or Negative Time Functions
         
         function [obj] = addSeconds(obj,intSeconds)
             while(intSeconds>86400)
                 intSeconds = intSeconds - 86400;
                 obj = addOneDay(obj);
             end
             while(intSeconds<-86400)
                 intSeconds=intSeconds+86400;
                 obj = subDay(obj);
             end
             
             if(intSeconds ==0)
                 obj.seconds = obj.seconds;
             else
                for i=1:1:abs(intSeconds)
                    if(intSeconds>0)
                        obj = tick(obj);
                    elseif(intSeconds<0)
                        obj = subSecond(obj);
                    end
                end
             end
         end
         
         function [obj] = addMinutes(obj,intMinutes)
             if(intMinutes ==0)
                 obj.minute = obj.minute;
             else
                for i=1:1:abs(intMinutes)
                    if(intMinutes>0)
                        obj = addOneMinute(obj);
                    elseif(intMinutes<0)
                        obj = subMinute(obj);
                    end
                end
             end
         end
         
         function [obj] = addHours(obj,intHours)
            if(intHours == 0)
                 obj.hour = obj.hour;
             else
                for i=1:1:abs(intHours)
                    if(intHours>0)
                        obj = addOneHour(obj);
                    elseif(intHours<0)
                        obj = subHour(obj);
                    end
                end
             end
         end
         
         function [obj] = addDays(obj,intDays)
             if(intDays ==0)
                 obj.day = obj.day;
             else
                for i=1:1:abs(intDays)
                    if(intDays>0)
                        obj = addOneDay(obj);
                    elseif(intDays<0)
                        obj = subDay(obj);
                    end
                end
             end
         end
         
         function [obj] = addMonths(obj,intMonths)
             CurrentDay = obj.day;
             if(intMonths ==0)
                 obj.month = obj.month;
             elseif(intMonths==1)
                 obj = addOneMonth(obj);
             elseif(intMonths== -1)
                 obj = subMonth(obj);
             else
                for i=1:1:abs(intMonths)
                    obj.day = CurrentDay;
                    if(intMonths>0)
                        obj = addOneMonth(obj);
                    elseif(intMonths<0)
                        obj = subMonth(obj);
                    end
                end   
             end
         end
         
         function [obj] = addYears(obj,intYears)
             if(intYears ==0)
                 obj.year = obj.year;
             else
                for i=1:1:abs(intYears)
                    if(intYears>0)
                        obj = addOneYear(obj);
                    elseif(intYears<0)
                        obj = subYear(obj);
                    end
                end
             end
         end
         
         function obj = addTime(obj,obj2)
             SecondsAdded = getTime(obj2);
             obj = obj.addSeconds(SecondsAdded);
         end
         
         % get functions
         function CurrentSecond = getSecond(obj)
             CurrentSecond = obj.second;
             return
         end
         
         function CurrentMinute = getMinute(obj)
             CurrentMinute = obj.minute;
             return
         end
         
         function CurrentHour = getHour(obj)
              CurrentHour = obj.hour;
             return
         end
         
         function CurrentDay = getDay(obj)
             CurrentDay = obj.day;
             return
         end
         
         function CurrentMonth = getMonth(obj)
             CurrentMonth = obj.month;
             return
         end
         
         function getYear = getYear(obj)
             getYear = obj.year;
             return
         end
         
         function ElapsedSeconds = getTime(obj)
             TempObj=Clock();
             DayCounter = 0;
             if(obj.year<1970)
                while(obj.year~=TempObj.year||obj.month~=TempObj.month)
                    TempObj=subDay(TempObj);
                    DayCounter = DayCounter+1;
                end
                ElaspedSeconds = DayCounter * 86400;
                while(obj.hour~=TempObj.hour||obj.minute~=TempObj.minute||obj.second~=TempObj.second||obj.day~=TempObj.day)
                    TempObj=subSecond(TempObj);
                    ElaspedSeconds = ElaspedSeconds + 1;
                end
                    ElaspedSeconds = ElaspedSeconds*-1;
             else
                while(obj.year~=TempObj.year||obj.month~=TempObj.month)
                    TempObj=addOneDay(TempObj);
                    DayCounter = DayCounter+1;
                end
                ElaspedSeconds = DayCounter * 86400;
                while(obj.hour~=TempObj.hour||obj.minute~=TempObj.minute||obj.second~=TempObj.second||obj.day~=TempObj.day)
                    TempObj=tick(TempObj);
                    ElaspedSeconds = ElaspedSeconds + 1;
                end
             end
         end
         
         function CurrentDayOfWeek = getDayOfWeek(obj)
             TempObj=Clock();
             DayCounter = 1;
             CurrentDayOfWeek = 'Thursday';
             PositiveDay = [{'Friday'} 'Saturday' 'Sunday' 'Monday' 'Tuesday' 'Wednesday'];
             NegativeDay = [{'Wednesday'} 'Tuesday' 'Monday' 'Sunday' 'Saturday' 'Friday'];
             if(obj.year<1970)
                while(obj.year~=TempObj.year||obj.month~=TempObj.month||obj.day~=TempObj.day)
                    TempObj=subDay(TempObj);
                    DayCounter = DayCounter+1;
                    ModDay = mod(DayCounter - 1 ,7);
                   if(ModDay==0)
                        CurrentDayOfWeek = 'Thursday';
                    else
                    CurrentDayOfWeek = NegativeDay(ModDay);
                   end 
                end
             else
                while(obj.year~=TempObj.year||obj.month~=TempObj.month||obj.day~=TempObj.day)
                    TempObj=addOneDay(TempObj);
                    DayCounter = DayCounter+1;
                    ModDay = mod((DayCounter-1),7);
                    if(ModDay==0)
                        CurrentDayOfWeek = 'Thursday';
                    else
                    CurrentDayOfWeek = PositiveDay(ModDay);
                    end
                end
             end
         end
         
       %Other Functions
       
         function compare = compare(obj,obj2)
             if(obj2.year>obj.year)
                 compare = 1;
             elseif(obj2.year<obj.year)
                 compare=-1;
             else
                 if(obj2.month>obj.month)
                     compare = 1;
                 elseif (obj2.month<obj.month)
                     compare = -1;
                 else
                     if(obj2.day>obj.day)
                         compare = 1;
                     elseif(obj2.day<obj.day)
                         compare = -1;
                     else
                         if(obj2.militaryhour>obj.hour)
                             compare = 1;
                         elseif(obj2.militaryhour<obj.hour)
                             compare = -1;
                         else
                             if(obj2.minute>obj.minute)
                                 compare = 1;
                             elseif(obj2.minute<obj.minute)
                                 compare = -1;
                             else
                                 if(obj2.second>obj.second)
                                     compare = 1;
                                 elseif(obj2.second<obj.second)
                                     compare = -1;
                                 else
                                     compare = 0;
                                 end
                             end
                         end
                     end
                 end
             end
             compare = compare*-1;
         end

         function LeapYearCondition = isLeapYear(obj)
           LeapYearCondition = 'false';
           if((mod(obj.year,4)==0))
               LeapYearCondition = 'true';
           end
           return 
         end 
         
         function [] =  now(obj)
           tempMinute = obj.minute;
           tempSecond = obj.second;
           tempHour = obj.hour;
           tempDay = obj.day;
           tempMonth = obj.month;
           tempYear = obj.year;
           tempMinute = int2str(tempMinute);
           tempSecond = int2str(tempSecond);
           tempHour = int2str(tempHour);
           tempDay = int2str(tempDay);
           tempYear = int2str(tempYear);
           tempMonth = int2str(tempMonth);  
           if(obj.minute<10)
               tempMinute = strcat('0', tempMinute);
           end
           if(obj.second<10)
               tempSecond = strcat('0',tempSecond);
           end
           if(obj.hour<10)
               tempHour = strcat('0',tempHour);
           end
           if(obj.year<1000 && obj.year>99)
               tempYear = strcat('0',tempYear);
           elseif(obj.year<100&&obj.year>9)
               tempYear = strcat('00',tempYear);
           elseif(obj.year>=0&&obj.year<10)
               tempYear = strcat('000',tempYear);
           end
           if(obj.month<10)
               tempMonth = strcat('0',tempMonth);
           end
           if(obj.day<10)
              tempDay = strcat('0',tempDay);
           end
           fprintf('%s:%s:%s %s/%s/%s\n',tempHour,tempMinute,tempSecond,tempDay,tempMonth,tempYear);
         end
         
    end
    
end

