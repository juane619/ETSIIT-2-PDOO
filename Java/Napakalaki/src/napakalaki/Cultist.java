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
public class Cultist {
    private String name;
    private int gainedLevels;
    
    public Cultist(String p_name, int p_gained_levels){
        name= p_name;
        gainedLevels= p_gained_levels;
    }
    
    public int getGainedLevels(){
        return gainedLevels;
    }
}
