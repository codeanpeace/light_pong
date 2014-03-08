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
  
  
}
