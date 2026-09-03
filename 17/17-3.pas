PROGRAM Stat(INPUT, OUTPUT);
CONST
  S = 100;
VAR
  Ch: CHAR;
  NextNum, Min, Max, Count, TotalSum: INTEGER;
  CanCalcAverage, ReadError, EndOfLine: BOOLEAN;

{ --- Процедура перевода символа в цифру --- }
PROCEDURE CharToDigit(C: CHAR; VAR D: INTEGER);
BEGIN
  D := -1;
  IF C = '0' THEN D := 0 ELSE IF C = '1' THEN D := 1
  ELSE IF C = '2' THEN D := 2 ELSE IF C = '3' THEN D := 3
  ELSE IF C = '4' THEN D := 4 ELSE IF C = '5' THEN D := 5
  ELSE IF C = '6' THEN D := 6 ELSE IF C = '7' THEN D := 7
  ELSE IF C = '8' THEN D := 8 ELSE IF C = '9' THEN D := 9;
END;

{ --- Процедура чтения числа --- }
PROCEDURE ReadNumber(VAR N: INTEGER; VAR CurrentCh: CHAR; VAR EOL: BOOLEAN);
VAR
  D: INTEGER;
  HasDigits: BOOLEAN;
  Overflow: BOOLEAN;
BEGIN
  N := 0; HasDigits := FALSE; Overflow := FALSE;
  
  { Пропускаем пробелы, пока не встретим цифру или конец строки }
  CharToDigit(CurrentCh, D);
  WHILE (NOT EOL) AND (D = -1) AND (CurrentCh = ' ') DO
  BEGIN
    IF EOLN THEN EOL := TRUE
    ELSE 
      BEGIN
        READ(CurrentCh);
        CharToDigit(CurrentCh, D);
      END;
  END;

  { Если нашли цифру, начинаем сборку числа }
  WHILE (NOT EOL) AND (D <> -1) AND (NOT Overflow) DO
  BEGIN
    HasDigits := TRUE;
    { Проверка переполнения до умножения }
    IF N > (MaxInt - D) DIV 10 THEN
      Overflow := TRUE
    ELSE
      BEGIN
        N := N * 10 + D;
        IF EOLN THEN 
          BEGIN EOL := TRUE; D := -1; END
        ELSE 
          BEGIN
            READ(CurrentCh);
            CharToDigit(CurrentCh, D);
          END;
      END;
  END;

  { Коды ошибок }
  IF Overflow THEN N := -2
  ELSE IF NOT HasDigits THEN N := -1;
END;

BEGIN
  Count := 0;
  TotalSum := 0;
  CanCalcAverage := TRUE;
  ReadError := FALSE;
  EndOfLine := FALSE;

  IF EOLN THEN EndOfLine := TRUE
  ELSE READ(Ch); { Читаем самый первый символ файла }

  WHILE (NOT EndOfLine) AND (NOT ReadError) DO
  BEGIN
    ReadNumber(NextNum, Ch, EndOfLine);
    
    IF NextNum = -2 THEN 
      ReadError := TRUE
    ELSE IF NextNum >= 0 THEN
      BEGIN
        Count := Count + 1;
        IF Count = 1 THEN
          BEGIN Min := NextNum; Max := NextNum; END
        ELSE
          BEGIN
            IF NextNum < Min THEN Min := NextNum;
            IF NextNum > Max THEN Max := NextNum;
          END;

        { Проверка переполнения при суммировании }
        IF CanCalcAverage THEN
        BEGIN
          IF TotalSum > MaxInt - NextNum THEN
            CanCalcAverage := FALSE
          ELSE
            TotalSum := TotalSum + NextNum;
        END;
      END;
  END;

  { --- Вывод --- }
  IF ReadError THEN
    WRITELN('Error: Overflow during reading')
  ELSE IF Count = 0 THEN
    WRITELN('No numbers')
  ELSE
    BEGIN
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max);
      WRITE('Average: ');
      IF NOT CanCalcAverage THEN
        WRITELN('Impossible (Sum overflow)')
      ELSE
        BEGIN
          { Вычисление среднего (Sum * 100) / Count }
          IF TotalSum > MaxInt DIV S THEN
            WRITELN('Impossible (Calc overflow)')
          ELSE
            BEGIN
              NextNum := (TotalSum * S) DIV Count;
              WRITE(NextNum DIV S, '.');
              IF (NextNum MOD S) < 10 THEN WRITE('0');
              WRITELN(NextNum MOD S);
            END;
        END;
    END;
END.
