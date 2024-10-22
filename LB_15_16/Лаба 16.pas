program obratniyporyadok;

type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head, p: PNode; // указатели на голову списка и текущий узел
  FInput, FOutput: Text; // файловые переменные
  num, i: integer; // переменные для числа и цикла

procedure AddFirst(var Head: PNode; num: integer); // процедура добавления элемента в начало списка
var
  NewNode: PNode; // новый узел списка
begin
  New(NewNode); // выделение памяти под новый узел
  NewNode^.data := num; // сохранение данных в узле
  NewNode^.next := Head; // указание на следующий элемент списка
  Head := NewNode; // обновление головы списка
end;

begin
  Randomize; // инициализация генератора случайных чисел
  Assign(FInput, 'input2.txt'); // привязка файла для ввода
  Rewrite(FInput); // открытие файла для записи
  for i := 1 to 10 do // цикл для генерации чисел
  begin
    num := Random(100); // генерация случайного числа
    WriteLn(FInput, num); // запись числа в файл
  end;
  Close(FInput); // закрытие файла

  Assign(FInput, 'input2.txt'); // привязка файла для чтения
  Reset(FInput); // открытие файла для чтения
  Head := nil; // инициализация головы списка
  while not EOF(FInput) do // цикл чтения чисел из файла
  begin
    Readln(FInput, num); // чтение числа из файла
    AddFirst(Head, num); // добавление числа в список
  end;
  Close(FInput); // закрытие файла

  Assign(FOutput, 'output2.txt'); // привязка файла для вывода
  Rewrite(FOutput); // открытие файла для записи
  p := Head; // указатель на голову списка
  while p <> nil do // цикл вывода чисел из списка в файл
  begin
    WriteLn(FOutput, p^.data); // запись числа в файл
    p := p^.next; // переход к следующему элементу списка
  end;
  Close(FOutput); // закрытие файла
  Writeln('Список чисел был записан в обратном порядке в файл output2.txt'); // вывод сообщения
end.
