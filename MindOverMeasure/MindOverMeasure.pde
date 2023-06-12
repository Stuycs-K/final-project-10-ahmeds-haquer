import java.util.*; //<>//
import java.util.*; //<>//
import processing.sound.*;
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
static int INSTRUCTIONS=8;
static int VICTORY = 5;
static int HOME = 7;
static int MODE = HOME;
static int FORFEIT = 6;
boolean transferFrom;
boolean transferInto;
Button game;
Button restart;
Button instructions;
int countdown;
int tracker;
boolean transfer;
SoundFile player;
SoundFile yay;
SoundFile scary;
SoundFile playful;
int instructionsCount;
int soundTracker=0;
int steps=0;
public PImage img;

void setup() {
  player= new SoundFile(this, "ding2.mp3");
  yay=new SoundFile(this, "yay.mp3");
  scary=new SoundFile(this, "scary.mp3");
  playful= new SoundFile(this, "playful.mp3");
  instructionsCount=0;
  size(900, 600);
  frameRate(80);
  capacities= generateCapacities();
  randTube1 = new Tube(capacities[0]);
  randTube2 = new Tube (capacities[1]);
  fillStation = new Tube();
  emptyStation = new Tube();
  emptyStation.numBalls = 0;
  countdown=0;
  tracker=60;
  transfer=true;
}

