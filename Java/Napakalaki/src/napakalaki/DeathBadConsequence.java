/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
/**
 *
 * @author juane
 */
public class DeathBadConsequence extends NumericBadConsequence{
    private final boolean death;
    
    public DeathBadConsequence(String p_text, boolean p_death){
        super(p_text, Player.MAXLEVEL, MAXTREASURES, MAXTREASURES);
        death= p_death;
    }
    
    public boolean isDead(){
        return death;
    }
    
    @Override
    public String toString(){
        return "\n\nDescripcion= " +text + 
                "\nPerderas niveles: "+Integer.toString(levels)+
                "\nPErderas tesoros visibles: " + Integer.toString(nVisibleTreasures)+
                "\nPErderas Tesoros ocultos: " +  Integer.toString(nHiddenTreasures)+
                "\nMoriras: " + Boolean.toString(death);
    }
}
