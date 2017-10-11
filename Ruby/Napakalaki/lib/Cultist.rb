# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Cultist
  def initialize(p_name, p_gained_levels)
    @name = p_name
    @gainedLevels = p_gained_levels
  end
  
  def getGainedLevels
    return @gainedLevels
  end
end
