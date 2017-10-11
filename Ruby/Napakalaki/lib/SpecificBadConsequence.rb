# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'

class SpecificBadConsequence < BadConsequence
  def initialize(p_text, p_levels, tVisible, tHidden)
    super(p_text, p_levels)
    @specificHiddenTreasures= tHidden
    @specificVisibleTreasures= tVisible
  end
  
  attr_reader :specificHiddenTreasures, :specificVisibleTreasures
  
  def adjustToFitTreasureLists(v, h)
    if(!isEmpty)
      sp_v = Array.new
      sp_h = Array.new
      insertado=false
      
      @specificVisibleTreasures.each do |spvi|
        insertado= false
        v.each do |spvp|
          if(!insertado)
            if(spvi==spvp.type)
              if(!sp_v.contains(spvi))
                sp_v << spvi
                insertado=true
              end
            end
          end
        end
      end

      @specificHiddenTreasures.each do |sphi|
        insertado = false
        h.each do |sphp|
          if(!insertado)
            if(sphi==sphp.type)
              if(!sp_h.include?(sphi))
                sp_h << sphi
                insertado = true
              end
            end
          end
        end
      end
      bad_ret = SpecificBadConsequence.new(@text, @levels, sp_v, sp_h);
      return bad_ret
    end
    return self
  end
  
  def substractVisibleTreasure(t)
    if(!@specificVisibleTreasures.empty?)
      @specificVisibleTreasures.delete(t.type)
    end
  end
  
  def substractHiddenTreasure(t)
    if(!@specificHiddenTreasures.empty?)
      @specificHiddenTreasures.delete(t.type)
    end
  end
  
  def isEmpty
    return @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?
  end
  
  def to_s
    "\tDescripcion: #{@text} \n\tPerderas niveles: #{@levels} \n\tPerderas estos tesoros especificos visibles: #{@specificVisibleTreasures} \n\tPerderas estos tesoros especificos ocultos: #{@specificHiddenTreasures}"
  end
end
