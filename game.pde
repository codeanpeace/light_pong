class Game {
  Player[] players;
  Paddle[] paddles;
  Ball[] balls;
  int winScore = 10;
  
  Game() {
    players = new Player[0];
    paddles = new Paddle[0];
    balls = new Ball[0];
  }

void setUp(){
    players = (Player[])append(players, new Player(1, color(234,24,27)));
    players = (Player[])append(players, new Player(2, color(24,234,197)));
    players = (Player[])append(players, new Player(3, color(246,255,3)));
    players = (Player[])append(players, new Player(4, color(237,3,255)));
    for (int i = 0; i < players.length; i++) {
      paddles = (Paddle[])append(paddles, players[i].paddle);
    }}

  void begin() {
    // kickoff!!
//    println("BEGIN!");
    // brownie points if you have a slider that dynamically changes ball size and speed magnitude
    PVector pos = new PVector(400, 400);
    // randomize speed between -2 and 2
    PVector speed = new PVector(random(-2, 2), random(-2, 2));
//    PVector speed = new PVector(.5, -1);
    speed.setMag(5);
    color c = color(255);
    Ball ball = new Ball(c, pos, speed, d);
    balls = (Ball[])append(balls, ball); 
  }
  
  void play() {
    for (int i = 0; i < balls.length; i++) {
      balls[i].display();
      balls[i].move();
    }
    for (int i = 0; i < paddles.length; i++) {
      paddles[i].display();
      paddles[i].move();
    }
    for (int i = 0; i < players.length; i++) {
      players[i].display();
      if (players[i].score >= winScore) {
        textSize(36);
        text("YOU WIN!!", width/2, height/2);
        setUp();
        begin();
      }
    }
    // for all players, check if there is a winner
    // if there is a winner, 
  }
  
  void pause(Player player) {
    // pause
    println("PAUSE!");
  }
  
  void unpause(Player player) {
    // unpause only if by player that paused
    println("CONTINUE!");
  }
  
  void winning(Player player) {
    // winning sequence
    println("WINNING!");
  }
  
  void replay() {
    // new game logic - back to setup
    println("REPLAY");
  }
}
