ArrayList<Particle> particles = new ArrayList<Particle>();
NoiseField field = new NoiseField(255);

float speed = 2;
int cycles = 0;
PImage img;

void setup() {
  size(300, 300);

  field.genField();
  img = createImage(width, height, RGB);
  
  img.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + (y * width);
      float col = field.get()[x][y];
      img.pixels[index] = color(col, col, col, 255); 
    }
  }
  img.updatePixels(); 
  
  image(img, 0, 0);
}

void draw() {
  println(frameRate);
  //background(0);
  if (cycles % 10 == 0) {
    for (int i = 0; i < width; i++) {
      Particle newP = new Particle(i, height, speed);
      particles.add(newP);
    }
  }/*
  for (int i = 0; i < particles.size(); i++) {
   Particle p = particles.get(i);
   if (p.a <= 10 || p.y <= 0) {
   particles.remove(particles.get(i));
   }
   
   p.Update();
   p.cool(field.get()[p.x][p.y]);
   }*/
}
