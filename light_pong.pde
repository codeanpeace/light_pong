
//Initializes a game instance
Game game;

//imports and initializes a controller
import controlP5.*;
ControlP5 cp5;

//sets up the variable to be controlled by the controller (diameter of ball)
float d;

void setup() {
  size(800,800);
  background(0);
  smooth();
  //creates a new controller
  cp5 = new ControlP5(this);
  cp5.addSlider("d")
     .setPosition(10,30)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(20)
     ;
   //starts the game
  game = new Game();
  game.setUp();
  game.begin();
  
  //loads music file
  minim = new Minim(this);
  player = minim.loadFile("file.mp3", 2048);
  player.play();
}

void draw() {
  background(0);
  game.play();
}

void keyPressed() {
  //calls the split function on the ball when the spacebar is hit
  if (key == ' ') {
    int currentCount = game.balls.length;
    for (int i = 0; i < currentCount; i++) {
      game.balls[i].split();
  }
  }
  //cause the paddles to move along the edge of screen when certain keys are presed
  if (key == CODED) {
    if ((keyCode == UP) && (game.paddles[2].pos.y - game.paddles[2].w/2) > 0) {
      game.paddles[2].pos.y -= 25;
    } else if ((keyCode == DOWN) && (game.paddles[2].pos.y + game.paddles[2].w/2) < height) {
      game.paddles[2].pos.y += 25;
    } 
  }  
  if ((key == 'q')&& (game.paddles[0].pos.y - game.paddles[0].w/2) > 0){
    game.paddles[0].pos.y -= 25;
  }
  if ((key == 'a') && (game.paddles[0].pos.y + game.paddles[0].w/2) < height)
   {
    game.paddles[0].pos.y += 25;
  }
  
  
  if ((key == 'n') && (game.paddles[3].pos.x - game.paddles[3].w/2) > 0) {
    game.paddles[3].pos.x -= 25;
  }
  if ((key == 'm')&& (game.paddles[3].pos.x + game.paddles[3].w/2) < width) {
    game.paddles[3].pos.x += 25;
  }
  if ((key == 'c') && (game.paddles[1].pos.x - game.paddles[1].w/2) > 0) {
    game.paddles[1].pos.x -= 25;
  }
  if ((key == 'v') && (game.paddles[1].pos.x + game.paddles[1].w/2) < width){
    game.paddles[1].pos.x += 25;
  }
}

//imports and initializes for the audio file
import ddf.minim.*;
AudioPlayer player;
Minim minim;

//turns off the audio file
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
