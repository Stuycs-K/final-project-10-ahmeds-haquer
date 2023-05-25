import java.util.*;
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;

void setup(){
  
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
