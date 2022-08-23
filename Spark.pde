class Spark{
  float x, y, z;
  float lifespan;
  float originalLifespan;
  
  Spark(float x, float y, float z, float maxSize){
    this.x = x;
    this.y = y;
    this.z = z;
    lifespan = originalLifespan = maxSize;
  }
  
  void fall(){
   y += random(0, 1.0);
   lifespan -= (originalLifespan / 50);
  }
  
  boolean isDead(){
    return (lifespan <= 0);
  }
  
  void display(){
    noStroke();
    fall();
    translate(x, y, z);
    blendMode(ADD);
    lights();
    float t = abs(2 * lifespan * sin(lifespan))+lifespan;
    for (float i = 0.0; i < 0.5; i += 0.01) {
      fill(184, 50, (1.0 - i) * 5, 100);
      //sphere(t * i);
      circle(0, 0, t * i);
    }
    translate(-x,-y,-z);
  }
}
