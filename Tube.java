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
  public  void remove (int[] holder,int quantity){
     for (int i=0;i<quantity&&numBalls>0;i++){
       holder[numBalls-1]=0;
       numBalls--;
     }
  }
  public  void remove (Tube holder,int quantity){
     for (int i=0;i<quantity&&holder.numBalls>0;i++){
       holder.tube[holder.numBalls-1]=0;
       holder.numBalls--;
     }
  }
  public void add (int[] holder,int quantity){
    for (int i=0;i<quantity&&numBalls<capacity;i++){
       holder[numBalls]=1;
       numBalls++;
     }
  }
  public void add (Tube holder,int quantity){
    for (int i=0;i<quantity&&holder.numBalls<capacity;i++){
       holder.tube[holder.numBalls]=1;
       holder.numBalls++;
     }
  }

  public  void fill (Tube filled){
     remove(tube,filled.capacity-filled.numBalls);
     add(filled,filled.capacity-filled.numBalls);
  }
  public  void empty(Tube emptied){
    add(tube,emptied.numBalls);
    remove(emptied, emptied.numBalls);
 }
   public  void transfer (Tube transferred){
     if (numBalls>=transferred.capacity-transferred.numBalls){
     remove(tube,transferred.capacity-transferred.numBalls);
     add(transferred,transferred.capacity-transferred.numBalls);
   }
   else{
     remove(tube,numBalls);
     add(transferred,numBalls);
   }
 }
}
