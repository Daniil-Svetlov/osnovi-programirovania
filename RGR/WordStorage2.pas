UNIT WordStorage2;

INTERFACE

TYPE
  PNode = ^Node;
  Node = RECORD
    Key: STRING;
    Count: INTEGER;
    Left, Right: PNode;
  END;

VAR
  Root: PNode;
  TotalWords: LONGINT;

PROCEDURE Init;
PROCEDURE AddToStats(S: STRING);

IMPLEMENTATION

USES TextUtils;

PROCEDURE Init;
BEGIN
  Root := NIL;
  TotalWords := 0;
END;

PROCEDURE AddToStats(S: STRING);
VAR
  Curr, Parent: PNode;
  Found: BOOLEAN;
  NewNode: PNode;
BEGIN
  IF S = '' THEN EXIT;

  TotalWords := TotalWords + 1;
  Curr := Root;
  Parent := NIL;
  Found := FALSE;

  WHILE (Curr <> NIL) AND NOT Found DO
  BEGIN
    Parent := Curr;
    IF Curr^.Key = S THEN 
      Found := TRUE
    ELSE IF IsFirstGreater(Curr^.Key, S) THEN 
      Curr := Curr^.Left
    ELSE 
      Curr := Curr^.Right;
  END;

  IF Found THEN
    Parent^.Count := Parent^.Count + 1
  ELSE
  BEGIN
    NEW(NewNode);
    NewNode^.Key := S;
    NewNode^.Count := 1;
    NewNode^.Left := NIL;
    NewNode^.Right := NIL;

    IF Parent = NIL THEN 
      Root := NewNode
    ELSE IF IsFirstGreater(Parent^.Key, S) THEN 
      Parent^.Left := NewNode
    ELSE 
      Parent^.Right := NewNode;
  END;
END;

END.
