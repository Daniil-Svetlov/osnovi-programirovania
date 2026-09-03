UNIT WordStorage;

INTERFACE

CONST
  Max = 200;
  NilNode = 0;

TYPE
  Node = RECORD
    Key: STRING;
    Count: INTEGER;
    Left, Right: 0..Max;
  END;

VAR
  Tree: ARRAY [1..Max] OF Node;
  Root: 0..Max;
  FreeIndex: 0..Max;
  TotalWords: INTEGER;
  Warned: BOOLEAN;

PROCEDURE InitStorage;  {инициализация}
PROCEDURE AddToStats(S: STRING); {добавление нового слова}
PROCEDURE SaveReport(FileName: STRING); {сохранение результата}
FUNCTION IsStorageFull: BOOLEAN; {проверка переполнения}

IMPLEMENTATION

USES TextUtils;

PROCEDURE InitStorage;
{инициализация начальных состояний}
BEGIN
  Root := NilNode;
  FreeIndex := 0;
  TotalWords := 0;
  Warned := FALSE
END;

FUNCTION IsStorageFull: BOOLEAN;
{проверка, заполнено ли дерево до предела}
BEGIN
  IsStorageFull := (FreeIndex >= Max)
END;

PROCEDURE AddToStats(S: STRING);
{добавление нового слова в дерево}
VAR
  Curr, Parent: 0..Max;
  Found: BOOLEAN;
BEGIN
  IF S <> '' 
  THEN
    BEGIN
      Curr := Root;
      Parent := NilNode;
      Found := FALSE;   
      WHILE (Curr <> NilNode) AND NOT Found DO
        BEGIN
          Parent := Curr;
          IF Tree[Curr].Key = S 
          THEN 
            Found := TRUE
          ELSE 
            IF IsFirstGreater(Tree[Curr].Key, S) 
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
              Tree[FreeIndex].Key := S;
              Tree[FreeIndex].Count := 1;
              Tree[FreeIndex].Left := NilNode;
              Tree[FreeIndex].Right := NilNode;      
              IF Parent = NilNode 
              THEN 
                Root := FreeIndex
              ELSE 
                IF IsFirstGreater(Tree[Parent].Key, S) 
                THEN 
                  Tree[Parent].Left := FreeIndex
                ELSE 
                  Tree[Parent].Right := FreeIndex;
              IF (FreeIndex = Max) AND NOT Warned 
              THEN
                BEGIN
                  WRITELN('Достигнут лимит в ', Max, ' уникальных слов! Все последующие новые уникальные слова будут пропущены.');
                  Warned := TRUE
                END
            END
        END
    END
END;

PROCEDURE PrintTree(VAR OutF: TEXT; Idx: INTEGER);
{рекурсивный симметричный обход дерева (сортировка)}
BEGIN
  IF Idx <> NilNode 
  THEN
    BEGIN
      PrintTree(OutF, Tree[Idx].Left);
      WRITELN(OutF, Tree[Idx].Key, ' ', Tree[Idx].Count);
      PrintTree(OutF, Tree[Idx].Right)
    END
END;

PROCEDURE SaveReport(FileName: STRING);
{сохранение финального результата в файл}
VAR 
  OutF: TEXT;
BEGIN
  ASSIGN(OutF, FileName);
  REWRITE(OutF);
  PrintTree(OutF, Root);
  WRITELN(OutF, 'Всего слов: ', TotalWords);
  CLOSE(OutF)
END;

END.
