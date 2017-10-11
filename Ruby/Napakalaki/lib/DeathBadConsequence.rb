# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'NumericBadConsequence.rb'
require_relative 'Player.rb'

class DeathBadConsequence < NumericBadConsequence
  def initialize(p_text, p_death)
    super(p_text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES)
    @death = p_death
  end
  
  def isDead
    return @death
  end
  
  def to_s
    "\tDescripcion = #{@text} \n\tPerderas niveles: #{@levels} \n\tPerderas tesoros visibles: #{@nVisibleTreasures} \n\tPerderas Tesoros ocultos: #{@nHiddenTreasures} \n\tMoriras: #{@death}"
  end
end

