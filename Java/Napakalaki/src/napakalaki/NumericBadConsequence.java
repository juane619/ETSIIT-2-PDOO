/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;

/**
 *
 * @author juane
 */
public class NumericBadConsequence extends BadConsequence{
    protected int nVisibleTreasures;
    protected int nHiddenTreasures;
    
    public NumericBadConsequence(String p_text, int p_levels, int p_nVIsible, int p_nHidden){
        super(p_text, p_levels);
        
        nHiddenTreasures= p_nHidden>MAXTREASURES?MAXTREASURES:p_nHidden;
        nVisibleTreasures= p_nVIsible>MAXTREASURES?MAXTREASURES:p_nVIsible;
    }
    
    public int getNVisibleTreasures() {
        return nVisibleTreasures;
    }

    public int getNHiddenTreasures() {
        return nHiddenTreasures;
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v, ArrayList<Treasure> h){
        BadConsequence bad_ret;
        
        if(!isEmpty()){
            int pn_vis=v.size();
            int pn_hid= h.size();

            pn_vis=pn_vis>nVisibleTreasures?nVisibleTreasures:pn_vis;
            pn_hid=pn_hid>nHiddenTreasures?nHiddenTreasures:pn_hid;
            bad_ret= new NumericBadConsequence(text, levels, pn_vis, pn_hid);

            return bad_ret;
        }
        return this;
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t){
            if(nVisibleTreasures>0)
                nVisibleTreasures--;
    }
    
    @Override
    public void substractHiddenTreasure(Treasure t){
            if(nHiddenTreasures>0)
                nHiddenTreasures--;
    }
    
    @Override
    public Boolean isEmpty(){
        return nHiddenTreasures==0 && nVisibleTreasures==0;
    }
    
    @Override
    public String toString(){
        return "\n\nDescripcion: " +text + 
                "\nPerderas niveles: " +Integer.toString(levels)+
                "\nPErderas tesoros visibles= " + Integer.toString(nVisibleTreasures)+
                "\nPErderas Tesoros ocultos: " +  Integer.toString(nHiddenTreasures);
    }
}
