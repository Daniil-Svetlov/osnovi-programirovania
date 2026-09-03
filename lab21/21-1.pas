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
BEGIN{Initialize}
  Code[' '] := 'R';
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A'
END;{Initialize}

PROCEDURE Encode(VAR S: Str; VAR LenOfString: LenRange);
VAR
  Index: 1 .. Len;
BEGIN{Encode}
  FOR Index := 1 TO LenOfString
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;{Encode}

BEGIN{Encryption}
  WRITELN('Обрабатываем только первые 20 символов');
  Initialize(Code);
  I := 0;
  WHILE NOT EOLN AND (I < Len)
  DO
    BEGIN
      I := I + 1;
      READ(Msg [I] )        
    END;
  Encode(Msg, I);
  IF NOT EOLN 
  THEN
      WRITELN('Обработаны только первые 20 символов')
END.{Encryption}
