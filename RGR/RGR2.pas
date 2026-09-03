PROGRAM CountWords;

USES WordStorage2, TextUtils;

VAR
  OutF: TEXT;
  Ch: CHAR;
  CurrentWord: STRING;
  HasHyphen: BOOLEAN;

PROCEDURE PrintTree(Idx: PNode);
BEGIN
  IF Idx <> NIL THEN
  BEGIN
    PrintTree(Idx^.Left);
    WRITELN(OutF, Idx^.Key, ' ', Idx^.Count);
    PrintTree(Idx^.Right);
  END;
END;

BEGIN
  Init;
  CurrentWord := '';
  HasHyphen := FALSE;
  ASSIGN(OutF, 'output.txt');
  REWRITE(OutF);
  
  WHILE NOT EOF DO
  BEGIN
    WHILE NOT EOLN AND NOT EOF DO
    BEGIN
      READ(Ch);
      IF IsLetter(Ch) THEN
      BEGIN
        IF HasHyphen THEN 
        BEGIN 
          CurrentWord := CurrentWord + '-'; 
          HasHyphen := FALSE; 
        END;
        CurrentWord := CurrentWord + ToLowerChar(Ch);
      END
      ELSE IF Ch = '-' THEN
      BEGIN
        IF CurrentWord <> '' THEN 
          HasHyphen := TRUE;
      END
      ELSE
      BEGIN
        AddToStats(CurrentWord);
        CurrentWord := '';
        HasHyphen := FALSE;
      END;
    END;
    
    AddToStats(CurrentWord);
    CurrentWord := '';
    HasHyphen := FALSE;
    
    IF NOT EOF THEN 
      READLN;
  END;
  
  PrintTree(Root);
  WRITELN(OutF, '---');
  WRITELN(OutF, 'Всего слов: ', TotalWords);
END.
