PROGRAM SortMonth(INPUT, OUTPUT);
USES DateIO;

VAR
  Mes1, Mes2: Month;
  Flag: CHAR;

PROCEDURE Result(M1, M2: Month; Fl: CHAR);
BEGIN
  WriteMonth(OUTPUT, M1);
  IF Fl = '0' 
  THEN
    WRITE(' меньше ')
  ELSE
    WRITE(' больше ');
  WriteMonth(OUTPUT, M2);
END;

BEGIN
  ReadMonth(INPUT, Mes1);
  ReadMonth(INPUT, Mes2);
  IF (Mes1 = NoMonth) OR (Mes2 = NoMonth) 
  THEN
    WRITE('ћес€цев нет')
  ELSE
    IF Mes1 = Mes2 
    THEN
    BEGIN
      WRITE('ќба мес€ца равны: ');
      WriteMonth(OUTPUT, Mes1);
    END
    ELSE
      IF Mes1 < Mes2 
      THEN
      BEGIN
        Flag := '0';
        Result(Mes1, Mes2, Flag);
      END
      ELSE
       BEGIN
        Flag := '1';
        Result(Mes1, Mes2, Flag);
      END;
END.

