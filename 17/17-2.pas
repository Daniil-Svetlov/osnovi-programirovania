PROGRAM SumString(INPUT, OUTPUT);

PROCEDURE ReadDigit(VAR D: INTEGER);
{Считывает текущий символ из файл. Если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN THEN
  BEGIN
    READ(Ch);
    IF Ch = '0' THEN D := 0
    ELSE IF Ch = '1' THEN D := 1
    ELSE IF Ch = '2' THEN D := 2
    ELSE IF Ch = '3' THEN D := 3
    ELSE IF Ch = '4' THEN D := 4
    ELSE IF Ch = '5' THEN D := 5
    ELSE IF Ch = '6' THEN D := 6
    ELSE IF Ch = '7' THEN D := 7
    ELSE IF Ch = '8' THEN D := 8
    ELSE IF Ch = '9' THEN D := 9
  END;
END;

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,  в соответствующее целое число N}
VAR
  D: INTEGER;
BEGIN
  ReadDigit(N);
  ReadDigit(D);
  WHILE (D <> -1) AND (N <> -2) 
  DO
    BEGIN
      IF N > (MaxInt - D) DIV 10 
      THEN
        N := -2  
      ELSE
        BEGIN
          N := N * 10 + D; 
          ReadDigit(D);    
        END                
    END
END;

VAR
  Result: INTEGER;
BEGIN
  ReadNumber(INPUT, Result);
  IF Result = -1 
  THEN
    WRITELN('Цифры не найдены')
  ELSE 
    IF Result = -2 
    THEN
      WRITELN('Переполнение')
    ELSE
      WRITELN('Число: ', Result);
END.
