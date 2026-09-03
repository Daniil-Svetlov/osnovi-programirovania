PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  IF EOLN(INPUT)
  THEN
    WRITELN(OUTPUT, 'EROR: The line is empty')
  ELSE
    BEGIN
      READ(INPUT, Ch);
      WHILE (NOT EOLN(INPUT)) AND (Ch <> '#') DO
        READ(INPUT, Ch);

      IF (EOLN(INPUT)) AND (Ch <> '#') THEN
        WRITELN(OUTPUT, 'EROR: NOT #')
      ELSE
        BEGIN
          RESET(INPUT);
          REWRITE(F1);
          WRITE(OUTPUT, '¬ходные данные: ');
          READ(INPUT, Ch);
          WHILE Ch <> '#' DO
          BEGIN
            WRITE(F1, Ch);
            WRITE(OUTPUT, Ch);
            READ(INPUT, Ch);
          END;
          WRITELN(OUTPUT);
          WRITELN(F1, '#');
          WRITE(OUTPUT, '—сортированные данные: ');
          RESET(F1);
          READ(F1, Ch);

          WHILE Ch <> '#' DO
          BEGIN
            REWRITE(F2);
            Min := Ch;
            READ(F1, Ch);

            WHILE Ch <> '#' DO
            BEGIN
              IF Ch < Min
              THEN
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
        END;
    END;
END.
