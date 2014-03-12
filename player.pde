class Player {
  int number, score;
  color c;
  Paddle paddle;
  
  Player(int number_, color c_) {
    c = c_;
    number = number_;
    paddle = new Paddle(number, c);
    score = 0;
  }
  
  void display() {
    textSize(15);
    textAlign(CENTER);
    fill(c);
    switch(number) {
    case 1:
    // left edge
      text(str(score), 20, 20);
      break;
    case 2: 
    // top edge
      text(str(score), width - 20, 20);
      break;
    case 3:
    // right edge
      text(str(score), width - 20, height - 20);
      break;
    case 4:
    // bottom edge
      text(str(score), 20, height - 20);
      break;
    }
  }
  
}
