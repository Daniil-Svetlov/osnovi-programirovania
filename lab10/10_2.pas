PROGRAM Format(INPUT, OUTPUT);
VAR
  A, B, Sk, Pr, St: CHAR;
BEGIN
  IF NOT EOLN THEN
  BEGIN
    READ(A);
    READ(B);
    Sk := 'N';      { внутри скобок }
    Pr := 'N';      { запрет лишнего пробела }
    St := 'Y'       { начало строки }
  END;
  WHILE NOT EOLN 
  DO
    BEGIN
			{обработка ключевых слов}
	  IF (A = 'B') AND (B = 'E') AND (Sk = 'N') 
	  THEN
		WRITE('BEGIN');
	  IF (A = 'R') AND (B = 'E') AND (Sk = 'N') 
	  THEN
	    BEGIN
	      WRITELN;
		  WRITE('  READ');
		  St := 'N'
		END;
	  IF (A = 'W') AND (B = 'R') AND (Sk = 'N') 
	  THEN
	    BEGIN
		  WRITELN;
		  WRITE('  WRITE');
		  St := 'N'
		END;
	  IF (A = 'E') AND (B = 'N') AND (Sk = 'N') 
	  THEN
	    BEGIN
		  WRITELN;
		  WRITE('END.')
		END;
	  IF (A = 'L') AND (B = 'N') 
	  THEN
	    WRITE('LN');
   {обработка скобок и параметров}
	  IF B = '(' 
	  THEN
		Sk := 'Y';
	  IF Sk = 'Y' 
	  THEN
	    BEGIN
		{ пробел после '(' }
		  IF (A = '(') AND (B = ' ') 
		  THEN
		    Pr := 'Y';
   { убрать лишний пробел }
		  IF (B = ' ') AND (A = '(') AND (Pr = 'N') 
		  THEN
			BEGIN
			  WRITE(' ');
			  Pr := 'Y'
			END;
      { пробел после ',' }
		  IF A = ',' 
		  THEN
		    BEGIN
			  Pr := 'Y';
			  WRITE(' ')
			END;
        { обычный символ }
		  IF B <> ' ' 
		  THEN
			BEGIN
			  WRITE(B);
			  Pr := 'N'
			END;
        { закрытие скобок }
		  IF B = ')' 
		  THEN
			Sk := 'N'
	    END;
   { форматирование после ; }
	  IF (B = ';') AND (St = 'Y') 
	  THEN
		BEGIN
		  WRITELN;
		  WRITE('  ');
		END;
	  IF B = ';' 
	  THEN
		BEGIN
		  WRITE(';');
		  St := 'N'
		END;
      { сдвиг окна }
	   A := B;
	   READ(B)
    END;
END.
