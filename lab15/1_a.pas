PROGRAM CountChars(INPUT, OUTPUT);
USES Count3;
VAR Ch, h, t, o: CHAR;
BEGIN
  start;
  WHILE NOT EOLN 
  DO 
    BEGIN
      READ(Ch);
      Bump;
    END;
  Value(h, t, o);
  IF (h ='9') AND (t ='9') AND(o ='9')
  THEN
    WRITELN('Count: как минимум 999')
  ELSE
    WRITELN('Count: ', h, t, o);
END.

