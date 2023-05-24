//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;
  
<<<<<<< HEAD
<<<<<<< HEAD
  public Tube(){// for tube that fills it up
=======
  public Tube(String type){// for tube that fills it up
    if (
>>>>>>> sadat-demo
    tube= new int[30];
    for (int i=0;i<30;i++){
      tube[i]=1;
    }
  }
<<<<<<< HEAD
=======
=======
  public Tube(){// for tube that fills it up
      tube= new int[15];
      capacity=15;
      numBalls=15;
  }

>>>>>>> 6312f08ac367b55629cc378f19246d7e22add2a2
  public Tube(int size){
   tube=new int[size];
   capacity=size;
   numBalls=0;
   }
<<<<<<< HEAD
  
>>>>>>> sadat-demo

  void empty(){
    for(int i = 0; i < tube.length; i++){
      tube[i] = 0;
    }
  }
  
  void fill(){
    for(int i = numBalls -1; i < tube.length; i++){
      tube[i] = 0;
    }
  }
    
=======
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

  public static void fill (Tube filled){
     tube.remove(filled.capacity-filled.numBalls);
     filled.add(filled.capacity-filled.numBalls);
  }
  public static void fill(Tube emptied){
    tube.add(filled.numBalls);
    emptied.remove(filled.numBalls);
 }
   public static void fill (Tube transferred){
     tube.remove(transferred.capacity-transferred.numBalls);
     transferred.add(transferred.capacity-transferred.numBalls);
   }
>>>>>>> 6312f08ac367b55629cc378f19246d7e22add2a2
}
