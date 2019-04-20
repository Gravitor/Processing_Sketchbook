int x = 0;
int y = 0;
int l = 600;
int b = 5;
int a = 50;

Triangle tri = new Triangle(x, y, l, b, a);

void setup(){
  size(600, 600);
  background(0); 
  translate(0 , height);    
  colorMode(RGB);
  tri.inst();
}

void keyPressed(){
  if(key == ' '){
    saveFrame("Triforce_Fractal_#####.png");
  }
}

void draw(){
 
}
