import java.util.*; //<>//
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;
static int numSelect = 0;
static int TRANSFER = 1;
int tempSelectedTube;
int TselectedTube1;
int TselectedTube2;
int FselectedTube;
int EselectedTube;
static int FILL = 2;
static int EMPTY = 3;
static int noState = 4;
static int MODE = numSelect; //<>// //<>// //<>// //<>// //<>//
boolean transferFrom;
boolean transferInto;

void setup() {
  size(900, 600);
  frameRate(80);
  randTube1 = randomizeTube();
  randTube2 = randomizeTube();

  fillStation = new Tube();
  emptyStation = new Tube();
  emptyStation.numBalls = 0;
}

void draw() {
  background(#8AC4F0);
  textSize(20);
  fill(0);
  if (MODE == numSelect) {
    textSize(15);
    fill(0);
    text("MODE: Select number", 700, 560);
    drawNumSelect();
  }
  if (MODE != numSelect) {
    textSize(15);
    fill(0);
    text("Selected number: " + chosenNum, 600, 30);
    text("Your tubes: \n tube with capacity " + randTube1.capacity + "\n tube with capacity " + randTube2.capacity, 750, 30);
    drawCapTubes();
    drawFiller();
    drawEmptier();
  }

  if (MODE == noState) {
    textSize(15);
    fill(0);
    text("choose an action", 700, 560);
  }

  if (MODE == TRANSFER) {
    textSize(15);
    fill(0);
    text("MODE: TRANSFER", 700, 560);
    if (!transferFrom) {
      textSize(25);
      fill(0);
      text("Select tube to transfer from.", 20, 40);
    }
    if (transferFrom && !transferInto) {
      textSize(25);
      fill(0);
      text("Select tube to transfer into.", 20, 40);
    }
  }

  if (MODE == FILL) {
    textSize(15);
    fill(0);
    text("MODE: FILL", 700, 560);
  }
  if (MODE == EMPTY) {
    textSize(15);
    fill(0);
    text("MODE: EMPTY", 700, 560);
  }
}

void keyTyped() {
  // remove and separate all of mouse pressed code
  if (keyPressed) {
    if ((key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7') && MODE == numSelect) {
      chosenNum = Character.getNumericValue(key);
      MODE = noState;
    } else if (key == 't' || key == 'T') {
      MODE = TRANSFER;
    } else if (key == 'f' || key == 'F') {
      MODE = FILL;
    } else if (key == 'e'  || key == 'E') {
      MODE = EMPTY;
    } else {
      textSize(30);
      fill(0);
      text("Please select a valid key option.", 20, 40);
    }
  }
}

void mousePressed() {
  color col = get(mouseX, mouseY);
  //println(col);
  if (col == -1) {
    tempSelectedTube = (mouseX / 80);
    //println(tempSelectedTube);
  } else {
    textSize(30);
    fill(0);
    text("Please click again to select a valid tube.", 20, 40);
    delay(10);
  }
  if (MODE == TRANSFER) {
    if (!transferFrom) {
      TselectedTube1 = tempSelectedTube;
      transferFrom = true;
    } else if (transferFrom && !transferInto) {
      TselectedTube2 = tempSelectedTube;
      transferInto = true;
    }
    if (TselectedTube1 == randTube1.capacity) {
      randTube1.transfer(randTube2);
      transferFrom = false;
      transferInto = false;
      //MODE = noState;
    } else if (TselectedTube1 == randTube2.capacity) {
      randTube2.transfer(randTube1);
      transferFrom = false;
      transferInto = false;
      //MODE = noState;
    }
  }
  if (MODE == FILL) {
    /*
    println(fillStation.numBalls);
     println(fillStation.toString());
     fillStation.remove(fillStation, 2);
     println(fillStation.numBalls);
     println(fillStation.toString());
     Tube tester = new Tube(4);
     fillStation.fill(tester);
     println(tester.toString());
     */
    if (tempSelectedTube != randTube1.capacity && tempSelectedTube != randTube2.capacity) {
      textSize(30);
      fill(0);
      text("Please click again to select a valid tube.", 20, 40);
    } else {
      FselectedTube = tempSelectedTube;
      if (FselectedTube == randTube1.capacity) {
        fillStation.fill(randTube1);
      } else if (FselectedTube == randTube2.capacity) {
        fillStation.fill(randTube2);
      }
    }
  }
  if (MODE==EMPTY) {
    if (tempSelectedTube != randTube1.capacity && tempSelectedTube != randTube2.capacity) {
      textSize(30);
      fill(0);
      text("Please click again to select a valid tube.", 20, 40);
    } else {
      FselectedTube = tempSelectedTube;
      if (FselectedTube == randTube1.capacity) {
        emptyStation.empty(randTube1);
      } else if (FselectedTube == randTube2.capacity) {
        emptyStation.empty(randTube2);
      }
    }
  }
}

Tube randomizeTube() {
  if (randTube1 == null) {
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

void drawNumSelect() {
  int num = 1;
  for (int i = 70; i < height && num < 8; i+= 70) {
    fill(255);
    stroke(#143DA2);
    rect(30, i, 50, 50);
    textSize(30);
    fill(0);
    text(""+ num, 40, i+30);
    num++;
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

    //draw balls
    if (randTube1 != null) {
      if (tubeNum == randTube1.capacity) {
        for (int j = randTube1.numBalls; j > 0; j--) {
          fill(255);
          circle(i+26, y+125, 35);
          y -= 35;
        }
      } else if (tubeNum == randTube2.capacity) {
        for (int j = randTube2.numBalls; j > 0; j--) {
          fill(255);
          circle(i+26, y+125, 35);
          y -= 35;
        }
      }
    }
    tubeNum++;
  }
}

void drawFiller() {
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 180, 100, 50, 420);
  fill(0);
  textSize(17);
  text("fill", width - 165, 120);
  int y = 400;
  if (fillStation != null) {
    for (int j = fillStation.numBalls; j > 0; j--) {
      fill(255);
      circle(width-155, y+107, 25);
      y -= 25;
    }
  }
}

void drawEmptier() {
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 120, 100, 50, 420);
  fill(0);
  textSize(17);
  text("empty", width - 115, 120);
  int y = 400;
  if (emptyStation != null) {
    for (int j = emptyStation.numBalls; j > 0; j--) {
      fill(255);
      circle(width-93, y+107, 25);
      y -= 25;
    }
  }
}

public static int euclid(int a, int b) {
  if (b==0) {
    return a;
  } else {
    return euclid(b, a%b);
  }
}
public static boolean isPossible(Tube one, Tube two, int numBalls) {
  return (numBalls%euclid(one.capacity, two.capacity)==0);
}
/*public static void solve(Tube one, Tube two,int numbBalls){
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
 }*/
