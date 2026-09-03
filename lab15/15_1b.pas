PROGRAM CountRevers(INPUT, OUTPUT);
USES Count3;
VAR 
  Ch1, Ch2, Ch3, h, t, o: CHAR;
BEGIN
  Start;
  WRITE('Вход:');
  IF NOT EOLN 
  THEN 
    READ(Ch1);
  IF NOT EOLN 
  THEN 
    READ(Ch2);
  WHILE NOT EOLN 
  DO
    BEGIN
      READ(Ch3);
      IF ((Ch2 > Ch1) AND (Ch2 > Ch3)) OR ((Ch2 < Ch1) AND (Ch2 < Ch3)) 
      THEN
        Bump;
      Ch1 := Ch2;
      Ch2 := Ch3;
    END;
    Value(h, t, o);
    IF (h = '9') AND (t = '9') AND (o = '9')
    THEN
      WRITELN('Количество реверсов как минимум:', h, t, o)
    ELSE 
      WRITELN('Количество реверсов:', h, t, o)
END.
