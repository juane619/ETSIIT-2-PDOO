/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

/**
 *
 * @author juane619
 */
public class Prize {
    private int treasures;
    private int level;
    
    Prize(int treasures, int level){
        this.treasures= treasures;
        this.level= level;
    }

    public int getTreasures() {
        return treasures;
    }

    public int getLevel() {
        return level;
    }
  
    public String toString(){
        return "\nGanaras tesoros= " +Integer.toString(treasures) + "\nGanaras Niveles= "+Integer.toString(level);
    }
}
