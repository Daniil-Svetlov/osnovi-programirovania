PROGRAM SortDate(INPUT, OUTPUT);
USES DateUtils;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
  FirstDateValid: BOOLEAN;

BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  FirstDateValid := FALSE;
  WHILE NOT EOF(FInput) AND NOT FirstDateValid 
  DO
    BEGIN
      ReadDate(FInput, VarDate);
      IF IsValidDate(VarDate.Mo, VarDate.Day) 
      THEN
        BEGIN
          READLN(FInput);
          WRITE(DateFile, VarDate);
          FirstDateValid := TRUE
        END
      ELSE
        BEGIN
          WRITELN('ошибка: Пропущена некорректная дата');
          READLN(FInput)
        END
    END;
  RESET(DateFile);
  WHILE NOT EOF(FInput) 
  DO
    BEGIN
      {Поместить новую дату в DateFile в соответствующее место}
      { DP 1.1 }
      ReadDate(FInput, D);
      IF IsValidDate(D.Mo, D.Day) 
      THEN
        BEGIN
          READLN(FInput);
          {копируем элементы меньшие, чем D из DateFile в TFile}
          { DP 1.1.1 }
          REWRITE(TFile);
          RESET(DateFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying 
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D) 
              THEN 
                WRITE(TFile, VarDate)
              ELSE 
                Copying := FALSE
            END;
          WRITE(TFile, D);
          IF NOT Copying 
          THEN 
            WRITE(TFile, VarDate);
          WHILE NOT EOF(DateFile) 
          DO
            BEGIN
              READ(DateFile, VarDate);
              WRITE(TFile, VarDate);
            END;
          {копируем TFile в DateFile}
          RESET(TFile);
          REWRITE(DateFile);
          WHILE NOT EOF(TFile) 
          DO
            BEGIN
              READ(TFile, VarDate);
              WRITE(DateFile, VarDate)
            END;
          RESET(DateFile)
        END
      ELSE
        BEGIN
          WRITE('ошибка: Пропущена некорректная дата');
          READLN(FInput)
        END
    END;
  {Копируем DateFile в OUTPUT}
  { DP 1.2 }
  WRITELN;
  WRITELN('отсортированнные даты');
  CopyOut(DateFile)
END.{SortDate}
