class Game {
  Player[] players;
  Paddle[] paddles;
  Ball[] balls;
  int winScore;
  
  Game() {
    players = new Player[0];
    paddles = new Paddle[0];
    balls = new Ball[0];
  }
  
  void setUp() {
    // intro sequence - only if you have time
    println("SETUP!");
    // logic for click to select colors
    // the four color arguments below need to be dynamically set via mouseclick
    //add code prompting user to click on 4 different locations representing the colors to track
    players = (Player[])append(players, new Player(1, color(255)));
    players = (Player[])append(players, new Player(2, color(255)));
    players = (Player[])append(players, new Player(3, color(255)));
    players = (Player[])append(players, new Player(4, color(255)));
    for (int i = 0; i < players.length; i++) {
      paddles = (Paddle[])append(paddles, players[i].paddle);
    }
  }

  void begin() {
    // kickoff!!
    println("BEGIN!");
    // brownie points if you have a slider that dynamically changes ball size and speed magnitude
    float d = 50.0;
    PVector pos = new PVector(400, 400);
    // randomize speed between -2 and 2
    PVector speed = new PVector(random(-2, 2), random(-2, 2));
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
