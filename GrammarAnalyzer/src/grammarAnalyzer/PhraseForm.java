
package grammarAnalyzer;

import java.util.ArrayList;


public class PhraseForm {
    
    ArrayList<Symbol> arr;
    String            s;
    
    public PhraseForm(String S) {
        arr = new ArrayList<Symbol>();
        this.s = S;
        char[] ca = S.toCharArray();
        for (char c : ca) {
            if (Character.isLowerCase(c)) {
                arr.add(new Terminal(c));
            } else if (Character.isUpperCase(c)) {
                arr.add(new Metasymbol(c));
            }
        }
        
    }
    
    public Symbol get(int i) {
        return arr.get(i);
    }
    
    @Override
    public String toString() {
        return s;
    }
    
    public String print() {
        String s = "";
        for (Symbol sym : arr) {
            s = s + sym.getClass() + " " + sym.toString() + " ";
        }
        
        return s;
    }

    public int size() {
        return arr.size();
    }
    
    public ArrayList<Symbol> getArray(){
        return arr;
    }
}
