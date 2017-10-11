# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8

class Monster
  def initialize(name, combatLevel, prize, bc, lc)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @bc = bc
    @levelChangeAgainstCultistPlayer = lc
  end
  
  def self.newMonsterNoCultist(aname, acombatLevel, aprize, abc)
    new(aname, acombatLevel, aprize, abc, 0)
  end
  
  def self.newMonsterCultist(aname, acombatLevel, aprize, abc, alc)
    new(aname, acombatLevel, aprize, abc, alc)
  end
  
  attr_reader :name, :combatLevel, :bc, :levelChangeAgainstCultistPlayer
  
  def to_s
    "\nName = #{@name} \nCombatLevel = #{@combatLevel} \nPrize: \n  #{@prize.to_s} \nBadConsequence: \n  #{@bc.to_s}"
  end
  
  def getLevelsGained
    return @prize.level
  end
  
  def getTreasuresGained
    return @prize.treasures
  end
  
  def getCombatLevelAgainstCultistPlayer
    return @combatLevel + @levelChangeAgainstCultistPlayer
  end
  
end
