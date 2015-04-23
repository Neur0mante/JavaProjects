
package grammarAnalyzer;

public class Test {
    
    public static void main(String[] args) {
        
        Rule r = new Rule("A", "bC");
        if (r.getLeftside().equals("A")) {
            System.out.println(r.getLeftside().toString());
            Symbol h = r.getRightside().get(0);
            if (h.getClass().equals(Terminal.class)) {
                System.out.println(r.getRightside().toString());
                System.out.println(r.getRightside().print());
            }
        }
    }
    
}
