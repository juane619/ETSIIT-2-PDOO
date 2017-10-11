# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8

class Prize
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  attr_reader :treasures, :level

  def to_s
    "Tesoros ganados: #{@treasures} \n  Niveles ganados: #{@level}"
  end
  
end
