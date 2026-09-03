PROGRAM What(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  WRITELN('Введите символ,который хотите проверить');
  READ(ch);
  IF '0'<= Ch
  THEN
    IF Ch <= '9'
    THEN
      WRITELN('YES,  ', ch, ' <=9')
    ELSE
      WRITELN('NO,  ', ch, ' >=9 ')
  ELSE            
    WRITELN('NO, ' , ' 0>=', Ch)
END.