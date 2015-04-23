
package grammarAnalyzer;

import java.util.ArrayList;


public class Rule {
    
    Grammar    grammar;
    Metasymbol leftside; // This is for context-free+ only...
    PhraseForm rightside; // Is this the right way? should I make a
                          // specific class? If I do, I would be able to specify
                          // rules through BNF
    
    // ..Later that day: yeah, you should have
    
    public Metasymbol getLeftside() {
        return this.leftside;
    };
    
    public PhraseForm getRightside() {
        return this.rightside;
    };
    
    public Rule(Grammar grammar, Metasymbol leftSide, PhraseForm body) {
        this.grammar = grammar;
        this.leftside = leftSide;
        this.rightside = body;
    }
    
    public Rule(String leftside, String rightside) {
        grammar = null;
        this.leftside = new Metasymbol(leftside);
        this.rightside = new PhraseForm(rightside);
    }
    
}
