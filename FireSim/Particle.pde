class Particle {
  int x;
  int y;
  float s;
  float r, g, b;
  float a = 255;
  Particle(int x, int y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    
    r = 255;
    g = 100;
    b = 0;
    a = 255;
  }

  void Update() {
    Draw();
    Move();
  }

  void Draw(){
    fill(r, g, b, a);
    noStroke();
    ellipse(x, y, 3, 3);
    a -= 1;
    r -= 2;
    g -= 3;
  }

  void Move() {
    y -= s;
  }
  
  void cool(float x){
    a = -x;
  }
}
