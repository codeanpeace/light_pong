Game game;

void setup() {
  size(800,800);
  background(0);
  smooth();
  game = new Game();
  game.begin();
}

void draw() {
  background(0);
  game.play();
}

void mousePressed() {
  int currentCount = game.balls.length;
  for (int i = 0; i < currentCount; i++) {
    game.balls[i].split();
  }
}
