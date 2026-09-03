PROGRAM PaulRevere(INPUT, OUTPUT);
VAR
  Lanterns: CHAR;
BEGIN
  READ(Lanterns);
  IF Lanterns >= '1'
  THEN
    IF Lanterns <= '2'
    THEN
      BEGIN
        WRITE('The British are coming by');
        IF Lanterns = '1'
        THEN
          WRITELN(' Land')
        ELSE
        IF Lanterns = '2'
        THEN
          WRITELN(' Sea')
       END
    ELSE
      WRITELN('The North Church shows only ''', Lanterns, '''.')
END.
