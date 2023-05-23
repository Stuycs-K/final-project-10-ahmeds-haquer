//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;
  
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
  public Tube(int size){
   tube=new int[size];
   capacity=size;
   numBalls=0;
   }
  
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
}
