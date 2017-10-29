classdef Clock
    properties
        second
        minute
        hour
        day
        month
        year
        mhour
    end
    methods
         function [obj] = Clock2()
            obj.second = 0;
            obj.minute = 0;
            obj.mhour = 0;
            obj.day = 1
            obj.month = 1;
            obj.year = 1970;
            obj.hour = 0;
         end
         function [obj] = tick(obj)
             obj.second = obj.second +1;
             if(obj.second>59)
                 obj.second = 0;
                 obj = addMinute(obj);
             end
         end
         function [obj] = addMinute(obj)
             obj.minute = obj.minute + 1;
             if(obj.minute>59)
                 obj.minute = 0;
                 obj = addHour(obj);
             end
         end
         function [obj] = addHour(obj)
             obj.mhour = obj.mhour + 1;
             if(obj.mhour>23)
                 obj.mhour = 0;
                 obj = addDay(obj);
             end
         end
         function [obj] = addDay(obj)
            obj.day = obj.day + 1;
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             if(mod(obj.year,4)==0)
                 if(obj.day>LeapYear(obj.month))
                     obj.day = 1;
                     obj = addMonth(obj);
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))
                     obj.day = 1;
                     obj = addMonth(obj);
                 end
             end
         end
        function [obj] = addMonth(obj)
             NonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
             LeapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
             obj.month = obj.month + 1;
             if(obj.month>12)
                 obj.month = 1;
                 obj = addYear(obj);
             end
             if(mod(obj.year,4)==0)
                 if(obj.day>LeapYear(obj.month))
                     obj.day = LeapYear(obj.month)
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))

                     obj.day = NonLeapYear(obj.month)
                 end
             end
         end
         function [obj] = addYear(obj)
             obj.year = obj.year + 1;
             if(obj.month==2&&obj.day==29&&mod(obj.year,4)~=0)
                 obj.day = 28;
             end
         end      
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
             obj.mhour = obj.mhour - 1;
             if(obj.mhour==-1)
                 obj.mhour = 23;
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
                     obj.day = LeapYear(obj.month)
                 end
             else
                 if(obj.day>NonLeapYear(obj.month))

                     obj.day = NonLeapYear(obj.month)
                 end
             end
         end
         function [obj] = subYear(obj)
             obj.year = obj.year - 1;
             if(obj.month==2&&obj.day==29&&mod(obj.year,4)~=0)
                 obj.day = 28;
             end  
         end 
         %Add Functions
         function [obj] = addSeconds(obj,addTime)
             while(addTime>86400)
                 addTime = addTime - 86400;
                 obj = addDay(obj);
             end
             while(addTime<-86400)
                 addTime=addTime+86400;
                 obj = subDay(obj);
             end
             
             if(addTime ==0)
                 obj.seconds = obj.seconds;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = tick(obj);
                    elseif(addTime<0)
                        obj = subSecond(obj);
                    end
                end
             end
         end
         function [obj] = addMinutes(obj,addTime)
             if(addTime ==0)
                 obj.minute = obj.minute;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = addMinute(obj);
                    elseif(addTime<0)
                        obj = subMinute(obj);
                    end
                end
             end
         end
         function [obj] = addHours(obj,addTime)
            if(addTime == 0)
                 obj.mhour = obj.mhour;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = addHour(obj);
                    elseif(addTime<0)
                        obj = subHour(obj);
                    end
                end
             end
         end
         function [obj] = addDays(obj,addTime)
             if(addTime ==0)
                 obj.day = obj.day;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = addDay(obj);
                    elseif(addTime<0)
                        obj = subDay(obj);
                    end
                end
             end
         end
         function [obj] = addMonths(obj,addTime)
             if(addTime ==0)
                 obj.month = obj.month;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = addMonth(obj);
                    elseif(addTime<0)
                        obj = subMonth(obj);
                    end
                end
             end
         end
         function [obj] = addYears(obj,addTime)
             if(addTime ==0)
                 obj.year = obj.year;
             else
                for(i=1:1:abs(addTime))
                    if(addTime>0)
                        obj = addYear(obj);
                    elseif(addTime<0)
                        obj = subYear(obj);
                    end
                end
             end
         end
         
         % get functions
         function SecondCounter = getTime(obj)
             s=Clock2();
             DayCounter = 0;
             SecondCounter = 0;
             if(obj.year<1970)
                while(obj.year~=s.year||obj.month~=s.month||obj.day~=s.day)
                    s=subDay(s);
                    DayCounter = DayCounter+1;
                end
                SecondCounter = DayCounter * 86400;
                while(obj.hour~=s.hour||obj.minute~=s.minute||obj.second~=s.second)
                    s=subSecond(s);
                    SecondCounter = SecondCounter + 1;
                end
             else
                while(obj.year~=s.year||obj.month~=s.month||obj.day~=s.day)
                    s=addDay(s);
                    DayCounter = DayCounter+1;
                end
                SecondCounter = DayCounter * 86400;
                while(obj.hour~=s.hour||obj.minute~=s.minute||obj.second~=s.second)
                    s=tick(s);
                    SecondCounter = SecondCounter + 1;
                end
                 
             end
  
         end
         function CurrentDay = getDayOfWeek(obj)
             s=Clock2();
             DayCounter = 0;
             CurrentDay = 'thursday';
             PositiveDay = ['Thursday','Friday','Saturday','Sunday','Monday','Tuesday','wednesday'];
             NegativeDay = ['Thursday','wednesday','tuesday','monday','sunday','saturday','friday'];
            
             if(obj.year<1970)
                while(obj.year~=s.year||obj.month~=s.month||obj.day~=s.day)
                    s=subDay(s);
                    DayCounter = DayCounter+1;
                    CurrentDay = NegativeDay(mod(DayCounter,7));
                    
                end
             else
                while(obj.year~=s.year||obj.month~=s.month||obj.day~=s.day)
                    s=addDay(s);
                    DayCounter = DayCounter+1;
                    CurrentDay = PositiveDay(mod(DayCounter,7));
                end
             end
  
         end
         function compare = compare(obj,obj2)
             compare = 0;
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
                         if(obj2.hour>obj.hour)
                             compare = 1;
                         elseif(obj2.hour<obj.hour)
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
         
             
         function obj = addTime(obj,obj2)
             s=Clock2();
             SecondsAdded = getTime(obj2);
             if(compare(s,obj2)==1)
                 SecondsAdded = SecondsAdded*-1;
             end
             obj = obj.addSeconds(SecondsAdded);
         end
         function getSecond = getSecond(obj)
             getSecond = obj.second;
             return
         end
         function getMinute = getMinute(obj)
             getMinute = obj.minute;
             return
         end      
         function getHour = getHour(obj)
              obj.hour = mod(obj.mhour,12);
              getHour = [obj.mhour,obj.hour];
             return
         end     
         function getDay = getDay(obj)
             getDay = obj.day;
             return
         end
         function getMonth = getMonth(obj)
             getMonth = obj.month;
             return
         end
         function getYear = getYear(obj)
             getYear = obj.year;
             return
         end
         function isLeapYear = isLeapYear(obj)
           isLeapYear = 'false';
           if((mod(obj.year,4)==0))
               isLeapYear = 'true';
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

