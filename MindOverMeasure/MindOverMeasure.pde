import java.util.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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
Button home;

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
  background(#EAD980);
  textSize(20);
  fill(0);
  if (MODE==VICTORY) {
    textSize(15);
    fill(0);
    text("CONGRAGULATIONS, YOU GOT IT!", 450, 300); // make this last longer
    MODE=numSelect;
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
  if (MODE != HOME) {
    fill(#D6EAB4);
    stroke(#A8C479);
    home = new Button(#D6EAB4, #C0E582, 20, 20, 60, 40);
    fill(0);
    textSize(20);
    text("HOME", 25, 45);
  }
  if (MODE == numSelect) {
    background(#AACCD8);
    textSize(35);
    fill(0);
    text("Select a number by typing the according key.", 200, 160);
    textSize(20);
    text("The number you select is very important...", 200, 460);
    drawNumSelect();
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
    if (randTube1.numBalls!=chosenNum && randTube2.numBalls!=chosenNum) {
      solver(randTube1, randTube2, chosenNum);
    }
  }
  if (MODE == EMPTY) {
    textSize(15);
    fill(0);
    text("MODE: EMPTY", 700, 560);
  }
  if (MODE == VICTORY) {
    textSize(15);
    fill(0);
    int time=second();
    while (second()< time+10) {
      text("YOU DID IT!", 700, 560);
    }
  }
  if (MODE == numSelect) {
    //while (chosenNum == 0) {
    if (keyPressed && key != '1' && key != '2' && key != '3' && key != '4' && key != '5' && key != '6' && key != '7' && key != '8' && key != 'f' && key != 'F' && key != 'T' && key != 't'&& key != 'E' && key != 'e' && key != 's' && key != 'S') {
      textSize(30);
      fill(0);
      text("Please select a valid key option.", 20, 40);
    }
    //}
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
    } else {
      //textSize(30);
      //fill(0);
      //text("Please select a valid key option.", 20, 40);
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
  int num = 1;
  for (int i = 70; i < height && num < 8; i+= 70) {
    fill(255);
    stroke(#143DA2);
    rect(30, i, 70, 50, 8);
    textSize(30);
    fill(0);
    text(""+ num, 57, i+35);
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
/*
public static int euclid(int a, int b) {
 if (b==0) {
 return a;
 } else {
 return euclid(b, a%b);
 }
 }
 */
public static int euclid(int a, int b) {
  while (b!=0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

public static boolean isPossible(Tube one, Tube two, int numBalls) {
  return (numBalls%euclid(one.capacity, two.capacity)==0&&numBalls<one.capacity&&numBalls<two.capacity);
}

// code should work can you just implement it


void solve(Tube one, Tube two, int numbBalls) {
  //if (isPossible(one, two, numbBalls)) {
  delay(2);
  println("" + one + " " + two + " " + numbBalls);
  if (one.numBalls==0) {
    fillStation.fill(one);
  }
  one.transfer(two);
  if (two.numBalls==two.capacity) {
    emptyStation.empty(two);
  }
  if (one.numBalls!=numbBalls && two.numBalls!=numbBalls) {
    solve(one, two, numbBalls);
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
