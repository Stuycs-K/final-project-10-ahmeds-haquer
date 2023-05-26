import java.util.*;
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;

void setup(){
  size(900, 600);
  background(#8AC4F0);
  drawCapTubes();
  drawFiller();
  drawEmptier();
}

void draw(){
  
}

void keyPressed(){
}

void mouseClicked(){
  
}

Tube randomizeTube(){
  if(randTube1.capacity == 0){
   int rand = (int)(Math.random() * 7) + 1;
   return new Tube(rand);
  }
  else{
    int rand = (int)(Math.random() * 7) + 1;
    while(rand == randTube1.capacity){
     rand = (int)(Math.random() * 7) + 1; 
    }
    return new Tube(rand);
  }
}

void drawCapTubes(){
  int tubeNum = 2;
  for(int i = 150; tubeNum <= 8; i+=80){
    //figure out font stuff
    //PFont font = createFont("STHeitiTC-Medium-30.vlw", 30);
    //textFont(font);
    fill(255);
    stroke(#143DA2);
    rect(i, 150, 50, 370);
    textSize(30);
    fill(0);
    text(""+ tubeNum, i + 20, 180);
    tubeNum++;
  }
}

void drawFiller(){
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 180, 100, 50, 420);
  fill(0);
  textSize(17);
  text("fill", width - 165, 130);
}

void drawEmptier(){
  fill(#E8ECF5);
  stroke(#485983);
  rect(width - 120, 100, 50, 420);
  fill(0);
  textSize(17);
  text("empty", width - 120, 130);
}
