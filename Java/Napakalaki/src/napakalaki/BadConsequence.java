/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

import java.util.ArrayList;

/**
 *
 * @author juane619
 */
public abstract class BadConsequence {
    static final int MAXTREASURES=10;
    
    protected String text;
    protected int levels;
    
    public BadConsequence(String p_text, int p_lev){
        text= p_text;
        levels= p_lev;
    }
    
    public abstract Boolean isEmpty();
    
    public abstract BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v, ArrayList<Treasure> h);

    public int getLevels() {
        return levels;
    }
    
    public String getText(){
        return text;
    }
    
    public abstract void substractVisibleTreasure(Treasure t);
    
    public abstract void substractHiddenTreasure(Treasure t);
    
    public abstract String toString();
}
