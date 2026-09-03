PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN
  {--- Этап 1: копирование входных данных ---}
  REWRITE(F1);
  WRITE(OUTPUT, 'INPUT DATA:');
  READ(INPUT, Ch);
  WHILE Ch <> '#' DO
  BEGIN
    WRITE(F1, Ch);
    WRITE(OUTPUT, Ch);
    READ(INPUT, Ch);
  END;
  WRITELN(OUTPUT);
  WRITELN(F1, '#');

  {--- Этап 2–3: полная сортировка ---}
  WRITE(OUTPUT, 'SORTED DATA:');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#' DO
  BEGIN
    {Выбор минимального (DP1.2.1 + DP1.2.1.1)}
    REWRITE(F2);
    Min := Ch;
    READ(F1, Ch);
    WHILE Ch <> '#' DO
    BEGIN
      IF Ch < Min THEN
      BEGIN
        WRITE(F2, Min);
        Min := Ch;
      END
      ELSE
        WRITE(F2, Ch);
      READ(F1, Ch);
    END;
    WRITELN(F2, '#');

    WRITE(OUTPUT, Min);

    {Копирование F2 > F1 (DP1.2.2)}
    RESET(F2);
    REWRITE(F1);
    READ(F2, Ch);
    WHILE Ch <> '#' DO
    BEGIN
      WRITE(F1, Ch);
      READ(F2, Ch);
    END;
    WRITELN(F1, '#');

    RESET(F1);
    READ(F1, Ch);
  END;
  WRITELN(OUTPUT);
END.
