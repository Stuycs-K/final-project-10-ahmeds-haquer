import java.util.*;
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;

void setup() {
  size(900, 600);
  background(#8AC4F0);
  drawCapTubes();
  drawFiller();
  drawEmptier();
  randTube1 = new Tube(3);
}

void draw() {
}

void keyPressed() {
}

void mouseClicked() {
}

Tube randomizeTube() {
  if (randTube1.capacity == 0) {
    int rand = (int)(Math.random() * 7) + 2;
    return new Tube(rand);
  } else {
    int rand = (int)(Math.random() * 7) + 2;
    while (rand == randTube1.capacity) {
      rand = (int)(Math.random() * 7) + 2;
    }
    return new Tube(rand);
  }
}

void drawCapTubes() {
  int tubeNum = 2;
  for (int i = 150; tubeNum <= 8; i+=80) {
    //figure out font stuff
    //PFont font = createFont("STHeitiTC-Medium-30.vlw", 30);
    //textFont(font);
    fill(255);
    stroke(#143DA2);
    int y = 370;
    rect(i, 150, 50, y);
    textSize(30);
    fill(0);
    text(""+ tubeNum, i + 20, 180);
    tubeNum++;
    //draw balls
    if (randTube1 != null) {
      if (tubeNum == randTube1.capacity) {
        for (int j = 0; j < randTube1.numBalls; j++) {
          fill(255);
          circle(i, y, 45);
          y -= 45;
        }
      } else if (tubeNum == randTube2.capacity) {
        for (int j = 0; j < randTube2.numBalls; j++) {
          fill(255);
          circle(i, y, 45);
          y -= 45;
        }
      }
    }
  }
}

void drawFiller() {
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 180, 100, 50, 420);
  fill(0);
  textSize(17);
  text("fill", width - 165, 120);
}

void drawEmptier() {
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 120, 100, 50, 420);
  fill(0);
  textSize(17);
  text("empty", width - 115, 120);
}

public static int euclid(int a, int b){
    if (b==0){
      return a;
    }
    else{
      return euclid(b,a%b);
    }
  }
  public static boolean isPossible(Tube one, Tube two, int numBalls){
    return (numBalls%euclid(one.capacity,two.capacity)==0);
  }
  public static void solve(Tube one, Tube two,int numbBalls){
    if (isPossible(one,two,numbBalls)){
      Tube greater=one;
      Tube lesser=two;
      if (one.capacity<two.capacity){
        greater=two;
        lesser=one;
      }
      fillStation.fill(greater);
      greater.transfer(lesser);
      if (two.numBalls==two.capacity){
        emptyStation.empty(lesser);
      }
      if (greater.numBalls!=numbBalls && lesser.numBalls!=numbBalls){
        solve(greater,lesser,numbBalls);
      }
    }
}
