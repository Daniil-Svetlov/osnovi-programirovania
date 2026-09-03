PROGRAM CopyStr(INPUT, OUTPUT);

PROCEDURE RCopy;
{ѕечатает  введенную строку в OUTPUT}
VAR
  Ch: CHAR;
BEGIN{RCopy}
  IF NOT EOLN 
  THEN
    BEGIN
    {—читываем символ и выводим его до конца строки}
      READ(Ch);        
      WRITE(Ch);
      RCopy      
    END
END;{RCopy}

BEGIN{CopyStr}
  RCopy
END.{CopyStr}
