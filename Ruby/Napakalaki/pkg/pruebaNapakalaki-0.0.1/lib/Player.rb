# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'Dice.rb'

require_relative 'Dice.rb'
require_relative 'CardDealer.rb'
require_relative 'TreasureKind.rb'
require_relative 'Monster.rb'
require_relative 'CombatResult.rb'
require_relative 'SpecificBadConsequence.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'

class Player
  @@MAXLEVEL=10
  
  def initialize(name_p, lvl, dd, steal, ene, hidT, visT, pbad)    
    @name = name_p
    @level = lvl
    @dead = dd
    @canISteal = steal
    @enemy = ene
    @hiddenTreasures = hidT
    @visibleTreasures = visT
    @pendingBadConsequence = pbad
  end
  
  def self.copyPlayer(player)
    new(player.name, player.level, player.dead, player.canISteal, player.enemy, player.hiddenTreasures, player.visibleTreasures, player.pendingBadConsequence)
  end
  
  def bringToLife
    @dead= false
  end
  
  def getCombatLevel
    level_combat= @level
    
    if @visibleTreasures != nil   
      for i in(0..@visibleTreasures.length-1)
        level_combat+= @visibleTreasures[i].bonus
      end
    end
    
    return level_combat
  end
  
  def getOponentLevel(monster)
    monster.combatLevel
  end
  
  def shouldConvert
    dice = Dice.instance
    return dice.nextNumber == 6
  end
  
  def incrementLevels(i)
    @level += i.to_i
    if @level >= @@MAXLEVEL
      @level = 10
    end
  end
  
  def decrementLevels(i)
    @level -= i.to_i
    if @level <= 0
      @level = 1
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence = b
  end
  
  def applyPrize(m)
    nLevels = m.getLevelsGained
    n_treasures = m.getTreasuresGained

    incrementLevels(nLevels)

    if n_treasures>0
      dealer = CardDealer.instance
      for i in 0..n_treasures
        tr_aux = dealer.nextTreasure
        @hiddenTreasures<<(tr_aux)
      end
    end
  end
  
  def applyBadConsequence(m)
    badC = m.bc
    nLevels= badC.levels
        
    decrementLevels(nLevels)

    pendingBad = badC.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  
  def canMakeTreasureVisible(t)
    puede_make = true
    n_tr_oh = 0
    @visibleTreasures.each do |tes|
      if tes.type == t.type && t.type != TreasureKind::ONEHAND
        return false
      end
      if tes.type == TreasureKind::ONEHAND
          n_tr_oh += 1

          if t.type == TreasureKind::BOTHHANDS
            return false
          end
      end
      if tes.type == TreasureKind::BOTHHANDS && t.type == TreasureKind::ONEHAND
        return false
      end
    end
    if t.type == TreasureKind::ONEHAND && n_tr_oh >= 2
      return false
    end

    return puede_make
  end
  
  def howManyVisibleTreasures(t)
    n_trs=0
    @visibleTreasures.each do |v_tr|
      if(v_tr==t)
        n_trs+=1
      end
    end
    return n_trs
  end
  
  def dielfNoTreasures
    @dead=true
  end
  
  def giveMeATreasure
    return hiddenTreasures[rand(hiddenTreasures.length)]
  end
  
  def canYouGiveMeATreasure
    return @visibleTreasures.length
  end
  
  def howManyVisibleTreasures(t)
    n_trs = 0
    for i in(0..@visibleTreasures.length-1)
      if visibleTreasures[i].type == t
        n_trs += 1
      end
    end
    return n_trs
  end
  
  def dielfNoTreasures
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead = true
    end
  end
  
  def getHiddenTreasures
    return @hiddenTreasures
  end
  
  def getVisibleTreasures
    return @visibleTreasures
  end
  
  def combat(m)
    myLevel = getCombatLevel
    monsterLevel = getOponentLevel(m)
    if !canISteal
      dice = Dice.instance
      number = dice.nextNumber

      if number < 3 
        enemyLevel = @enemy.getCombatLevel
        monsterLevel += enemyLevel;
      end
    end
    if myLevel > monsterLevel
      applyPrize(m)
      if level >= @@MAXLEVEL 
        cr = CombatResult::WINGAME
      else
        cr = CombatResult::WIN
      end
    else
      applyBadConsequence(m)
      cr = CombatResult::LOSE
      if shouldConvert
        cr = CombatResult::LOSEANDCONVERT
      end
    end
    
    return cr;
  end
  
  def makeTreasureVisible(t)
    canI = canMakeTreasureVisible(t)
    if canI
      @visibleTreasures.push(t)
      @hiddenTreasures.delete(t)
    end
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    if @pendingBadConsequence != nil && !@pendingBadConsequence.empty? 
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dielfNoTreasures()
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    if @pendingBadConsequence != nil && !@pendingBadConsequence.empty?
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    dielfNoTreasures()
  end
  
  def validState
    return @hiddenTreasures.length < 5 && (@pendingBadConsequence == nil || @pendingBadConsequence.empty?)
  end
  
  def initTreasures
    dealer = CardDealer.instance
    dice = Dice.instance
    bringToLife
    t = dealer.nextTreasure
    @hiddenTreasures.push(t)
    number = dice.nextNumber

    if(number > 1)
        t = dealer.nextTreasure
        @hiddenTreasures.push(t)
    end
    if(number == 6)
        t = dealer.nextTreasure
        @hiddenTreasures.push(t)
    end
    
    
  end
  
  def getLevels
    return @level;
  end
  
  def stealTreasure
    t = nil;
    if canISteal
      if enemy.canYouGiveMeATreasure
        t = giveMeATreasure
        @hiddenTreasures<<(t)
        haveStolen
      end
    end
    return t
  end
  
  def setEnemy(enemy)
    @enemy = enemy
  end
  
  def giveMeATreasure
    return @hiddenTreasures[rand(@hiddenTreasures.length)]
  end
  
  def canISteal
    return @canISteal
  end
  
  def canYouGiveMeATreasure
    return @visibleTreasures.length > 0
  end
  
  def haveStolen
    @canISteal = false
  end
  
  def discardAllTreasures
    tr_vis_aux = Array.new(@visibleTreasures)
    tr_hid_aux = Array.new(@hiddenTreasures)

    tr_vis_aux.each do |v_tr|
      discardVisibleTreasure(v_tr)
    end

    tr_hid_aux.each do |h_tr|
      discardHiddenTreasure(h_tr)
    end
  end
  
  def to_s
    "#{@name}
    \tNivel = #{@level}
    \tNivel de combate = " + getCombatLevel.to_s
  end
  
  def self.MAXLEVEL
    return @@MAXLEVEL
  end
  
  attr_accessor :canISteal, :level, :name, :dead, :enemy, :pendingBadConsequence, :hiddenTreasures, :visibleTreasures
  private :bringToLife, :getCombatLevel, :incrementLevels, :decrementLevels,
    :setPendingBadConsequence, :applyPrize, :applyBadConsequence, :canMakeTreasureVisible,
    :howManyVisibleTreasures, :dielfNoTreasures, :giveMeATreasure, :canYouGiveMeATreasure,
    :haveStolen
end