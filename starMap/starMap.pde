//Name Michael Lenghel

//Declare global variables
ArrayList<Star> stars = new ArrayList<Star>();
int selected1 = 0;
int selected2 = 0;
float clickedX;
float clickedY;
float endLineX;
float endLineY;
float distance;

void setup()
{
  size(800, 800);
  loadData();
  listData();
}//end setup

void draw()
{
  float border = width * 0.1f;
  boolean check = false;
  background(0);
  drawGrid();
  drawStars();
  stroke(255, 255, 0);
  
  if(selected1 == 1 && selected2 == 0)
  {
    line(clickedX, clickedY, mouseX, mouseY);
  }//end if
  
  else if(selected1 == 1 && selected2 == 1)
  {
    line(clickedX, clickedY, endLineX, endLineY);
    fill(255, 0, 255);
    check = true;
  }//end else if
  
  if(check)
  {
    text("Distance is " + distance + " parsecs between Star 1 and star 2" ,border * 3, height - (height * 0.05));
  }//end if

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
    noFill();
    line(xPos - 2, yPos, xPos + 2, yPos);
    line(xPos, yPos - 2, xPos, yPos + 2);
    ellipse(xPos, yPos, star.absMag, star.absMag);
    fill(100, 92, 192);
    text(star.displayName, xPos +  star.absMag, yPos - star.absMag);
  }//end for
}//end drawStars

void mousePressed()
{
  if (checkIfStar())
  {
    if(selected1 == 0 && selected2 == 0)
    {
      selected1 = 1;
      clickedX = mouseX;
      clickedY = mouseY;
    }//end if
  
  else if (selected1 == 1 && selected2 == 0)
  {
    selected2 = 1;
    endLineX = mouseX;
    endLineY = mouseY;
    
    distance = dist(clickedX, clickedY, endLineX, endLineY);
  }//end else if
  
  else if (selected1 == 1 && selected2 == 1)
    {
      //Set all values to default
      selected2 = 0;
      endLineX = endLineY = 0.f;
      
      selected1 = 1;
      clickedX = mouseX;
      clickedY = mouseY;
    }//end else if
  }//end original if
  
}//end mousePressed

boolean checkIfStar()
{
  for(int i = 0 ; i < stars.size() ; i ++)
  {
     Star star = stars.get(i);
     if(dist(mouseX, mouseY,star.xg, star.yg) < star.absMag / 2)
     {
       return(true);
     }//end if
  }//end for
  
  return(false);
}//end checkIfStar