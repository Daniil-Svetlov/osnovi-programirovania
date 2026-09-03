PROGRAM Prime(INPUT, OUTPUT);
{Ќаходит простые числа в определенном диапазоне}
CONST
  MinOut = 30;     
  MaxNumber = 50;   
TYPE
  NumberSet = SET OF 2..MaxNumber;
VAR
  S: NumberSet;
  CurrentPrime, Multiple: INTEGER;
BEGIN
  {вычеркивание элементов}
  S := [2..MaxNumber];
  CurrentPrime := 2; 
  
  WHILE CurrentPrime <= MaxNumber 
  DO
    BEGIN
      IF CurrentPrime IN S 
      THEN
        BEGIN
          Multiple := CurrentPrime + CurrentPrime;  
          WHILE Multiple <= MaxNumber 
          DO
            BEGIN
              S := S - [Multiple];
              Multiple := Multiple + CurrentPrime 
            END
        END;
      CurrentPrime := CurrentPrime + 1
    END;  
  S := S - [2 .. MinOut];
{вывод итогового решета}
  WRITELN('ѕростые числа в диапазоне от ', MinOut, ' до ', MaxNumber, ':');
  CurrentPrime := 2;
  WHILE CurrentPrime <= MaxNumber 
  DO
    BEGIN
      IF CurrentPrime IN S 
      THEN
        WRITE(CurrentPrime, ' ');  
      CurrentPrime := CurrentPrime + 1
    END;
  WRITELN
END.
