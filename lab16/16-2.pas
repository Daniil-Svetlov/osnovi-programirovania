PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
BEGIN
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE;
  READ(W1, W2, W3, W4);
  WHILE Looking AND NOT (Land OR Sea) 
  DO
    BEGIN
      { проверка на land }
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      { проверка на sea }
      Sea := (W1='s') AND (W2 = 'e') AND (W3 = 'a');
      IF NOT (Land OR Sea) 
      THEN
        BEGIN
          W1 := W2;
          W2 := W3;
          W3 := W4;
          READ(W4);
          IF EOF 
          THEN 
            Looking := FALSE;
        END;
    END;
  IF Land 
  THEN
    WRITE('The British are coming by land')
  ELSE
    IF Sea 
    THEN
      WRITE('The British are coming by sea')
    ELSE
      WRITE('Sarah didn''t say');

END.
