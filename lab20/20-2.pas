PROGRAM XPrint(INPUT, OUTPUT);

CONST
  MaxNumbers = 10;
  StringWidth = 60;
TYPE
  RowSet = SET OF 1..60;
  ScreenArray = ARRAY[0..4] OF RowSet; 

VAR
  F1: TEXT;
  S: ScreenArray;
  Ch: CHAR;
  Amt, Row, Col: INTEGER; { Переменная Num больше не нужна! }
  I: INTEGER;
  
PROCEDURE PrintRow(VAR RowData: RowSet);
VAR
  I: INTEGER;
BEGIN
  FOR I := 1 TO StringWidth DO
    IF I IN RowData 
    THEN 
      WRITE('X') 
    ELSE 
      WRITE(' ');
  WRITELN;
END;

FUNCTION LoadSymbol(Target: CHAR; VAR F: TEXT; Offset: INTEGER; VAR R: ScreenArray): BOOLEAN;
VAR
  Current: CHAR;
  Val, Row, Col: INTEGER;
  Found: BOOLEAN;
BEGIN
  RESET(F);
  Found := FALSE;
  WHILE NOT EOF(F) AND NOT Found 
  DO
    BEGIN
      READ(F, Current);
      IF Current = Target 
      THEN
        BEGIN
          Found := TRUE;
          WHILE NOT EOLN(F) 
          DO
            BEGIN
              READ(F, Val);
              IF (Val >= 1) AND (Val <= 25) 
              THEN
                BEGIN
                  Row := (Val - 1) DIV 5;
                  Col := (Val - 1) MOD 5 + 1;
                  R[Row] := R[Row] + [Offset * 6 + Col]
                END
            END
        END;
      READLN(F);
    END;
  LoadSymbol := Found;
END;
BEGIN
  ASSIGN(F1, 'FileWithSymbols.txt');
  FOR I := 0 TO 4 DO
    S[I] := []; 
  Amt := 0;
  WHILE NOT EOLN(INPUT) 
  DO
    BEGIN
      READ(INPUT, Ch);
      IF Amt < MaxNumbers 
      THEN
        BEGIN
          IF NOT LoadSymbol(Ch, F1, Amt, S) 
          THEN
            BEGIN
              FOR Row := 0 TO 4 DO
                FOR Col := 1 TO 5 DO
                  S[Row] := S[Row] + [Amt * 6 + Col];
            END
        END;
      Amt := Amt + 1
    END;

  IF Amt > MaxNumbers THEN
    WRITELN('лимит в 10 символов')
  ELSE 
    IF Amt > 0 THEN
    BEGIN
      FOR I := 0 TO 4 DO
        PrintRow(S[I])
    END
END.