void draw() {
  background(#EAD980);
  textSize(20);
  fill(0);

  if (MODE == HOME) {
    drawHome();
  }
  if (MODE==INSTRUCTIONS) {
    instructionsCount++;
    if (instructionsCount==1) {
      playful.play();
    }
    drawInstructions();
  }
  if (MODE != HOME && MODE!=INSTRUCTIONS&&MODE!=VICTORY) {
    fill(#D6EAB4);
    stroke(#A8C479);
    restart = new Button(#D6EAB4, #C0E582, 20, 20, 60, 40);
    fill(0);
    textSize(15);
    text("RESTART", 50, 35);
  }
  if (MODE == numSelect) {
    instructionsCount++;
    if (instructionsCount==1) {
      playful.play();
    }
    background(#AACCD8);
    drawNumSelect();
    textSize(35);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Select a number by typing the according key.", 450, 160);
    textSize(20);
    text("The number you select is very important...", 450, 460);
  }
  if (MODE != numSelect && MODE != HOME&& MODE!=INSTRUCTIONS) {
    textSize(15);
    fill(0);
    text("Selected number: " + chosenNum, 600, 30);
    text("Your tubes: \n tube with capacity " + randTube1.capacity + "\n tube with capacity " + randTube2.capacity, 750, 30);
    drawCapTubes();
    drawFiller();
    drawEmptier();
  }

  if (MODE == noState) {
    textSize(20);
    fill(#104D62);
    text("Choose an action by clicking 'f'(fill), 'e'(empty), 't'(transfer) or 's'(forfeit).", 330, 90);
  }

  if (MODE == TRANSFER) {
    textSize(15);
    fill(0);
    text("MODE: TRANSFER", 700, 560);
    if (!transferFrom) {
      textSize(25);
      fill(#104D62);
      text("Click to select a tube to transfer from.", 330, 90);
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
    textSize(25);
    fill(#104D62);
    text("Click to select a tube to fill.", 330, 90);
  }
  if (MODE == FORFEIT) {
    countdown+=1;
    textSize(30);
    fill(#3980A2);
    text("SOLUTION", 300, 50);
    if (randTube1.numBalls!=chosenNum && randTube2.numBalls!=chosenNum) {
      solver(randTube1, randTube2, chosenNum);
    } else {
      soundTracker++;
      if (soundTracker==1) {
        yay.play();
      }
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("And that is the solution! You may now press 'r' or 'R' to retry!", 450, 550);
    }
  }
  if (MODE == EMPTY) {
    textSize(15);
    fill(0);
    text("MODE: EMPTY", 700, 560);
  }
  if (MODE == numSelect) {
    if (keyPressed && key != '1' && key != '2' && key != '3' && key != '4' && key != '5' && key != '6' && key != '7' && key != '8' && key != 'f' && key != 'F' && key != 'T' && key != 't'&& key != 'E' && key != 'e' && key != 's' && key != 'S'&& key != 'r' && key != 'R') {
      textSize(30);
      fill(0);
      textAlign(LEFT);
      text("Please select a valid key option.", 20, 40);
    }
  }
  if (MODE==VICTORY) {
    soundTracker++;
    if (soundTracker==1) {
      yay.play();
    }
    background(#25BDF2);
    drawVictory();
  }
  if (mousePressed) {
    if (MODE == HOME) {
      if (game.isPressed()) {
        MODE = numSelect;
      }
      if (instructions.isPressed()) {
        MODE=INSTRUCTIONS;
      }
    }
    if (MODE == FILL || MODE == TRANSFER || MODE == EMPTY) {
      color colour = get(mouseX, mouseY);
      if (colour != -1) {
        textSize(15);
        fill(#104D62);
        text("Please click again to select a valid tube.", 300, 40);
      } else if (colour == -1) {
        int selTube = mouseX/80;
        if (selTube != randTube1.capacity && selTube != randTube2.capacity) {
          textSize(15);
          fill(#104D62);
          text("Please click again to select a valid tube.", 300, 40);
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
        scary.play();
        chosenNum = Character.getNumericValue(key);
        capacities= generateCapacities();
        randTube1 = new Tube(capacities[0]);
        randTube2 = new Tube (capacities[1]);
        MODE = noState;
      }
    } else if (MODE==VICTORY) {
      if (key == 'r'  || key == 'R') {
        countdown=0;
        soundTracker=0;
        tracker=60;
        transfer=true;
        MODE = numSelect;
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
      countdown=0;
      soundTracker=0;
      tracker=60;
      transfer=true;
      MODE = numSelect;
    }
  }
}

void drawInstructions() {
  fill(250, 215, 224);
  rect(0, 0, 900, 600);
  textSize(20);
  fill(0);
  textAlign(CENTER, TOP);
  text("Overview", 450, 20);
  textAlign(LEFT, TOP);
  text("A game modeled after the Mind Over Measure exhibit at MoMath. The user is prompted to select a \nnumber (1-7) at the very beginning, and two tubes of randomized capacity (2-8) will be selected for the \nuser. The goal is to end with the selected number of balls in either of the tubes, making use of the filler, \nemptier, and transfers between the two tubes.\n", 20, 50);
  textAlign(CENTER, CENTER);
  text("Instructions", 450, 200);
  textAlign(LEFT, CENTER);
  text("1. Select an integer (1-7) by typing the according key.\n2. Use the following legend to move the balls as you see fit. 'f' or 'F' : fill After typing this key, use the \nmouse to click the tube you would like to fill. Recall that you can only fill either of the tubes that \nhave been randomly selected for you. 'e' or 'E' : empty. After typing this key, use the mouse to click the \ntube you would like to empty. Recall that you can only empty either of the tubes that have been randomly \nselected for you. 't' or 'T' : transfer After typing this key, use the mouse to click the tube you would like to \ntransfer from. Recall that you can only transfer between the two tubes that have been randomly selected \nfor you. Thus, there is no need to try and indicate the tube you would like to transfer into. 's' or 'S' : forfeit. \nYou will go into forfeit mode. The solution will be shown to you. 'r' or 'R' : restart You will be able to restart \nthe game and you will be given the option to select an integer again.\n3. When you reach the goal, you are victorious! Click 'r' or 'R' to start again! Now, click 'r' or 'R' to start!", 20, 400);
}

void drawVictory() {
  img=loadImage("victory.jpg");
  image(img, 0, 0);
  textSize(60);
  fill(0);
  textAlign(CENTER, CENTER);
  text("YOU DID IT! Congratulations! \n You can now press 'R' or 'r' to restart!", 450, 300);
}

void mousePressed() {
  color col = get(mouseX, mouseY);
  if (col == -1) {
    tempSelectedTube = (mouseX / 80);
  }
  if (MODE != HOME&&MODE!=INSTRUCTIONS&&MODE!=VICTORY) {
    if (restart.isPressed()) {
      MODE = numSelect;
    }
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
      player.play();
      randTube1.transfer(randTube2);
      transferFrom = false;
      transferInto = false;
    } else if (TselectedTube1 == randTube2.capacity) {
      player.play();
      randTube2.transfer(randTube1);
      transferFrom = false;
      transferInto = false;
    }
    if (randTube1.numBalls==chosenNum || randTube2.numBalls==chosenNum) {
      MODE=VICTORY;
    }
  }
  if (MODE == FILL) {
    if (tempSelectedTube != randTube1.capacity && tempSelectedTube != randTube2.capacity) {
      textSize(30);
      fill(0);
      text("Please click again to select a valid tube.", 20, 40);
    } else {
      FselectedTube = tempSelectedTube;
      if (FselectedTube == randTube1.capacity) {
        player.play();
        fillStation.fill(randTube1);
      } else if (FselectedTube == randTube2.capacity) {
        player.play();
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
        player.play();
        emptyStation.empty(randTube1);
      } else if (FselectedTube == randTube2.capacity) {
        player.play();
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
  }
  return result;
}

void drawHome() {
  background(#326F33);
  textSize(140);
  fill(0);
  text("MIND OVER", 140, 200);
  text("MEASURE", 170, 300);
  fill(#E3E3E3);
  game = new Button(#E3E3E3, #C5CBC7, 200, 450, 160, 70);
  fill(0);
  textSize(40);
  text("PLAY", 230, 500);
  fill(#E3E3E3);
  instructions = new Button(#E3E3E3, #C5CBC7, 450, 450, 260, 70);
  fill(0);
  text("INSTRUCTIONS", 450, 500);
}

void drawNumSelect() {
  int num = 1;
  for (int i = 90; i < width && num < 8; i+= 120) {
    fill(220, 220, 220);
    stroke(#143DA2);
    circle(i, 280, 90);
    textSize(30);
    fill(0);
    text(""+ num, i, 275);
    num++;
  }
}

void drawCapTubes() {
  int tubeNum = 2;
  for (int i = 150; tubeNum <= 8; i+=80) {
    if (tubeNum == randTube1.capacity || tubeNum == randTube2.capacity) {
      fill(255);
    } else {
      fill(#D8D8D4);
    }
    stroke(#143DA2);
    int y = 370;
    rect(i, 150, 50, y);
    textSize(30);
    fill(0);
    text(""+ tubeNum, i + 20, 180);
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
  textSize(13);
  text("station 1", width - 155, 120);
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
  textSize(13);
  text("station 2", 805, 120);
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

void solve(Tube one, Tube two) {
  if (one.numBalls==0&&countdown==tracker) {
    player.play();
    fillStation.fill(one);
    tracker+=300;
    transfer=true;
    fill(0);
    textSize(20);
  } else if (transfer&&countdown==tracker) {
    player.play();
    one.transfer(two);
    tracker+=300;
    transfer=false;
  } else if (two.numBalls==two.capacity&&countdown==tracker) {
    player.play();
    emptyStation.empty(two);
    tracker+=300;
    transfer=true;
  }
}

void solver(Tube one, Tube two, int numbBalls) {
  if (one.capacity>two.capacity) {
    solve(one, two);
  } else {
    solve(two, one);
  }
}
