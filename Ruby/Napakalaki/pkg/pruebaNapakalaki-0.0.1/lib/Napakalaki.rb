# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require_relative 'CultistPlayer.rb'
require_relative 'CardDealer.rb'

class Napakalaki
  include Singleton
  
  def initialize
    @players = Array.new
    @currentPlayer = nil
    @currentMonster = nil
    @dealer= CardDealer.instance
  end
  
  def makeTreasuresVisible(tr)
    tr.each do |t|
      @currentPlayer.makeTreasureVisible(t)
    end
  end
  
  def initGame(players)
    initPlayers(players)
    setEnemies
    @dealer.initCards
    nextTurn
  end

  def nextTurn
    stateOK= nextTurnAllowed
    stateOK= @currentPlayer.validState
        
    if(stateOK)
      @currentMonster = @dealer.nextMonster
      @currentPlayer = nextPlayer
      dead = @currentPlayer.dead
      if(dead)
          @currentPlayer.initTreasures
      end
    end

    return stateOK;
  end
  
  def initPlayers(names)
    if names.length > 0
      for i in 0..names.length-1
        aux = Player.new(names[i])
        @players<<(aux)
      end
    end
  end
  
  def nextPlayer
    index_next = 0
    n_pl = nil
    if @currentPlayer == nil
      index_next = rand(@players.size - 1)
      n_pl = @players[index_next]
    else
      index_next = @players.index(@currentPlayer)
      if index_next == @players.size - 1
          index_next = 0
      else
          index_next+=1
      end
      n_pl = @players[index_next]
    end
    @currentPlayer = n_pl
    return n_pl
  end
  
  def nextTurnAllowed
    if @currentPlayer.nil?
      return true
    end
    return @currentPlayer.validState
  end
  
  def setEnemies
    no_asignado = true
    
    for i in 0..@players.length-1
      while no_asignado
        aleatorio = rand(@players.length)
        if(aleatorio != i)
          @players[i].setEnemy(@players[aleatorio])
          no_asignado = false
        end
      end
      no_asignado = true
    end
  end
  
  def developCombat
    m = @currentMonster
    combat = @currentPlayer.combat(m)
    if(combat == CombatResult::LOSEANDCONVERT)
      cultist = @dealer.nextCultist
      cultist_p = CultistPlayer.new(@currentPlayer, cultist)
      indice = @players.index(@currentPlayer)
      @players.each do |ene|
        ene.enemy = cultist_p if (ene == @currentPlayer)
      end
      @players[indice] = cultist_p
      @currentPlayer = cultist_p
    end
    @dealer.giveMonsterBack(m)
    return combat
  end
  
  def discardVisibleTreasures(tr_vis)
    tr_vis.each do |descartar|
      @currentPlayer.discardVisibleTreasure(descartar)
      @dealer.giveTreasuresBack(descartar)
    end
  end
  
  def discardHiddenTreasures(tr_hid)
    tr_hid.each do |descartar|
      @currentPlayer.discardHiddenTreasure(descartar)
      @dealer.giveTreasuresBack(descartar)
    end
  end
  
  def makeTreasuresVisible(tr)
    tr.each do |t|
      @currentPlayer.makeTreasureVisible(t)
    end    
  end
  
  def initGame(players)
    initPlayers(players)
    setEnemies
    @dealer.initCards
    nextTurn
  end
  
  def getCurrentPlayer
    return @currentPlayer
  end
    
  def getCurrentMonster
    return @currentMonster
  end
  
  def nextTurn
    stateOK = nextTurnAllowed

    if stateOK
      @currentPlayer = nextPlayer
      @currentMonster = @dealer.nextMonster
      
      dead = @currentPlayer.dead
      if dead
        @currentPlayer.initTreasures
      end
    end

    return stateOK;
  end

  def endOfGame(result)
    if result == result.WINGAME
      return true
    end
    return false
  end
  
  attr_reader :currentPlayer, :currentMonster, :enemy
  private :initPlayers, :nextPlayer, :nextTurnAllowed, :setEnemies
end