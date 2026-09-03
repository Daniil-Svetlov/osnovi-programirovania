PROGRAM InsertSort2(INPUT, OUTPUT);
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           Key: CHAR
         END;
VAR
  FirstPtr, NewPtr, Curr, Prev: NodePtr;
BEGIN {InsertSort2}
  FirstPtr := NIL;
  WHILE NOT EOLN 
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      {2.1. Поместить NewPtr в надлежащее место }
      Prev := NIL;
      Curr := FirstPtr;     
      {DP 2.1.1}
      NewPtr^.Next := Curr;
      IF Prev = NIL 
      THEN
        FirstPtr := NewPtr
      ELSE
        Prev^.Next := NewPtr
    END;
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL 
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN
END.
