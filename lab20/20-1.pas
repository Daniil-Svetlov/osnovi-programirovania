PROGRAM GraphicPrint(INPUT, OUTPUT);

CONST
  Max = 5;
  MatrixSize = Max * Max;
  Letters = ['D', 'E', 'P'];
  D = [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
  E = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21, 22, 23, 24, 25];
  P = [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
  Sim1 = 'X';
  Sim2 = ' ';

TYPE
  MatSize = SET OF 1 .. MatrixSize;

FUNCTION ReadLetter(VAR F1: TEXT; VAR Leter: CHAR): BOOLEAN;
BEGIN
  IF NOT EOLN(F1) 
  THEN
    BEGIN
      READ(F1, Leter);
      ReadLetter := TRUE;
    END
  ELSE
    ReadLetter := FALSE;
END;

FUNCTION GetMatrix(Letter: CHAR): MatSize;
BEGIN
  CASE Letter OF
    'D': GetMatrix := D;
    'E': GetMatrix := E;
    'P': GetMatrix := P;
  END;
END;

PROCEDURE PrintMatrix(M: MatSize);
VAR
  Cursor: INTEGER;
BEGIN
  FOR Cursor := 1 TO MatrixSize DO
  BEGIN
    IF Cursor IN M 
    THEN
      WRITE(Sim1)
    ELSE
      WRITE(Sim2);
    IF Cursor MOD Max = 0 
    THEN
      WRITELN;
  END;
END;

VAR
  Ch: CHAR;
  Let: MatSize;

BEGIN
  WHILE ReadLetter(INPUT, Ch) 
  DO
    BEGIN
      IF Ch IN Letters 
      THEN
        BEGIN
          Let := GetMatrix(Ch);
          PrintMatrix(Let);
          WRITELN;
        END
      ELSE
        WRITELN('такой символ не обрабатывается');
    END
END. 
