float x = 0;
float y = 0;
float timeStep = 1;
void setup(){
  size(800, 800);
  background(10);
  line(0, 0, 1, 0);
  line(0, 0, 0, 1);
}

void draw(){
    translate(width / 2, height);
    rotate(180);
  y = x;
  
  stroke(255);
  strokeWeight(5);
  point(x, y);
  
  x += timeStep;
}
