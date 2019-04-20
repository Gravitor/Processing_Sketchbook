class Triangle{
  int x;
  int y;
  int l;
  int b;
  int a;
  int h;
  
  Triangle(int x_, int y_, int l_, int b_, int a_){
    this.x = x_;
    this.y = y_;
    this.l = l_;
    this.b = b_;
    this.a = a_;
    
    this.h = (int)-(l * sqrt(3))/ 2;
  } 
  void inst(){
     Draw(); 
  }

  void Draw(){        
    stroke(255);
    strokeWeight(2);
    fill(200, 150, 0, a);    
    triangle(x, y, x + l, y , x + l/2, y + h);
    
    if(b > 0){
      Triangle tri;
     
      //triangle 1    
      tri = new Triangle(x, y, l/2, b-1, a+5);
      tri.inst();
      
      //triangle 2    
      tri = new Triangle(x + l/2, y, l/2, b-1, a+5);
      tri.inst();
      
      //triangle 3
      tri = new Triangle(x + l/4, y + h/2, l/2, b-1, a+5);
      tri.inst();    
    }  
  } 
}
