uses rec;
uses GraphABC;

// Процедура для вывода текста на экран
procedure DrawText;
begin
  // Текстовые подсказки
  TextOut(10, 100, 'Left - влево');
  TextOut(10, 120, 'Right - вправо');
  TextOut(10, 140, 'Up - вверх');
  TextOut(10, 160, 'Down - вниз');
  TextOut(10, 180, 'z - увеличение');
  TextOut(10, 200, 'a - уменьшение');
  TextOut(10, 220, 'x - назад');
  TextOut(10, 240, 's - вперёд');
  TextOut(10, 260, 'esc - выход');  
end;

// Масштабирование
Procedure KeyDown(k: integer);
begin
 case K of
    VK_Down: wy -= 10;
    VK_Up: wy += 10; 
    VK_Left: wx += 10;  
    VK_Right: wx -= 10;
    VK_Escape: halt(1); 
    VK_A: if m < 500 then m += 10;
    VK_Z: if m > 20 then m -= 10;
    VK_S: if g < 15 then g += 1;
    VK_X: if g > 2 then g -= 1;
   end;
 Window.Clear; 
 DrawText;
 Draw(wx - m, wy, wx + m, wy, g); // отрисовка фрактала
 Redraw; 
end; 

begin
  // Вывод подсказок на экран
  writeln('Left - влево');
  writeln('Right - вправо');
  writeln('Up - вверх');
  writeln('Down - вниз');
  writeln('z - увеличение');
  writeln('a - уменьшение');
  writeln('x - назад');
  writeln('s - вперёд');
  writeln('esc - выход');
  
  LockDrawing; // блокировка отрисовки
  
  // Основной блок программы
  begin
    LockDrawing;
    DrawText; // вывод текста
    SetWindowCaption('Фракталы: Кривая Дракона');
    SetWindowSize(700, 512);
    LockDrawing;
    KeyDown(0);
    OnkeyDown += KeyDown;
  end;
end.
