//Name Michael Lenghel

ArrayList<Star> stars = new ArrayList<Star>();

void setup()
{
  size(800, 800);
  loadData();
}//end setup

void draw()
{
  background(0);
  drawGrid();
}//end draw

void drawGrid()
{
  float border = width * 0.1f;
  float x, y, lx, ly;
  fill(0, 255, 255);
  stroke(0, 255, 255);
  textAlign(CENTER, CENTER);
  
  for (x = -5; x <= 5; x++)
  {
    lx = map(x, -5.0f, 5.0f, border, width - border);
    line(lx, border, lx, height - border);//x1, y1, x2, y2
    text((int)x, lx , border - 30); //word, x, y
  }//end for
  
   for (y = -5; y <= 5; y++)
  {
    ly = map(y, -5.0f, 5.0f, border, width - border);
    line(border, ly, width - border, ly);//x1, y1, x2, y2
    text((int)y, border - 30 , ly); //word, x, y
  }//end for
}//end drawGrid

void loadData()
{
  
}//end loadData