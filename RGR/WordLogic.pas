UNIT Wordlogic;

INTERFACE

CONST
  Max = 2000;
  ListEnd = 0;

TYPE
  WordRec = RECORD
    Key: STRING;
    Count: INTEGER;
    Next: 0..Max;
  END;

VAR
  Arr: ARRAY [1..Max] OF WordRec;
  First: 0..Max;
  FreeIndex: 0..Max;
  TotalWords: LONGINT; { Счётчик всех слов }

PROCEDURE Init;
PROCEDURE AddToStats(S: STRING);

IMPLEMENTATION

USES TextUtils; { Нужен для IsFirstGreater }

PROCEDURE Init;
BEGIN
  First := ListEnd;
  FreeIndex := 0;
  TotalWords := 0;
END;

PROCEDURE AddToStats(S: STRING);
VAR
  Prev, Curr: 0..Max;
  Found: BOOLEAN;
BEGIN
  IF S <> '' THEN
  BEGIN
    TotalWords := TotalWords + 1; { Считаем каждое слово }
    
    Prev := 0;
    Curr := First;
    Found := FALSE;

    { Ищем слово или место для вставки }
    WHILE (Curr <> ListEnd) AND NOT Found DO
    BEGIN
      IF Arr[Curr].Key = S THEN Found := TRUE
      ELSE IF IsFirstGreater(Arr[Curr].Key, S) THEN Found := TRUE
      ELSE 
      BEGIN
        Prev := Curr;
        Curr := Arr[Curr].Next;
      END;
    END;

    { Если нашли в точности то же слово — инкрементируем }
    IF Found AND (Curr <> ListEnd) AND (Arr[Curr].Key = S) THEN
      Arr[Curr].Count := Arr[Curr].Count + 1
    ELSE IF FreeIndex < Max THEN
    BEGIN
      FreeIndex := FreeIndex + 1;
      Arr[FreeIndex].Key := S;
      Arr[FreeIndex].Count := 1;
      Arr[FreeIndex].Next := Curr;
      
      IF Prev = 0 THEN First := FreeIndex
      ELSE Arr[Prev].Next := FreeIndex;
    END;
  END;
END;

END.
