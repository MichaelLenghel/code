PImage img;

void setup()
{
  //size(500,500);
  fullScreen();
  stroke(255);
  strokeWeight(.25);
  img = loadImage("shh.jpg");
}
  float roadMove = 1;
  float speed = 0.05;
void draw()
{
  int i  = 0;
  image(img, 0, 0, width, height);

  for (i=0; i< width / 10; i++)
  {
    line(width/2,height/2,i*10,height);
  }

    drawRoad();
  
}//end draw

void drawRoad()
{

  int i = height / 2;
  float y = 1;

  if (roadMove > 2.25)
  {
    roadMove = 1;
  }//end if
  
  while(i < height)
  {
    line(0,i,width,i);
    i = i + int(y);
    //The lines are drawn with 25% distance increase inbetween them -> y = 1.25
    //roadMove + speed is what actually allows for movement
    y = y * 1.25 + roadMove;
  }
  
  roadMove += speed;

}//end drawRoad