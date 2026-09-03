UNIT DateUtils;

INTERFACE

TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
           Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
              Mo : Month;
              Day: DayNum
            END;
  FileOfDate = FILE OF Date;

PROCEDURE ReadDate(VAR FIn: TEXT; VAR Res: Date);    {считывает мес€ц}
FUNCTION IsValidDate(Mo: Month; Day: INTEGER): BOOLEAN;  {провер€ет дни в мес€це}
FUNCTION Less(VAR D1, D2: Date): BOOLEAN;        {сранвивает даты}
PROCEDURE CopyOut(VAR DateFile: FileOfDate);     {выводит результат}

IMPLEMENTATION

PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
{выводит мес€ц на экран}
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
  IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
  IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
  IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
  IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
  IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
  IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
  IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
  IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
  IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
  IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
  IF Mo = Dec THEN WRITE(FOut, 'DEC')
    ELSE WRITE(FOut, 'NoMonth')
END; {WriteMonth}

PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);
{выводит полную дату}
BEGIN{WriteDate}
  WriteMonth(FOut, Res.Mo);
  WRITE(FOut, Res.Day:3)
END;{WriteDate}

PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
{читает три буквы и превращает их в значение мес€ца}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN{ReadMonth}
  WHILE NOT EOF(FIn) AND (EOLN(FIn) OR (Eof(FIn))) DO READLN(FIn);
  
  IF EOF(FIn) THEN Mo := NoMonth
  ELSE
    BEGIN
      READ(FIn, Ch1, Ch2, Ch3);
      IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
      IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
      IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
      IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
      IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
      IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
      IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
      IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
      IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
      IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
      IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
      IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
        ELSE Mo := NoMonth
    END
END;{ReadMonth}

PROCEDURE ReadDate (VAR FIn: TEXT; VAR Res: Date);
{читает дату из текстового файла}
BEGIN{ReadDate}
  ReadMonth(FIn, Res.Mo);
  READ(FIn, Res.Day)
END;{ReadDate}

FUNCTION IsValidDate(Mo: Month; Day: INTEGER): BOOLEAN;
{провер€ет корректность переданного мес€ца и дн€}
VAR
  MaxDays: INTEGER;
BEGIN
  IF Mo = NoMonth THEN
    IsValidDate := FALSE
  ELSE
    BEGIN
      CASE Mo OF
        Jan, Mar, May, Jul, Aug, Oct, Dec: MaxDays := 31;
        Apr, Jun, Sep, Nov: MaxDays := 30;
        Feb: MaxDays := 29;
      ELSE
        MaxDays := 0;
      END;
      
      IF (Day >= 1) AND (Day <= MaxDays) 
      THEN
        IsValidDate := TRUE
      ELSE
        IsValidDate := FALSE;
    END;
END;

FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
{сравнивает две даты}
BEGIN {Less}
  IF D1.Mo < D2.Mo 
  THEN 
    Less := TRUE 
      ELSE
        IF D1.Mo > D2.Mo 
        THEN 
          Less := FALSE 
          ELSE
            Less := (D1.Day < D2.Day)
END; {Less}

PROCEDURE CopyOut(VAR DateFile: FileOfDate);
{выводит итоговый результат на экран}
VAR VarDate: Date;
BEGIN {CopyOut}
  RESET(DateFile);
  WHILE NOT EOF(DateFile) 
  DO
    BEGIN
      READ(DateFile, VarDate);
      WriteDate(OUTPUT, VarDate);
      WRITELN
    END
END;{CopyOut}

END.
