UNIT TextUtils;

INTERFACE

FUNCTION IsLetter(Ch: CHAR): BOOLEAN;  {проверка на букву}
FUNCTION ToLowerChar(Ch: CHAR): CHAR;  {перевод в нижний регистр}
FUNCTION IsFirstGreater(S1, S2: STRING): BOOLEAN;  {сравнение двух строк}

IMPLEMENTATION

FUNCTION IsLetter(Ch: CHAR): BOOLEAN;
{проверка является ли символ буквой}
BEGIN
  IsLetter := (Ch IN ['a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я', 'ё', 'Ё'])
END;

FUNCTION ToLowerChar(Ch: CHAR): CHAR;
{перевод символа в нижний регистр}
CONST
  Upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯЁ';
  Lower = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюяё';
VAR j: INTEGER;
BEGIN
  ToLowerChar := Ch;
  FOR j := 1 TO 66 DO
    IF Ch = Upper[j] 
    THEN 
      ToLowerChar := Lower[j]
END;

FUNCTION GetWeight(Ch: CHAR): INTEGER;
{определяет вес буквы}
CONST
  SortedAlp = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
VAR i: INTEGER;
BEGIN
  GetWeight := 0;
  FOR i := 1 TO 60 DO
    IF SortedAlp[i] = ToLowerChar(Ch) 
    THEN   
      GetWeight := i
END;

FUNCTION IsFirstGreater(S1, S2: STRING): BOOLEAN;
{функция сравнения строк}
VAR 
  i: INTEGER;
  W1, W2: INTEGER;
  Done: BOOLEAN;
BEGIN
  i := 1;
  Done := FALSE;
  IsFirstGreater := FALSE;
  WHILE (i <= Length(S1)) AND (i <= Length(S2)) AND NOT Done 
  DO
    BEGIN
      IF S1[i] <> S2[i] 
      THEN
        BEGIN
          W1 := GetWeight(S1[i]);
          W2 := GetWeight(S2[i]);
          IF W1 > W2 THEN IsFirstGreater := TRUE;
          Done := TRUE
        END;
        i := i + 1
    END;
  IF NOT Done AND (Length(S1) <> Length(S2)) 
  THEN
    BEGIN
      IF Length(S1) > Length(S2) THEN IsFirstGreater := TRUE;
      Done := TRUE
    END
END;

END.
