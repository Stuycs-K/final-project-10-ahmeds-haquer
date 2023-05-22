//import java.util.*;
public class Tube {
  private int[] tube;
  private int capacity;
  private int numBalls;
  
  public Tube(){// for tube that fills it up
    tube= new int[30];
    for (int i=0;i<30;i++){
      tube[i]=1;
    }
  }
}
