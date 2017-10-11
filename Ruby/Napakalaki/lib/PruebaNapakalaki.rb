#encoding: utf-8

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "Prize.rb"
require_relative "Monster.rb"
require_relative "BadConsequence.rb"
require_relative "TreasureKind.rb"

  
class PruebaNapakalaki
  
  @@monsters = Array.new
  
  def self.level10
    array = []
    @@monsters.each do |monster|
      if(monster.combatLevel > 10)
        array << monster
      end
    end
    return array
  end
  
  def self.lostLevel
    array = []
    @@monsters.each do |monster|
      if(monster.bc.levels != 0 && monster.bc.nVisibleTreasures == 0 && monster.bc.nHiddenTreasures == 0)
        array << monster
      end
    end
    return array
  end
  
  def self.buenRollo
    array = []
    @@monsters.each do |monster|
      if(monster.prize.level > 1)
        array << monster
      end
    end
    return array
  end
  
  def self.lostSpecific(tr)
    array = []
    i = 0
    @@monsters.each do |monster|
      if(monster.bc.specificVisibleTreasures.size > 0)
        monster.bc.specificVisibleTreasures.each do |comp|
          if(comp == tr)
            array << monster
          end
        end
      end
      if(monster.bc.specificHiddenTreasures.size > 0)
        monster.bc.specificHiddenTreasures.each do |comp|
          if(comp == tr)
            array << monster
          end
        end
      end
      i = i +1
    end
    return array
  end
    
  #level10.each do |monster|
  #  puts monster.to_s
  #end
  
  #lostLevel.each do |monster|
  #  puts monster.to_s
  #end
  
  #buenRollo.each do |monster|
  #  puts monster.to_s
  #end
  
  lostSpecific(TreasureKind::HELMET).each do |monster|
    puts monster.to_s
  end
end
