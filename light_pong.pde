Game game;
import controlP5.*;
ControlP5 cp5;
float d;

void setup() {
  size(800,800);
  background(0);
  smooth();
  cp5 = new ControlP5(this);
  cp5.addSlider("d")
     .setPosition(10,10)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(20)
     ;
  game = new Game();
  game.setUp();
  game.begin();
  minim = new Minim(this);
  player = minim.loadFile("file.mp3", 2048);
  player.play();
}

void draw() {
  background(0);
  game.play();
}

void keyPressed() {
  if (key == ' ') {
    int currentCount = game.balls.length;
    for (int i = 0; i < currentCount; i++) {
      game.balls[i].split();
  }
  }
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

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
