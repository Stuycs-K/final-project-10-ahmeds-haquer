//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;
  
  public Tube(){// for tube that fills it up
      tube= new int[15];
      capacity=15;
      numBalls=15;
  }

  public Tube(int size){
   tube=new int[size];
   capacity=size;
   numBalls=0;
   }
  public String toString(){
    String result="|";
    for (int i=0;i<capacity;i++){
      if (tube[i]==0){
        result+="   |";
      }
      else{
        result+=" O |";
      }
    }
    return result;
  }
  public void remove (int quantity){
     for (int i=0;i<quantity;i++){
       tube[numBalls]=0;
       numBalls--;
     } 
  }
  public void add (int quantity){
    for (int i=0;i<quantity;i++){
       tube[numBalls]=1;
       numBalls++;
     } 
  }
  public fill (Tube filler, Tube filled){
  
  }
  
}
