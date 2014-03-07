// convert to PVECTORS

class Paddle {
  int number;
  color c;
  float xPos, yPos, xSpeed, ySpeed, w, h;
  
  Paddle(int number_, color c_) {//float xPos_, float yPos_, float xSpeed_, float ySpeed_, float w_, float h_) {
    number = number_;
    c = c_;
//    xPos = xPos_;
//    yPos = yPos_;
//    xSpeed = xSpeed_;
//    ySpeed = ySpeed_;
//    w = w_;
//    h = h_;  
  }
  
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xPos, yPos, w, h);
  }
  
  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
}    
   
