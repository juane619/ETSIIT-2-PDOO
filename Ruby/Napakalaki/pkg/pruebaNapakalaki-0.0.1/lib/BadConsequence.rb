# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8

require_relative 'Treasure.rb'

class BadConsequence
  @@MAXTREASURES = 10
  
  def initialize(p_text, p_lev)
    @text = p_text
    @levels = p_lev
  end
  
  def self.MAXTREASURES
    return @@MAXTREASURES
  end
  
  attr_reader :text, :levels
end
