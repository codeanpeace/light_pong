class Ball {
  color c;
  PVector pos, speed;
  float d;
  
  Ball(color c_, PVector pos_, PVector speed_, float d_) {
    c = c_;
    pos= pos_;
    speed=speed_;
    d= d_;
  }
  
  void display() {
    stroke(0);
    fill(c);
    ellipse(pos.x,pos.y,d,d);
  }
  
  void move() {
    pos.add(speed);
    bounce();
  }
  
  void bounce() {
    if (pos.y > (height - d/2)) {
      pos.y = height - d/2;
      speed.y = - speed.y;
    }
    if (pos.y < d/2) {
      pos.y = d/2;
      speed.y = - speed.y;
    }
    // rewrite 2nd condition to bounce only off paddles
    if ((pos.x > (width - d/2)) && (1==1)) {
      pos.x = width - d/2;
      speed.x = - speed.x;
    }
    if ((pos.x < d/2) && (1==1)) {
      pos.x = d/2;
      speed.x = - speed.x;
    }
  }
  
  void split() {
    float randomness= random(0.5, 1);
    PVector pos2, speed2;
    pos2= new PVector(pos.x, pos.y);
    speed2 = new PVector(speed.x, speed.y + randomness);
    speed2.setMag(speed.mag());
    color c2= color(233,252,32);
    Ball ballClone= new Ball(c2,pos2,speed2,d);
    game.balls = (Ball[]) append(game.balls, ballClone);
    speed.y -= randomness;
    speed.setMag(speed2.mag());    
  }
}
