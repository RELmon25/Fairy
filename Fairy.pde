class Fairy{
  float x, y, z;  
  float tx, ty, tz;
  float radius;
  Wings w;
  ArrayList<Spark> sparks;
  
  Fairy(float radius){
    tx = 0;
    ty = 100;
    tz = 10000;
    this.radius = radius;
    w = new Wings(radius/830);
    sparks = new ArrayList<Spark>();
  }
  
  void step(){
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    z = map(noise(tz), 0, 1, -500, 500);
    tx += 0.01;
    ty += 0.01;
    tz += 0.01;
  }
  
  void display(){  
    //fondo
    blendMode(BLEND);
    background(0, 0, 0, 100);
    //alas
    translate(x, y, z);
    w.display(radius);
    //cuerpo
    colorMode(HSB, 360, 100, 100, 100);
    noStroke();
    blendMode(ADD);
    //lights();
    for (float i = 0.0; i < 0.5; i += 0.01) {
      fill(184, 30, (1.0 - i) * 5, 100);
      sphere(radius * i);
    }
    translate(-x,-y,-z);
    //chispas
    for(int i = 0; i < sparks.size(); i++){
      Spark s = sparks.get(i);
      s.display();
    }
  }
  
  void addSpark() {
    sparks.add(new Spark(x, y, z, radius/4));
  }
  
  void run(){
    step();
    display();
    for(int i = 0; i < sparks.size(); i++){
      Spark s = sparks.get(i);
      if(s.isDead()) sparks.remove(i);
    }
  }
}
