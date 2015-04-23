
package grammarAnalyzer;

public class Metasymbol extends Symbol {
    
    String M;
    
    public Metasymbol() {
        M = null;
    }
    
    public Metasymbol(String M) {
        this.M = M;
    }
    
    public Metasymbol(char c) {
        this.M = c + "";
    }
    
    boolean equals(Symbol O) {
        if (M == O.toString()) {
            return true;
        }
        return false;
    }
    
    boolean equals(String S) {
        if (M == S) {
            return true;
        }
        return false;
    }
    
    public String toString() {
        return M;
    }
    
}
