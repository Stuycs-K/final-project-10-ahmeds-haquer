public class Tester{
  public static void main (String[] args){
    Tube filler= new Tube();
    Tube test= new Tube(8);
    Tube test2= new Tube(7);
    filler.fill(test);
    System.out.println(test);
    test.transfer(test2);
    System.out.println(test);
    System.out.println(test2);
    filler.empty(test);
    filler.empty(test2);
    System.out.println(test);
    System.out.println(test2);
  }
}
