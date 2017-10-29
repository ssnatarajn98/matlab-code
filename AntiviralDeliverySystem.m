inputArray = [1 1 0 0 1 0 1 0 0 0]
A = inputArray(2:4)
A = mat2str(A)
B = inputArray(6:10)
B = mat2str(B)
Type1Size = ' dog';
Type2Size = 'cat';
Type1 = 0;
Type2 = 0;
DecimalNumber = 0;
switch A
    case '[0 0 1]'
        A = 'White Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[0 1 0]'
        A = 'Red Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[0 1 1]'
        A = 'Blue Glass'
        Type1Size = 'Large'
        Type2Size = 'Small'
    case '[1 0 0]'
        A = 'Steel/HDPE'
        Type1Size = 'Steel'
        Type2Size = 'HDPE'
end
switch B
    case '[0 0 0 0 1]'
        Type1 = 0
        Type2 = 0
        DecimalNumber = 1
     case '[0 0 0 1 0]'
        Type1 = 1
        Type2 = 0
        DecimalNumber = 2
      case '[0 0 0 1 1]'
        Type1 = 2
        Type2 = 0
        DecimalNumber = 3
      case '[0 0 1 0 0]'
        Type1 = 3
        Type2 = 0
        DecimalNumber = 4
      case '[0 0 1 0 1]'
        Type1 = 0
        Type2 = 1
        DecimalNumber = 5
      case '[0 0 1 1 0]'
        Type1 = 1
        Type2 = 1
        DecimalNumber = 6
       case '[0 0 0 0 1]'
        Type1 = 2
        Type2 = 1
        DecimalNumber = 7
       case '[0 1 0 0 0]'
        Type1 = 3
        Type2 = 1
        DecimalNumber = 8
       case '[0 1 0 0 1]'
        Type1 = 1
        Type2 = 2
        DecimalNumber = 9
       case '[0 1 0 1 0]'
        Type1 = 1
        Type2 = 2
        DecimalNumber = 10
       case '[0 1 0 1 1]'
        Type1 = 2
        Type2 = 2
        DecimalNumber = 11
       case '[0 1 1 0 0]'
        Type1 = 3
        Type2 = 2
        DecimalNumber = 12
       case '[0 0 0 0 1]'
        Type1 = 0
        Type2 = 3
        DecimalNumber = 13
       case '[0 1 1 1 0]'
        Type1 = 1
        Type2 = 3
        DecimalNumber = 14
       case '[0 1 1 1 1]'
        Type1 = 2
        Type2 = 3
        DecimalNumber = 15
       case '[1 0 0 0 0]'
        Type1 = 3
        Type2 = 3
        DecimalNumber = 16
end
        
        

        
    