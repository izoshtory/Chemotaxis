class Walker {
  int myX, myY, modx, mody, colorr, colorb, colorg;
  //constructor
  //initialize member variables
  Walker() {
    myX = 750;
    myY = 250;
    colorr = (int)(Math.random()*250);
    colorb = (int)(Math.random()*250);
    colorg = (int)(Math.random()*250);
  }
  void walk() {



    stroke(255, 255, 255);
    strokeWeight(2);
    line(myX, myY, (myX + modx), (myY + mody));

    line(myX, myY, mouseX, mouseY);

    noStroke();
    myX = myX + modx;
    myY = myY + mody;
  }
  void show() {
    fill(colorr, colorb, colorg);
    ellipse(myX, myY, 50, 50);
  }
}//end of Jumper class


class Jumper {
  int myX, myY;
  //constructor
  //initialize member variables
  Jumper() {
    myX = 250;
    myY = 250;
  }
  void jump() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  void show() {
    ellipse(myX, myY, 50, 50);
  }
}//end of Jumper class

Jumper fred = new Jumper();
Walker bob = new Walker();
Walker [] colony = new Walker[8];
int clicks = 0;
void setup() {
  size(1000, 500);
  for (int i = 0; i<colony.length-1; i++) {
    colony[i] = new Walker();
    colony[i].walk();
    colony[i].show();
  }
}
void mousePressed() {
  if (clicks==colony.length-2) {
    clicks = 0;
    background(255);
    fill(0);
    textSize(40);

    // Display money counter
    textAlign(CENTER, CENTER);
    text("You have Ascended.", width/2, height/2);
    frameRate(0);
  } else {
    clicks += 1;
  }
}

void draw() {
  background(0);
  drawKid(mouseX, mouseY);
  for (int i = 0; i<colony.length-1; i++) {
    colony[i].modx = (int)(Math.random()*((mouseX-colony[i].myX)/20));
    //colony[i].mody = (int)(Math.random()*((mouseY-colony[i].myY)/20));
    if (colony[i].myY>100) {
      colony[i].mody = -1;
    } else {
      colony[i].mody = 1;
    }
    for (int z = 0; z<colony.length-1; z++) {
      if ((colony[i].myX-colony[z].myX)>5) {
        colony[z].modx = -(int)(Math.random()*2);
      }
      if ((colony[i].myX-colony[z].myX)<-5) {
        colony[z].modx = (int)(Math.random()*2);
      }
      for (int w = 0; w<=clicks; w++) {
        colony[w].mody=-1;
      }
      colony[z].show();
      colony[z].walk();
    }
  }
}
void drawKid(float x, float y) {

  strokeWeight(2);
  stroke(0);

  fill(255, 220, 177);
  ellipse(x, y - 120, 80, 90);

  fill(139, 69, 19);
  arc(x, y - 140, 90, 60, PI, TWO_PI);
  rect(x - 45, y - 140, 90, 20);

  fill(0);
  ellipse(x - 15, y - 130, 8, 12);
  ellipse(x + 15, y - 130, 8, 12);

  noFill();
  arc(x, y - 110, 30, 20, 0, PI);

  fill(255, 100, 100);
  ellipse(x - 25, y - 115, 15, 10);
  ellipse(x + 25, y - 115, 15, 10);

  fill(255, 0, 0);
  rect(x - 40, y - 70, 80, 100, 10);

  fill(255, 220, 177);
  ellipse(x - 40, y - 20, 20, 80);
  ellipse(x + 40, y - 20, 20, 80);

  fill(0, 0, 200);
  rect(x - 30, y + 30, 25, 120, 5);
  rect(x + 5, y + 30, 25, 120, 5);

  fill(100, 50, 0);
  ellipse(x - 17, y + 150, 30, 15);
  ellipse(x + 17, y + 150, 30, 15);

  fill(255);
  ellipse(x - 20, y - 128, 3, 3);
  ellipse(x + 12, y - 128, 3, 3);
}
