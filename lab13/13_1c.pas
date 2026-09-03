PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted: CHAR;
  F1, F2: TEXT;
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR 
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InFile) 
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  READLN(InFile);
  WRITELN(OutFile);
END;

PROCEDURE CopyAndSwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR Ch1, Ch2: CHAR;
BEGIN
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1) 
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1) 
          DO
            BEGIN
              READ(F1, Ch2);
              IF Ch1 <= Ch2 
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END
            END;
          WRITELN(F2, Ch1)
        END
END;

PROCEDURE BubbleSort(VAR InFile, OutFile: TEXT);
//VAR   
  //F1, F2: TEXT;
  
BEGIN
  { Копируем INPUT в F1 }
  REWRITE(InFile);
  CopyFile(INPUT, InFile);
  Sorted := 'N';
  WHILE Sorted = 'N' 
  DO
    BEGIN
      CopyAndSwap(InFile, OutFile, Sorted);
      RESET(OutFile);
      REWRITE(InFile);
      CopyFile(OutFile, InFile)
    END;
  RESET(InFile);
  CopyFile(InFile, OUTPUT)
END;

BEGIN { BubbleSort }
  BubbleSort(F1, F2)
END. { BubbleSort }
