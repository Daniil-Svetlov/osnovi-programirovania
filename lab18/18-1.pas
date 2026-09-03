PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  S = 100;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: INTEGER;
  Student: INTEGER;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize 
  DO
  BEGIN
    TotalScore := 0;
    WhichScore := 1;
    WHILE WhichScore <= NumberOfScores 
      DO
        BEGIN
          IF NOT EOF 
          THEN
            READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      ClassTotal := ClassTotal + TotalScore;
      Ave := (TotalScore * 10) DIV NumberOfScores;
      IF Ave MOD 10 >= 5 
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      Student := Student + 1
    END;
  WRITELN;
  WRITELN('Class average:');
  ClassTotal := (ClassTotal * S) DIV (ClassSize * NumberOfScores);
  WRITE(ClassTotal DIV S, '.');
  IF (ClassTotal MOD S) < 10 
  THEN
    WRITE('0');
  WRITELN(ClassTotal MOD S)
END.
