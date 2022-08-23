Fairy f;

void setup(){
  size(1200, 600, P3D);
  frameRate(20);
  colorMode(HSB, 360, 100, 100, 100);
  f = new Fairy(100);
}

void draw(){
  int m = millis();
  if(m % 13 == 0) f.addSpark();
  f.run();
}
