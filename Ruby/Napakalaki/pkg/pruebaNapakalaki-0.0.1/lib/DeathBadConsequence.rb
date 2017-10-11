# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'NumericBadConsequence.rb'
require_relative 'Player.rb'

class DeathBadConsequence < BadConsequence
  def initialize(p_text, p_death)
    NumericBadConsequence.new(p_text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES)
    @death = p_death
  end
  
  def isDead
    return @death
  end
  
  def to_s
    puts "\nDescripcion = #{@text} \nPerderas niveles: #{@levels} \nPerderas tesoros visibles: #{@nVisibleTreasures} \nPerderas Tesoros ocultos: #{@nHiddenTreasures} \nMoriras: #{@death}"
  end
end

