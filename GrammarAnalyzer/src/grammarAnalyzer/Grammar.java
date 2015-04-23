
package grammarAnalyzer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ConcurrentSkipListSet;


public class Grammar {
    
    ArrayList<Terminal>               VT;
    ArrayList<Metasymbol>             VN;
    Metasymbol                        S;
    ArrayList<Rule>                   rules;
    ConcurrentSkipListSet<Metasymbol> yesEpsilon;
    
    public Grammar() {
        rules = new ArrayList<>();
        yesEpsilon = new ConcurrentSkipListSet<Metasymbol>();
    }
    
    public Grammar(ArrayList<Terminal> VT, ArrayList<Metasymbol> VN,
            Metasymbol S) {
        this();
        this.VT = VT;
        this.VN = VN;
        this.S = S;
        
    }
    
    void newRule(Metasymbol head, PhraseForm body) {
        Rule rule = new Rule(this, head, body);
        rules.add(rule);
    }
    
    private ConcurrentSkipListSet<Terminal> starterSymbols(Metasymbol M) {
        ConcurrentSkipListSet<Terminal> ss = new ConcurrentSkipListSet<Terminal>();
        for (Rule R : rules) {
            if (R.getLeftside().equals(M)) {
                ss.addAll(digFirstTerminal(R));
            }
        }
        return ss;
    }
    
    private ConcurrentSkipListSet<Terminal> digFirstTerminal(Rule R) {
        ConcurrentSkipListSet<Terminal> termList = new ConcurrentSkipListSet<>();
        ArrayList<Symbol> body = R.getRightside().getArray();
        Iterator<Symbol> iter = body.iterator();
        Symbol h = iter.next();
        if (h.getClass().equals(Terminal.class)) {
            termList.add((Terminal) h);
            return termList;
        } else if (h.getClass().equals(Metasymbol.class)) {
            
            termList.addAll(starterSymbols((Metasymbol) h));
            
            if (yesEpsilon.contains(h)) {
                if (iter.hasNext()) {
                    termList.addAll(starterSymbols((Metasymbol) iter.next()));
                }
            }
        }
        return termList;
    }
    
}
