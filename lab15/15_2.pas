PROGRAM TestRemove(INPUT, OUTPUT);
USES Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
VAR
  Ch, Blank, LineEnd, Flag: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '$';
  Flag := 'Y';
  AddQ(LineEnd); 
  HeadQ(Ch);
  WHILE Ch <> LineEnd DO
  BEGIN
    WHILE Ch = Blank DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;
    IF Ch <> LineEnd THEN
    BEGIN
      IF Flag = 'N' THEN
        AddQ(Blank);
      WHILE (Ch <> Blank) AND (Ch <> LineEnd) DO
      BEGIN
        AddQ(Ch); 
        DelQ;     
        HeadQ(Ch)     
      END;
      Flag := 'N'
    END;
  END;
  DelQ;
END;

BEGIN
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN 
  DO
    BEGIN
      READ(Ch);
      AddQ(Ch);
    END;

  RemoveExtraBlanks;

  WRITE('Выход:');
  HeadQ(Ch);
  WHILE Ch <> '#' 
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN('#')
END.
