/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

import GUI.Dice;

/**
 *
 * @author juane
 */
public class CultistPlayer extends Player{
    private static int totalCultistPlayers=0;
    
    private Cultist myCultistCard;
    
    public CultistPlayer(Player p, Cultist c){
        super(p);
        myCultistCard = c;
        totalCultistPlayers++;
    }
    
    @Override
    public int getCombatLevel(){
        int combat_level= super.getCombatLevel();
        return combat_level+(70*combat_level/100)+myCultistCard.getGainedLevels()*totalCultistPlayers;
    }
    
    @Override
    protected int getOponentLevel(Monster m){
        return m.getCombatLevelAgainstCultistPlayer();
    }
    
    @Override
    protected boolean shouldConvert(){
        return false;
    }
    
    private Treasure giveMeATreasure(){
        int aleat;
        aleat = (int)(Math.random()*visibleTreasures.size());
        return visibleTreasures.get(aleat);
    }
    
    private boolean canYouGiveMeATreasure(){
        return enemy.visibleTreasures.size()>0;
    }
    
    public int getTotalCultistPlayers(){
        return totalCultistPlayers;
    }
}
