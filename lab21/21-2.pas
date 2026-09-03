PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;  
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  LenRange = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: LenRange;

PROCEDURE Initialize(VAR Code: Chiper);
{ Процедура считывает шифр из текстового файла }
VAR
  CipherFile: TEXT;
  OrigChar, CipherChar: CHAR;
BEGIN{Initialize}
  FOR OrigChar := ' ' TO 'Z' DO
    Code[OrigChar] := OrigChar;
  ASSIGN(CipherFile, 'sim.txt');
  RESET(CipherFile);
  WHILE NOT EOF(CipherFile) 
  DO
    BEGIN
      IF NOT EOLN(CipherFile) 
      THEN
        BEGIN
          READ(CipherFile, OrigChar);  
          READ(CipherFile, CipherChar);
          Code[OrigChar] := CipherChar
        END;
      READLN(CipherFile)
    END;
  CLOSE(CipherFile)
END;{Initialize}

PROCEDURE Encode(VAR S: Str; VAR LenOfString: LenRange);
{шифрование символов}
VAR
  Index: 1 .. Len;
BEGIN{Encode}
  FOR Index := 1 TO LenOfString DO
    IF S[Index] IN [' ' .. 'Z'] 
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;{Encode}

BEGIN{Encryption}
  Initialize(Code);
  I := 0;
  WHILE NOT EOLN AND (I < Len) 
  DO
    BEGIN
      I := I + 1;
      READ(Msg[I])        
    END;
  WRITE('Результат: ');
  Encode(Msg, I);
  IF NOT EOLN 
  THEN
    WRITELN('Обработаны только первые 20 символов.');

END.{Encryption}
