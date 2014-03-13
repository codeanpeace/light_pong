import processing.video.*;

Capture video;
Game game;
color[] colors;

void setup() {
  size(800,800); //non-native - rescaling is computationally taxing
  background(0);
  smooth();
  video = new Capture(this, 320, 240, 15);
  video.start();
  colors = new color[0];
  game = new Game();
  game.setUp();
  game.begin();

}

void draw() {
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
        color currentColor = video.pixels[loc];
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
        strokeWeight(5.0);
        stroke(0);
        ellipse(closestXs[i], closestYs[i], 15, 15);
      }
    }

  } else {
    background(0);
    game.play();
  }
}

void mousePressed() {
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
