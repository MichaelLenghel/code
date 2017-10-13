//Name Michael Lenghel

ArrayList<Star> stars = new ArrayList<Star>();

void setup()
{
  size(800, 800);
  loadData();
  listData();
}//end setup

void draw()
{
  background(0);
  drawGrid();
  drawStars();
}//end draw

void loadData()
{
  //load table
  Table table = loadTable("HabHYG15ly.csv", "header");
  
  //Go through each row and add the data to the array list
  for (TableRow row:table.rows())
  {
    Star star = new Star(row);
    stars.add(star);
  }//end for
}//end loadData

void listData()
{
  for (Star star:stars)
  {
      println(star);
  }//end for
}//end listData

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
    text((int)x, lx , border - border * 0.4); //word, x, y
  }//end for
  
   for (y = -5; y <= 5; y++)
  {
    ly = map(y, -5.0f, 5.0f, border, width - border);
    line(border, ly, width - border, ly);//x1, y1, x2, y2
    text((int)y, border - border * 0.4 , ly); //word, x, y
  }//end for
}//end drawGrid

void drawStars()
{
  stroke(210, 200, 222);
  noFill();
  float border = width * 0.1f;
  float xPos, yPos;
  for (Star star:stars)
  {
    xPos = map(star.xg, -5, 5, border, width - border);
    yPos = map(star.yg, -5, 5, border, height - border);
    
    line(xPos - 2, yPos, xPos + 2, yPos);
    line(xPos, yPos - 2, xPos, yPos + 2);
    ellipse(xPos, yPos, star.absMag, star.absMag);
  }//end for
}//end drawStars