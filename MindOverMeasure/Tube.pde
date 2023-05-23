//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;
  
  public Tube(String type){// for tube that fills it up
    if (type.equals("fill")){
      tube= new int[10];
      capacity=10;
      numBalls=10;//update these at the end of fill and dump
      for (int i=0;i<30;i++){
        tube[i]=1;
      }
    }
    if (type.equals("empty")){
      tube=new int[10];
      capacity=10;
      numBalls=0;
    }
  }

  public Tube(int size){
   tube=new int[size];
   capacity=size;
   numBalls=0;
   }
   
}
