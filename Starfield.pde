Particle [] circles = new Particle [200]; 

void setup() {
  background(8, 14, 35 );
  frameRate(40);
  size(800, 600);
  for (int i = 0; i < circles.length; i++) 
    circles[i] = new Particle(400, 300);
  circles[0] = new R(400, 300);
}

void draw() {
  fill(8, 14, 35, 100);
  rect(0, 0, 800, 600);
  for (int i = 0; i < circles.length; i++) {
    circles[i].move();
    circles[i].show();
  }
}
void mousePressed() {
  fill(8, 14, 35, 256);
  rect(0, 0, 800, 600);
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Particle(400, 300);
    circles[0] = new R(400, 300);
  }
}


void mouseDragged() {

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Particle(mouseX, mouseY);
    circles[0] = new R(mouseX, mouseY);
  }
}


class Particle {
  int myColor;
  double myX, myY;
  double mySize, mySpeed, myAngle;
  Particle() {
  }
  Particle(int x, int y) {
    myColor = color((int)(Math.random()*256)+20, (int)(Math.random()*106), (int)(Math.random()*256)+50);
    myAngle = Math.random()*(2*Math.PI);
    mySpeed = Math.random()*10;
    myX = x;
    myY= y;
    mySize = 15;
  }
  void move() {
    myX= myX+Math.cos(myAngle)*mySpeed;
    myY= myY+Math.sin(myAngle)*mySpeed;
  }
  void show() {
    noStroke();
    fill(myColor, 130);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
} //end of Particle class

class R extends Particle {
  R(int x, int y) {
    myColor = color(255, (int)(Math.random()*30)+50, (int)(Math.random()*70)+70);
    myAngle = Math.random()*(2*Math.PI);
    mySpeed = Math.random()*10;
    myX = x;
    myY= y;
    mySize = 35;
  }
  void move() {
    myX= myX+Math.cos(myAngle)*mySpeed;
    myY= myY+Math.sin(myAngle)*mySpeed;
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
    ellipse((float)myX+30, (float)myY, (float)mySize, (float)mySize);
    triangle((float)myX-15, (float)myY+10, (float)myX+44, (float)myY+10, (float)myX+17, (float)myY+55);
  }
}
