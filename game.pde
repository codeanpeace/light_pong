class Game {
  Player p1, p2, p3, p4;
  Ball[] balls;
  
  Game() {
    balls = new Ball[0];
  }
  
  void setUp() {
    // intro sequence
    println("SETUP!");
  }

  void begin() {
    // kickoff
    println("BEGIN!");
    float d = 50.0;
    PVector pos = new PVector(400, 400);
    PVector speed = new PVector(2, 2);
    color c = color(255);
    Ball ball = new Ball(c, pos, speed, d);
    balls = (Ball[])append(balls, ball); 
  }
  
  void play() {
    for (int i = 0; i < game.balls.length; i++) {
      game.balls[i].display();
      game.balls[i].move();
    }
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
