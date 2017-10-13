color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(200,200);
}

void draw() {
  background(255);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  rect(0, height / 2 + 10, width, 10); // x1, y1, width, height
  fill(255);
  rect(x,y,30,10);
  ellipse(x - 5,y + 10,10,10);
  ellipse(x + 15,y + 10,10,10);
  arc(x + 13, 125, 30, 30, 0, PI / 2);
  fill(0);
}