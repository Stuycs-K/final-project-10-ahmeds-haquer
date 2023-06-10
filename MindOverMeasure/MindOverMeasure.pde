import java.util.*; //<>// //<>//
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;
int[] capacities;
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
static int VICTORY = 5;
static int HOME = 7;
static int MODE = HOME;
static int FORFEIT = 6;
boolean transferFrom;
boolean transferInto;
Button game;
Button sim;
//public PImage img;

void setup() {
  size(900, 600);
  frameRate(80);
  capacities= generateCapacities();
  randTube1 = new Tube(capacities[0]);
  randTube2 = new Tube (capacities[1]);
  fillStation = new Tube();
  emptyStation = new Tube();
  emptyStation.numBalls = 0;
}

void draw() {
  background(#8AC4F0);
  textSize(20);
  fill(0);
  if (MODE==VICTORY || randTube1.capacity==chosenNum || randTube2.capacity==chosenNum) {
    drawVictory();
  }
  if (MODE == HOME) {
    background(#326F33);
    textSize(140);
    fill(0);
    text("MIND OVER", 140, 200);
    text("MEASURE", 170, 300);
    fill(#E3E3E3);
    game = new Button(#E3E3E3, #C5CBC7, 200, 450, 160, 70);
    fill(0);
    textSize(40);
    text("GAME", 230, 500);
    fill(#E3E3E3);
    sim = new Button(#E3E3E3, #C5CBC7, 450, 450, 260, 70);
    fill(0);
    text("SIMULATOR", 480, 500);
  }
  if (MODE == numSelect) {
    background(#AACCD8);
    drawNumSelect();
    textSize(35);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Select a number by typing the according key.", 450, 160);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("The number you select is very important...", 450, 460);
  }
  if (MODE != numSelect && MODE != HOME) {
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
  if (MODE == FORFEIT) {
    textSize(15);
    fill(0);
    text("MODE: SOLUTION", 700, 560);
    if (randTube1.numBalls!=chosenNum &&  randTube2.numBalls!=chosenNum) {
      solver(randTube1, randTube2, chosenNum);
    }
  }
  if (MODE == EMPTY) {
    textSize(15);
    fill(0);
    text("MODE: EMPTY", 700, 560);
  }
  if (MODE == numSelect) {
    if (keyPressed && key != '1' && key != '2' && key != '3' && key != '4' && key != '5' && key != '6' && key != '7' && key != '8' && key != 'f' && key != 'F' && key != 'T' && key != 't'&& key != 'E' && key != 'e' && key != 's' && key != 'S') {
      textSize(30);
      fill(0);
      text("Please select a valid key option.", 20, 40);
    }
  }
  if (mousePressed) {
    if (MODE == HOME) {
      if (game.isPressed()) {
        MODE = numSelect;
      } else if (sim.isPressed()) {
        chosenNum = (int)(Math.random()*7) + 1;
        MODE = FORFEIT;
      }
    }
    if (MODE == FILL || MODE == TRANSFER || MODE == EMPTY) {
      color colour = get(mouseX, mouseY);
      if (colour != -1) {
        textSize(30);
        fill(0);
        text("Please click again to select a valid tube.", 20, 40);
      } else if (colour == -1) {
        int selTube = mouseX/80;
        if (selTube != randTube1.capacity && selTube != randTube2.capacity) {
          textSize(30);
          fill(0);
          text("Please click again to select a valid tube.", 20, 40);
        }
      }
    }
  }
}

void keyTyped() {
  // remove and separate all of mouse pressed code
  if (keyPressed) {
    if (MODE == numSelect) {
      if ((key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7') && MODE == numSelect) {
        chosenNum = Character.getNumericValue(key);
        capacities= generateCapacities();
        randTube1 = new Tube(capacities[0]);
        randTube2 = new Tube (capacities[1]);
        MODE = noState;
      }
    } else if (key == 't' || key == 'T') {
      MODE = TRANSFER;
    } else if (key == 'f' || key == 'F') {
      MODE = FILL;
    } else if (key == 'e'  || key == 'E') {
      MODE = EMPTY;
    } else if (key == 's'  || key == 'S') {
      MODE = FORFEIT;
    } else if (key == 'r'  || key == 'R') {
      MODE = numSelect;
    } else {
      //textSize(30);
      //fill(0);
      //text("Please select a valid key option.", 20, 40);
    }
  }
}

void drawVictory() {
  /*img=loadImage("youwin.heic");
  image(img,0,0);*/
  rect(0,0,900,600);
  textSize(20);
  fill(0);
  textAlign(CENTER, CENTER);
  text("YOU DID IT! Congratulations! You can now press 'R' to restart!", 450, 300);
}


void mousePressed() {
  color col = get(mouseX, mouseY);
  //println(col);
  if (col == -1) {
    tempSelectedTube = (mouseX / 80);
    //println(tempSelectedTube);
  } else {
    //textSize(30);
    //fill(0);
    //text("Please click again to select a valid tube.", 20, 40);
    //delay(10);
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
    if (randTube1.numBalls==chosenNum || randTube2.numBalls==chosenNum) {
      MODE=VICTORY;
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
    if (randTube1.numBalls==chosenNum || randTube2.numBalls==chosenNum) {
      MODE=VICTORY;
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
    if (randTube1.numBalls==chosenNum || randTube2.numBalls==chosenNum) {
      MODE=VICTORY;
    }
  }
}

int[] generateCapacities() {
  int[] result= new int[2];
  boolean impossible=true;
  while (impossible) {
    result[0] = (int)(Math.random() * 7) + 2;
    result[1]= (int)(Math.random() * 7) + 2;
    while (result[1]==result[0]) {
      result[1] = (int)(Math.random() * 7) + 2;
    }
    if (isPossible(new Tube(result[0]), new Tube(result[1]), chosenNum)) {
      impossible=false;
    }
  }//System.out.println(Arrays.toString(result));
  return result;
}

void drawNumSelect() {
  int num = 1; //70
  for (int i = 90; i < width && num < 8; i+= 120) {
    fill(220,220,220);
    stroke(#143DA2);
    circle(i, 280, 90);
    textSize(30);
    fill(0);
    text(""+ num, i,275);
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
  text("empty", width - 95, 120);
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
  while (b!=0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

public static boolean isPossible(Tube one, Tube two, int numBalls) {
  if ((numBalls%euclid(one.capacity, two.capacity)==0)) {
    if (one.capacity==numBalls||two.capacity==numBalls) {
      return false;
    }
    if (one.capacity<numBalls && two.capacity<numBalls) {
      return false;
    }
    return true;
  }
  return false;
}

// code should work can you just implement it


  void solve(Tube one, Tube two, int numbBalls) {
    if (one.numBalls==0) {
      fillStation.fill(one);
    }
    //delay(5);
    one.transfer(two);
    //delay(5);
    if (two.numBalls==two.capacity) {
      emptyStation.empty(two);
      //delay(5);
    }
    if (one.numBalls!=numbBalls && two.numBalls!=numbBalls) {
      solve(one, two, numbBalls);
      //delay(5);
    }
  }

  void solver(Tube one, Tube two, int numbBalls) {
    if (one.capacity>two.capacity) {
      if (isPossible(one, two, numbBalls)) {
        solve(one, two, numbBalls);
      }
    } else {
      if (isPossible(two, one, numbBalls)) {
        solve(two, one, numbBalls);
      }
    }
  }
