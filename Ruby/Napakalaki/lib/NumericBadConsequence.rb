# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'

class NumericBadConsequence < BadConsequence
  def initialize(p_text, p_levels, p_nVisible, p_nHidden)
    super(p_text, p_levels)
    if p_nHidden < @@MAXTREASURES
      @nHiddenTreasures = p_nHidden.to_i
    end
    if p_nVisible < @@MAXTREASURES
      @nVisibleTreasures = p_nVisible.to_i
    end
  end
  
  attr_reader :nHiddenTreasures, :nVisibleTreasures
  
  def adjustToFitTreasureLists(v, h)        
    if(!isEmpty())
        pn_vis = v.length
        pn_hid = h.length

        pn_vis = @nVisibleTreasures.to_i if pn_vis > @nVisibleTreasures.to_i

        pn_hid = @nHiddenTreasures.to_i if pn_hid > @nHiddenTreasures.to_i

        bad_ret= NumericBadConsequence.new(@text, @levels, pn_vis, pn_hid)

        return bad_ret
    end
    return self
  end
  
  def substractVisibleTreasure(t)
    @nVisibleTreasures -= 1 if (@nVisibleTreasures > 0)
  end
  
  def substractHiddenTreasure(t)
    @nHiddenTreasures -= 1 if (@nHiddenTreasures>  0)
  end
  
  def isEmpty
    return @nHiddenTreasures == 0 && @nVisibleTreasures == 0
  end
  
  def to_s
    "\tDescripcion: #{@text} \n\tPerderas niveles: #{@levels} \n\tPerderas tesoros visibles= #{@nVisibleTreasures} \n\tPerderas Tesoros ocultos: #{@nHiddenTreasures}"
  end
end