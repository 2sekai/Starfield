Particle [] circles = new Particle [400]; 

void setup() {
  frameRate(40);
  size(800, 600);
  for (int i = 0; i < circles.length; i++) 
    circles[i] = new Particle(400, 300);
  circles[0] = new R(400, 300);
}

void draw() {
  fill(0, 0, 0, 30);
  rect(0, 0, 800, 600);
  for (int i = 0; i < circles.length; i++) {
    circles[i].move();
    circles[i].show();
  }
}
void mousePressed() {

  for (int i = 0; i < circles.length; i++) 
    circles[i] = new Particle(400, 300);
  circles[0] = new R(400, 300);
}


void mouseDragged() {

  for (int i = 0; i < circles.length; i++) 
    circles[i] = new Particle(mouseX, mouseY);
  circles[0] = new R(mouseX,mouseY);
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
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myAngle = Math.random()*(2*Math.PI);
    mySpeed = Math.random()*8;
    myX = x;
    myY= y;
    mySize = 70;
  }

  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
