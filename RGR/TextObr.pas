UNIT TextObr;

INTERFACE

PROCEDURE ExecuteParsing; {процедура парсинга}

IMPLEMENTATION

USES textutils, wordstorage;

PROCEDURE ExecuteParsing;
{обработка слов и знаков препинания}
VAR
  Ch: CHAR;
  CurrentWord: STRING;
  CleanWord: STRING;
  HasHyphen: BOOLEAN;
  i: INTEGER;
BEGIN
  CurrentWord := '';
  HasHyphen := FALSE; 
  WHILE NOT EOF AND NOT IsStorageFull 
  DO
    BEGIN
      WHILE NOT EOLN AND NOT EOF AND NOT IsStorageFull 
      DO
        BEGIN
          READ(Ch);
          IF IsLetter(Ch) 
          THEN
            BEGIN
              IF HasHyphen 
              THEN 
                BEGIN 
                  CurrentWord := CurrentWord + '-'; 
                  HasHyphen := FALSE
                END;
              CurrentWord := CurrentWord + Ch
            END
          ELSE 
            IF Ch = '-' 
            THEN
              BEGIN
                IF CurrentWord <> '' 
                THEN 
                  HasHyphen := TRUE
              END
          ELSE
            BEGIN
              IF CurrentWord <> '' 
              THEN
                BEGIN
                  IF NOT IsStorageFull 
                  THEN 
                    BEGIN
                      CleanWord := '';
                      FOR i := 1 TO Length(CurrentWord) DO
                        CleanWord := CleanWord + ToLowerChar(CurrentWord[i]);    
                      AddToStats(CleanWord);
                    END;
                  CurrentWord := '';
                  HasHyphen := FALSE
                END
            END
        END; 
      IF (CurrentWord <> '') AND NOT IsStorageFull 
      THEN
        BEGIN
          CleanWord := '';
          FOR i := 1 TO Length(CurrentWord) DO
            CleanWord := CleanWord + ToLowerChar(CurrentWord[i]);
          AddToStats(CleanWord);
          CurrentWord := '';
          HasHyphen := FALSE
        END;   
      IF NOT IsStorageFull 
      THEN
        BEGIN
          IF NOT EOF 
          THEN 
            READLN
        END
    END
END

END.



PROCEDURE AddToStats(S: STRING);
{добавление нового слова в дерево}
VAR
  Curr, Parent: 0..Max;
  Found: BOOLEAN;
  LowS: STRING; 
  i: INTEGER;
BEGIN
  IF S <> '' 
  THEN
    BEGIN
      LowS := '';
      FOR i := 1 TO Length(S) DO 
        LowS := LowS + ToLowerChar(S[i]);
      Curr := Root;
      Parent := NilNode;
      Found := FALSE;   
      WHILE (Curr <> NilNode) AND NOT Found 
      DO
        BEGIN
          Parent := Curr;
          IF Tree[Curr].Key = LowS 
          THEN 
            Found := TRUE
          ELSE 
            IF IsFirstGreater(Tree[Curr].Key, LowS) 
            THEN 
              Curr := Tree[Curr].Left
            ELSE 
              Curr := Tree[Curr].Right
        END;
      IF Found 
      THEN
        BEGIN
          TotalWords := TotalWords + 1;
          Tree[Parent].Count := Tree[Parent].Count + 1
        END
      ELSE 
        BEGIN
          IF FreeIndex < Max 
          THEN
            BEGIN
              TotalWords := TotalWords + 1;
              FreeIndex := FreeIndex + 1;
              Tree[FreeIndex].Key := LowS; 
              Tree[FreeIndex].Count := 1;
              Tree[FreeIndex].Left := NilNode;
              Tree[FreeIndex].Right := NilNode;
              IF Parent = NilNode 
              THEN 
                Root := FreeIndex
              ELSE 
              IF IsFirstGreater(Tree[Parent].Key, LowS) 
              THEN 
                Tree[Parent].Left := FreeIndex
              ELSE 
                Tree[Parent].Right := FreeIndex;
              IF (FreeIndex = Max) AND NOT Warned 
              THEN
                BEGIN
                  WRITELN('Достигнут лимит в ', Max, ' уникальных слов.Все последующие новые уникальные слова будут пропущены.');
                  Warned := TRUE
                END
            END
          ELSE
            BEGIN
              IF NOT Warned 
              THEN
                BEGIN
                  WRITELN('Достигнут лимит в ', Max, ' уникальных слов.Все последующие новые уникальные слова будут пропущены.');
                  Warned := TRUE
                END
            END
        END
    END
END;
