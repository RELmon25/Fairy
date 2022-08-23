class Wings {
  PShape upper, body1, top, left;
  PShape lower, body2, right;
  float f;
  int dir;

  Wings(float scale){
      fill(200,34,83,50);
      noStroke();
      //alas superiores
      upper = createShape(GROUP);
      body1 = createShape(TRIANGLE,0,0,540,0,200,100);
      top   = createShape(ARC,270,0,540,30,PI,TAU,OPEN);
      left  = createShape(ARC,200.25,-120.25,476,440,HALF_PI,HALF_PI+radians(57),OPEN);
      upper.addChild(body1);
      upper.addChild(top);
      upper.addChild(left);
      upper.rotate(-PI/5);
      upper.scale(scale);
      //alas inferiores
      lower = createShape(GROUP);
      body2 = createShape(TRIANGLE,0,0,100,-62.5,100,62.5);
      right = createShape(ARC,100,0,50,125,-HALF_PI,HALF_PI,OPEN);
      lower.addChild(body2);
      lower.addChild(right);
      lower.rotate(PI/4);
      lower.scale(scale);
      f = -(PI/2);
      dir = 1;
  }
  
  float flap(){
    f += (0.07 * dir);
    if(f >= 0 || f <= -(PI/2)) dir *= -1;
    return f;
  }
  
  void display(float radius){
    float a = flap();
    blendMode(BLEND);
    noStroke();
    upper.rotateY(a);
    shape(upper, radius/12, -radius/12);
    upper.rotateY(PI-a*2);
    shape(upper, -radius/12, -radius/12);
    upper.rotateY(PI+a);
    lower.rotateY(a);
    shape(lower, radius/12, radius/12);
    lower.rotateY(PI-a*2);
    shape(lower, -radius/12, radius/12);
    lower.rotateY(PI+a);
  }
}
