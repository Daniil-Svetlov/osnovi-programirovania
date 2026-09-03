PROGRAM Split(INPUT, OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные
   элементы}
VAR
  Next: CHAR;
  Odds, Evens: TEXT;
  Ch: CHAR;

PROCEDURE ProcesString;
{обработка одной строки}
VAR
  LineCh: CHAR; 
BEGIN
  Next := 'O';
  WHILE NOT EOLN(INPUT) 
  DO
    BEGIN
      READ(INPUT, LineCh);
      IF Next = 'O' 
      THEN
        BEGIN
          WRITE(Odds, LineCh);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, LineCh);
          Next := 'O'
        END
    END;
  READLN(INPUT); 
  WRITELN(Odds);  
  WRITELN(Evens); 
END;

PROCEDURE CopyOut(VAR F1: TEXT);
VAR 
  Ch: CHAR;
{вывод результата}
BEGIN
  RESET(F1);
  WHILE NOT EOF(F1) 
  DO
    BEGIN
      WHILE NOT EOLN(F1) 
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1)
    END
END;

BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  ProcesString; { Обработка первой строки }
  ProcesString; { Обработка второй строки }
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN(OUTPUT)
END.
