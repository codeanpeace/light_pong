//creates the game ball
//the ball has a color, position, diameter and speed

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
    ellipse(pos.x,pos.y,d, d);
  }
  
  void move() {
    pos.add(speed);
    bounce();
    score();
  }

//states that if the ball reaches the edge of the screen:
  void score() {
    // left edge
    if ((pos.x < d/2) || (pos.y < d/2) || (pos.x > (width - d/2)) || (pos.y > (height - d/2)) ) {
      game.balls = new Ball[0];;  //ball array is emptied
      game.begin(); //game is restarted
      for (int i=0; i<game.players.length; i++){
       if (c == game.players[i].c){
         game.players[i].score+=1;  //score is updated for the player that touched it last
         println(game.players[i], game.players[i].score);
       }
    }
  }}
  //states thats if the edge of the circle coincides with the edge of the paddle
  //the speed vector direction sould reverse aka bounce
  void bounce(){
      //top edge
      Paddle p1 = game.paddles[1];
      if ((pos.y < d/2 + p1.h/2) && (pos.x< p1.pos.x+p1.w/2 ) && (pos.x> p1.pos.x-p1.w/2)) {
        pos.y = d/2 + p1.h/2;
        speed.y = - speed.y;
        c = p1.c;}
         
      //bottom edge
      Paddle p3 = game.paddles[3];
      if ((pos.y > height-d/2 - p3.h/2) && (pos.x< p3.pos.x+p3.w/2 ) && (pos.x> p3.pos.x-p3.w/2)) {
        pos.y = height-d/2 - p3.h/2;
        speed.y = - speed.y;
        c = p3.c; }
       
       //left edge
       Paddle p0 = game.paddles[0];
       if ((pos.x < d/2 + p0.h/2) && (pos.y< p0.pos.y+p0.w/2 ) && (pos.y> p0.pos.y-p0.w/2)) {
         pos.x = d/2 + p0.h/2;
          speed.x = - speed.x;
          c = p0.c;}

      //right edge
      Paddle p2 = game.paddles[2];
      if ((pos.x > width-d/2 - p2.h/2) && (pos.y< p2.pos.y+p2.w/2 ) && (pos.y> p2.pos.y-p2.w/2)) {
        pos.x = width- d/2 - p2.h/2;
        speed.x = - speed.x;
        c = p2.c; }
    
      }

//causes the current ball to "split" by creating a new instance of a ball
//and appending it to an array
  void split() {
    float randomness= random(0.5, 1);
    PVector pos2, speed2;
    pos2= new PVector(pos.x, pos.y);
    speed2 = new PVector(speed.x, speed.y + randomness);
    speed2.setMag(speed.mag());
    color c2= color(255);
    game.balls = (Ball[]) append(game.balls, new Ball(c2,pos2,speed2,d));
    speed.y -= randomness;
    speed.setMag(speed2.mag());    
  }
}
