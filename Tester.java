public class Tester{
  public static void main (String[] args){
    Tube filler= new Tube();
    Tube test= new Tube(2);
    Tube test2= new Tube(3);
    filler.fill(test);
    System.out.println(filler);
    filler.empty(test);
    System.out.println(filler);
    filler.fill(test);
    System.out.println("-");
    System.out.println(test);
    System.out.println(test2);
    test.transfer(test2);
    System.out.println(test);
    System.out.println(test2);
    test2.transfer(test);
    System.out.println(test);
    System.out.println(test2);
    filler.fill(test2);
    test2.transfer(test);
    System.out.println(test);
    System.out.println(test2);
    filler.empty(test);
    test2.transfer(test);
    System.out.println(test);
    System.out.println(test2);


    //System.out.println(euclid(15,35));
  }
  /*public static int euclid(int a, int b){
    if (b==0){
      return a;
    }
    else{
      return euclid(b,a%b);
    }
  }
  public static boolean isPossible(Tube one, Tube two, int numBalls){
    return (numBalls%euclid(one.capacity,two.capacity)==0)
  }
  public static void solve(Tube one, Tube two,int numbBalls){
    if (isPossible(one,two,numBalls)){
      Tube greater=one;
      Tube lesser=two;
      if (one.capacity<two.capacity){
        greater=two;
        lesser=one;
      }
      station.fill(greater);
      greater.transfer(lesser);
      if (two.numBalls==two.capacity){
        station.empty(lesser);
      }
      if (greater.numBalls!=numbBalls && lesser.numBalls!=numBalls){
        solve(greater,lesser);
      }
    }
}*/}
