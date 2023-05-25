import java.util.*;
int chosenNum;
Tube fillStation;
Tube emptyStation;
Tube randTube1;
Tube randTube2;

setup(){
  
}

draw(){
  
}

keyPressed(){
}

mouseClicked(){
  
}

Tube randomizeTube(){
  if(randTube1 == 0){
   int rand = Math.random() * 7 + 1;
   return Tube(rand);
  }
  else{
    int rand = int(Math.random() * 7) + 1;
    while(rand == randTube[capacity]){
     rand = int(Math.random() * 7) + 1; 
    }
    return Tube(rand);
  }
}
