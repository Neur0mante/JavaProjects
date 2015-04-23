
package grammarAnalyzer;

public class Terminal extends Symbol {
    
    char c;
    
    public Terminal(char c) {
        this.c = c;
    }
    
    public Terminal(String string) {
        this.c = string.toCharArray()[0];
    }
    
    @Override
    public String toString() {
        return c + "";
    }
    
}
