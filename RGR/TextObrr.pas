UNIT TextObr;

INTERFACE

PROCEDURE ExecuteParsing;

IMPLEMENTATION

USES TextUtils, WordStorage;

PROCEDURE ExecuteParsing;
VAR
  Ch: CHAR;
  CurrentWord: STRING;
  HasHyphen: BOOLEAN;
BEGIN
  CurrentWord := '';
  HasHyphen := FALSE;
  
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
END;

END.
