import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class light_pong extends PApplet {



Capture video;
Game game;
int[] colors;

public void setup() {
  size(800,800);
  background(0);
  smooth();
  video = new Capture(this, width, height, 15);
  video.start();
  colors = new int[0];
  game = new Game();
  game.setUp();
  game.begin();

}

public void draw() {
  if (colors.length < 4) {
    if (video.available()) {
      video.read();
    }
    video.loadPixels();
    image(video, 0, 0);

    float[] worldRecords = {500, 500, 500, 500};

    int[] closestXs = {0, 0, 0, 0};
    int[] closestYs = {0, 0, 0, 0};

    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        float r, g, b, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4;
        int loc = x + y*video.width;
        int currentColor = video.pixels[loc];
        float[] distances = new float[4];
        r = red(currentColor);
        g = green(currentColor);
        b = blue(currentColor);
        if (colors.length > 0) {
          r1 = red(colors[0]);
          g1 =  green(colors[0]);
          b1 =  blue(colors[0]);
          distances[0] = dist(r, g, b, r1, g1, b1);
        }
        if (colors.length > 1) {
          r2 = red(colors[1]);
          g2 =  green(colors[1]);
          b2 =  blue(colors[1]);
          distances[1] = dist(r, g, b, r2, g2, b2);
        }
        if (colors.length > 2) {
          r3 = red(colors[2]);
          g3 =  green(colors[2]);
          b3 =  blue(colors[2]);
          distances[2] = dist(r, g, b, r3, g3, b3);
        }
        if (colors.length > 3) {
          r4 = red(colors[3]);
          g4 =  green(colors[3]);
          b4 =  blue(colors[3]);
          distances[3] = dist(r, g, b, r4, g4, b4);
        }

        for (int i = 0; i < distances.length; i++) {
          if (distances[i] < worldRecords[i]) {
            worldRecords[i] = distances[i];
            closestXs[i] = x;
            closestYs[i] = y;
          }
        }
      }
    }

    for (int i = 0; i < worldRecords.length; i++) {
      if ((worldRecords[i] < 10) && (colors.length > i)) {
        fill(colors[i]);
        strokeWeight(5.0f);
        stroke(0);
        ellipse(closestXs[i], closestYs[i], 15, 15);
      }
    }

  } else {
    background(0);
    game.play();
  }
}

public void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  colors = append(colors, video.pixels[loc]);
  println(video.pixels[loc]);
  println(colors.length);
  println(colors);
}

// tests split function
//void mousePressed() {
//  int currentCount = game.balls.length;
//  for (int i = 0; i < currentCount; i++) {
//    game.balls[i].split();
//  }
//}
class Ball {
  int c;
  PVector pos, speed;
  float d;
  
  Ball(int c_, PVector pos_, PVector speed_, float d_) {
    c = c_;
    pos= pos_;
    speed=speed_;
    d= d_;
  }
  
  public void display() {
    stroke(0);
    fill(c);
    ellipse(pos.x,pos.y,d,d);
  }
  
  public void move() {
    pos.add(speed);
    bounce();
    score();
  }
  
  // rewrite conditions to bounce only off paddles
  // at the moment it's bounching off walls
  public void bounce() {
    // left edge
    if (pos.x < d/2) {
      pos.x = d/2;
      speed.x = - speed.x;
      c = game.paddles[0].c;
    }
    // top edge
    if (pos.y < d/2) {
      pos.y = d/2;
      speed.y = - speed.y;
      c = game.paddles[1].c;
    }
    // right edge
    if (pos.x > (width - d/2)) {
      pos.x = width - d/2;
      speed.x = - speed.x;
      c = game.paddles[2].c;
    }
    // bottom edge
    if (pos.y > (height - d/2)) {
      pos.y = height - d/2;
      speed.y = - speed.y;
      c = game.paddles[3].c;
    }
  }
  
  public void score() {
    // score logic
    println("SCORE!"); 
    // update score for each player
    // display score for each player for 2 or 3 seconds
    // run game.begin();
  }
  
  public void split() {
    float randomness= random(0.5f, 1);
    PVector pos2, speed2;
    pos2= new PVector(pos.x, pos.y);
    speed2 = new PVector(speed.x, speed.y + randomness);
    speed2.setMag(speed.mag());
    int c2= color(233,252,32);
    game.balls = (Ball[]) append(game.balls, new Ball(c2,pos2,speed2,d));
    speed.y -= randomness;
    speed.setMag(speed2.mag());    
  }
}
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

  public void setUp() {
    // intro sequence - only if you have time
    println("SETUP!");
    // logic for click to select colors
    // the four color arguments below need to be dynamically set via mouseclick
    // add code prompting user to click on 4 different locations representing the colors to track

    players = (Player[])append(players, new Player(1, color(255)));
    players = (Player[])append(players, new Player(2, color(255)));
    players = (Player[])append(players, new Player(3, color(255)));
    players = (Player[])append(players, new Player(4, color(255)));
    for (int i = 0; i < players.length; i++) {
      paddles = (Paddle[])append(paddles, players[i].paddle);
    }
  }

  public void begin() {
    // kickoff!!
    println("BEGIN!");
    // brownie points if you have a slider that dynamically changes ball size and speed magnitude
    float d = 50.0f;
    PVector pos = new PVector(400, 400);
    // randomize speed between -2 and 2
    PVector speed = new PVector(random(-2, 2), random(-2, 2));
    speed.setMag(5);
    int c = color(255);
    Ball ball = new Ball(c, pos, speed, d);
    balls = (Ball[])append(balls, ball);
  }

  public void play() {
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

  public void pause(Player player) {
    // pause
    println("PAUSE!");
  }

  public void unpause(Player player) {
    // unpause only if by player that paused
    println("CONTINUE!");
  }

  public void winning(Player player) {
    // winning sequence
    println("WINNING!");
  }

  public void replay() {
    // new game logic - back to setup
    println("REPLAY");
  }
}
class Paddle {
  int pnum;
  int c;
  PVector pos, speed;
  float w, h;

  Paddle(int pnum_, int c_) {
    pnum = pnum_;
    c = c_;
    switch(pnum) {
    case 1:
    // left edge
      pos = new PVector(0, height/2);
      break;
    case 2: 
    // top edge
      pos = new PVector(width/2, 0);
      break;
    case 3:
    // right edge
      pos = new PVector(width, height/2);
      break;
    case 4:
    // bottom edge
      pos = new PVector(width/2, height);
      break;
    }
    speed = new PVector(0, 0);
    w = 175;
    h = 20;
  }

  public void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    fill(c);
    rectMode(CENTER);
    if (pnum == 1 || pnum == 3) {
      rotate(PI/2.0f);
    }
    rect(0, 0, w, h);
    popMatrix();
  }

  public void move() {
    pos.add(speed);
  }
}    

class Player {
  int number, score;
  int c;
  Paddle paddle;
  
  Player(int number_, int c_) {
    c = c_;
    number = number_;
    paddle = new Paddle(number, c);
    score = 0;
  }
  
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "light_pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
