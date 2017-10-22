void setup()
{
  size(1000, 1000);
  
  board = new Board(150);
}

Board board;
void draw()
{
  background(0);
  board.render();
  board.update();
  board.line();
}