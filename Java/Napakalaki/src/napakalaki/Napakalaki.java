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
public class Napakalaki {
    private static final Napakalaki instance= new Napakalaki();
    
    private Player currentPlayer;
    private ArrayList<Player> players;
    private CardDealer dealer;
    private Monster currentMonster;
    
    public Napakalaki(){
        players= new ArrayList();
        currentMonster= new Monster("", 0, null, null);
        dealer= CardDealer.getInstance();
    }
    
    public void initGame(ArrayList<String> players){
        initPlayers(players);
        setEnemies();
        dealer.initCards();
        nextTurn();
    }
    
    private void  initPlayers(ArrayList<String> names){
        if(names.size()>0){
            Player aux;
            for(int i=0; i<names.size(); i++){
                aux= new Player(names.get(i));
                players.add(aux);
            }
        }
    }
    
    private void setEnemies(){
        boolean no_asignado = true;
        for(int i = 0; i < players.size(); i++){
            while(no_asignado){
                int aleatorio = (int) (Math.random() * players.size());
                if(aleatorio != i){
                    players.get(i).setEnemy(players.get(aleatorio));
                    no_asignado = false;
                }
            }
            no_asignado = true;
        }         
    }
    
     public boolean nextTurn(){
        Boolean stateOK= nextTurnAllowed();
        
        if(stateOK){
            currentMonster= dealer.nextMonster();
            currentPlayer= nextPlayer();
            if(currentPlayer.isDead()){
                currentPlayer.initTreasures();
            }
        }
        
        return stateOK;
    }
    
    private Player nextPlayer(){
        int index_next=0;
        Player n_pl=null;
        if(currentPlayer==null){
            index_next= (int) (Math.random() * (players.size()-1));
            n_pl= players.get(index_next);
        }
        else{
            index_next=players.indexOf(currentPlayer);
            if(index_next==players.size()-1)
                index_next=0;
            else
                index_next++;
        }
        n_pl= players.get(index_next);
        currentPlayer= n_pl;
        return n_pl;
    }
    
    private boolean nextTurnAllowed(){
        if(currentPlayer==null || currentPlayer.isDead())
            return true;
        return currentPlayer.validState();
    }
    
    
    
    public static Napakalaki getInstance(){
        return instance;
    }

    public CombatResult developCombat(){
        Monster m = currentMonster;
        CombatResult combat = currentPlayer.combat(m);
        if(combat==CombatResult.LOSEANDCONVERT){
            Cultist c_aux= dealer.nextCultist();
            CultistPlayer pl_cul= new CultistPlayer(currentPlayer, c_aux);
            for (Player player : players) {
                if(player.getEnemy()==currentPlayer)
                    player.setEnemy(pl_cul);
            }
            players.set(players.indexOf(currentPlayer), pl_cul);
            currentPlayer= pl_cul;
        }
        dealer.giveMonsterBack(m);
        return combat;
    }

        
    public void discardVisibleTreasures(ArrayList<Treasure> tr_vis){
        for(Treasure tr :tr_vis){
            currentPlayer.discardVisibleTreasure(tr);
            dealer.giveTreasuresBack(tr);
        }
    }

    public void discardHiddenTreasures(ArrayList<Treasure> tr_hid){
        for(Treasure descartar :tr_hid){
            currentPlayer.discardHiddenTreasure(descartar);
            dealer.giveTreasuresBack(descartar);
        }
    }
    
    public void makeTreasuresVisible(ArrayList<Treasure> tr){

        for(Treasure t :tr){
            currentPlayer.makeTreasureVisible(t);
        }
        
    }    
    
    public Player getCurrentPlayer(){
        return currentPlayer;
    }
    
    public Monster getCurrentMonster(){
        return currentMonster;
    }
      
    public boolean endOfGame(CombatResult result){
        return result == CombatResult.WINGAME;
    }
}
