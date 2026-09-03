PROGRAM TestLexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Result: CHAR;

PROCEDURE CopyLine(VAR InFile, OutFile: TEXT);
{записываем входные строки во временные файлы}
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InFile) DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  READLN(InFile);
  WRITELN(OutFile)
END;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{процедура определяет меньшее из 2 слов}
VAR
  Ch1, Ch2: CHAR;
BEGIN
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0') 
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF Ch1 < Ch2 
      THEN
        Result := '1'
      ELSE
        IF Ch1 > Ch2 
        THEN
          Result := '2'
    END;
  IF Result = '0' 
  THEN
    BEGIN
      IF (EOLN(F1)) AND (NOT EOLN(F2)) 
      THEN
        Result := '1'
      ELSE
        IF (NOT EOLN(F1)) AND (EOLN(F2)) 
        THEN
          Result := '2'
    END
END;

BEGIN
  REWRITE(F1);
  CopyLine(INPUT, F1);
  REWRITE(F2);
  CopyLine(INPUT, F2);
  Lexico(F1, F2, Result);
  IF Result = '0' 
  THEN
    WRITELN(OUTPUT, 'строки равны')
  ELSE
    WRITELN(OUTPUT, Result, ' строка меньше')
END.
