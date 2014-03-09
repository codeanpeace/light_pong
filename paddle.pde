class Paddle {
  int pnum;
  color c;
  PVector pos, speed;
  float w, h;

  Paddle(int pnum_, color c_) {
    pnum = pnum_;
    c = c_;
    switch(pnum) {
    case 1:
    // left edge
      pos = new PVector(0, height/2);
      break;
    case 2: 
    // top edge
      pos = new PVector(width/2, 0);
      break;
    case 3:
    // right edge
      pos = new PVector(width, height/2);
      break;
    case 4:
    // bottom edge
      pos = new PVector(width/2, height);
      break;
    }
    speed = new PVector(0, 0);
    w = 175;
    h = 20;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    fill(c);
    rectMode(CENTER);
    if (pnum == 1 || pnum == 3) {
      rotate(PI/2.0);
    }
    rect(0, 0, w, h);
    popMatrix();
  }

  void move() {
    pos.add(speed);
  }
}    

