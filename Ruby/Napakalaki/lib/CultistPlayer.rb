# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "Player.rb"

class CultistPlayer < Player
  
  @@totalCultistPlayers = 0
  
  def initialize(player, cultist)
    super(player.name)
    @myCultistCard = cultist
    Player.copyPlayer(player)    
    @@totalCultistPlayers += 1
  end
  
  def getOponentLevel(monster)
    monster.getCombatLevelAgainstCultistPlayer
  end

  def getCombatLevel
    combat_level = super
    return combat_level.to_i + (70*combat_level.to_i/100) + @myCultistCard.getGainedLevels * @@totalCultistPlayers
  end

  def shouldConvert
    return false
  end
  
  def giveMeATreasure
    devolver = @n_cultist.getVisibleTreasures
    return devolver[rand(devolver.length)]
  end
  
  def canYouGiveMeATreasure
    return @n_cultist.enemy.visibleTreasures.length > 0
  end
  
  def getTotalCultistPlayers
    return @@totalCultistPlayers
  end
end
