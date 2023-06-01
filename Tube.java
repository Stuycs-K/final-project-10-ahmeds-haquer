//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;

  public Tube(){// for tube that fills it up
      tube= new int[15];
      for (int i=0;i<15;i++){
        tube[i]=1;
      }
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
  private void fillSpot (int index){
    tube[index]=1;
    numBalls++;
  }

  private void removeSpot (int index){
    tube[index]=0;
    numBalls--;
  }
  public  void remove (int[] holder,int quantity){
     for (int i=0;i<quantity&&numBalls>0;i++){
       holder[numBalls-1]=0;
       numBalls--;
     }
  }
  public  void remove (int quantity,Tube holder){
     for (int i=0;i<quantity&&holder.numBalls>0;i++){
       holder.removeSpot(holder.numBalls-1);
     }

  }
  public void add (int[] holder,int quantity){
    for (int i=0;i<quantity&&numBalls<capacity;i++){
       holder[numBalls]=1;
       numBalls++;
     }
  }
  public void add (int quantity, Tube holder){
    for (int i=0;i<quantity&&holder.numBalls<holder.capacity;i++){
       holder.fillSpot(holder.numBalls);;
     }
  }

  public  void fill (Tube filled){
     remove(tube,filled.capacity-filled.numBalls);
     add(filled.capacity-filled.numBalls,filled);
  }
  public  void empty(Tube emptied){
    add(tube,emptied.numBalls);
    remove(emptied.numBalls,emptied);
 }
   public  void transfer (Tube transferred){
     if (numBalls>=transferred.capacity-transferred.numBalls){
       remove(tube,transferred.capacity-transferred.numBalls);
       add(transferred.capacity-transferred.numBalls,transferred);
   }
   else{
     remove(tube,numBalls);
     add(capacity,transferred);
   }
 }
}
