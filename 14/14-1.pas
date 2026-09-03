PROGRAM ReverseStr(INPUT, OUTPUT);

PROCEDURE Reverse;
{Переворачивает введенную строку}
VAR
  Ch: CHAR;
BEGIN{Reverse}
  IF NOT EOLN 
  THEN
    BEGIN
    {запоминаем символы и выводим их в обратном порядке}
      READ(Ch);    
      Reverse;     
      WRITE(Ch)      
    END
END;{Reverse}

BEGIN {ReverseStr}
  Reverse
END.{ReverseStr}
