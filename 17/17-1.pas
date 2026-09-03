PROGRAM SumString(INPUT, OUTPUT);

PROCEDURE ReadDigit(VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN 
  THEN
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
      ELSE IF Ch = '9' THEN D := 9;
    END;
END;

VAR
  D, Sum: INTEGER;
  Overflow: BOOLEAN;
BEGIN
  Sum := 0;
  Overflow := FALSE;
  ReadDigit(D);
  WHILE D <> -1 
  DO
    BEGIN
      IF Sum <= MaxInt - D 
      THEN
        Sum := Sum + D
      ELSE
        Overflow := TRUE;
      ReadDigit(D)
    END;
  IF Overflow 
  THEN
    WRITELN('Overflow')
  ELSE
    WRITELN(Sum);
END.
