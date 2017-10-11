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
public class Monster {
    private String name;
    private int combatLevel;
    private Prize premio;
    private BadConsequence bc;
    private int levelChangeAgainstCultistPlayer;
    
    public Monster(String name, int level, BadConsequence bc, Prize prize){
       this.name= name;
       this.combatLevel= level;
       this.premio= prize;
       this.bc= bc;
       levelChangeAgainstCultistPlayer = 0;
    }
    
    public Monster(String name, int level, BadConsequence bc, Prize prize, int lc){
       this.name= name;
       this.combatLevel= level;
       this.premio= prize;
       this.bc= bc;   
       levelChangeAgainstCultistPlayer = lc;
    }

    public String getName() {
        return name;
    }
    
    public int getLevelsGained(){
        return premio.getLevel();
    }
    
    public int getTreasuresGained(){
        return premio.getTreasures();
    }

    public BadConsequence getBadConsequence() {
        return bc;
    }
    
    public Prize getPrize(){
        return premio;
    }
        
    public int getCombatLevel(){
        return combatLevel;
    }
    
    public int getCombatLevelAgainstCultistPlayer(){
        return levelChangeAgainstCultistPlayer+combatLevel;
    }
    
    @Override
    public String toString(){
        return "\n\nNombre del monstruo= " +name + "\nNivel de combate= "+Integer.toString(combatLevel)+"\nPremio: " +premio.toString()+"\nCASTIGO: " + bc.toString();
    }
}
