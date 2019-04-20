class NoiseField {
  float m;
  float[][] w;
  
  NoiseField(float m){
    this.m = m;
  }
  
  void genField() {
    w = new float[width][height];
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        w[x][y] = noise(x, y);
        map(w[x][y], 0, 1, -m, m);
      }
    }
  }
  
  float[][] get(){
    return w;
  }  
}
