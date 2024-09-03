unit rec;
uses GraphABC;


// Параметризация
var (m, wx, wy, g) := (100, 300, 300, 10);

// База рекурсии и декомпозиция
Procedure Draw(x, y, dx, dy, k: integer);
begin
     // База рекурсии
     If k > 0 then
     begin
          var xn := (x + dx) div 2 + (dy - y) div 2; // декомпозиция
          var yn := (y + dy) div 2 - (dx - x) div 2; // декомпозиция
          Draw(x, y, xn, yn, k - 1); //рекурсия вызывает сама себя
          Draw(dx, dy, xn, yn, k - 1); //рекурсия вызывает сама себя
     end
     else 
          line(x, y, dx, dy); // база рекурсии
end;
begin

end.
