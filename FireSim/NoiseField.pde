class NoiseField {
  float m;
  float err;
  float[][] w; 
  float t;
  boolean recording;
  float tAtRec;

  NoiseField(float m, float err) {
    this.m = m;
    this.err = err;
  }

  float a = 0;
  void genField(float t_) {
    t = t_;
    w = new float[width][height]; 
    
    float yoff = 0;
    for (int y = 0; y < width; y++) {
      float xoff = 0;
      for (int x = 0; x < height; x++) {
        w[x][y] = map(noise(xoff, yoff, t), 0, 1, 0, m);
        xoff += err;
      }
      yoff += err;
    }
    
    t = floor(map(sin(a), -1, 1, 0, 200));
    a =  (a + 1) % TWO_PI;
    println("t = " + t);
    println("tAtRec = " + tAtRec);
    if (t == tAtRec && recording) {
      recording = false;
    }
  }

  void startRecording(){
    tAtRec = t;
    recording = true;
  }

  float[][] get() {
    return w;
  }
}
