# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'TreasureKind.rb'

class Treasure
  def initialize(n, bonus, t)
    @name = n
    @bonus = bonus
    @type = t
  end
  
  def to_s
    "#{@name}
    \tBonus = #{@bonus}
    \tTipo de tesoro = #{@type}"
  end
  
  attr_reader :name, :bonus, :type
end
