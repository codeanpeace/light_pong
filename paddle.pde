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
        break;
      case 2: 
        break;
      case 3:
        break;
      case 4:
        break;
    }
//    w = w_;
//    h = h_;  
  }
  
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
  
  void move() {
    pos.add(speed);   
  }
}    
   
