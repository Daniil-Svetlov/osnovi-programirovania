PROGRAM CountWords(INPUT, OUTPUT);

USES 
  WordStorage, 
  TextObr;

BEGIN
  {инициализируем переменные}
  InitStorage; 
  {быстрый цикл чтения текста и выделения слов}
  ExecuteParsing; 
  {Обходим дерево по алфавиту и записываем упорядоченный результат}
  SaveReport('output.txt');
  WRITELN('Результат сохранен в файл output.txt')
END.
