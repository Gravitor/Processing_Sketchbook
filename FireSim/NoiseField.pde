class NoiseField {
  float m;
  float err;
  float[][] w;

  NoiseField(float m, float err) {
    this.m = m;
    this.err = err;
  }

  void genField(float t) {
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
  }

  float[][] get() {
    return w;
  }
}
