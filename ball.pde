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
    score();
  }
  
  // rewrite conditions to bounce only off paddles
  // at the moment it's bounching off walls
  void bounce() {
    // left edge
    if (pos.x < d/2) {
      pos.x = d/2;
      speed.x = - speed.x;
      c = game.paddles[0].c;
    }
    // top edge
    if (pos.y < d/2) {
      pos.y = d/2;
      speed.y = - speed.y;
      c = game.paddles[1].c;
    }
    // right edge
    if (pos.x > (width - d/2)) {
      pos.x = width - d/2;
      speed.x = - speed.x;
      c = game.paddles[2].c;
    }
    // bottom edge
    if (pos.y > (height - d/2)) {
      pos.y = height - d/2;
      speed.y = - speed.y;
      c = game.paddles[3].c;
    }
  }
  
  void score() {
    // score logic
    println("SCORE!"); 
    // update score for each player
    // display score for each player for 2 or 3 seconds
    // run game.begin();
  }
  
  void split() {
    float randomness= random(0.5, 1);
    PVector pos2, speed2;
    pos2= new PVector(pos.x, pos.y);
    speed2 = new PVector(speed.x, speed.y + randomness);
    speed2.setMag(speed.mag());
    color c2= color(233,252,32);
    game.balls = (Ball[]) append(game.balls, new Ball(c2,pos2,speed2,d));
    speed.y -= randomness;
    speed.setMag(speed2.mag());    
  }
}
