# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'

class NumericBadConsequence < BadConsequence
  def initialize(p_text, p_levels, p_nVisible, p_nHidden)
    super(p_text, p_levels)
    if p_nHidden < @@MAXTREASURES
      @nHiddenTreasures = p_nHidden
    end
    if p_nVisible < @@MAXTREASURES
      @nVisibleTreasures = p_nVisible
    end
  end
  
  attr_reader :nHiddenTreasures, :nVisibleTreasures
  
  def adjustToFitTreasureLists(v, h)        
    if(!isEmpty())
        pn_vis = v.length
        pn_hid = h.length

        if pn_vis < @nVisibleTreasures
          pn_vis = @nVisibleTreasures
        end

        if pn_hid < @nHiddenTreasures
          pn_hid = @nHiddenTreasures
        end

        bad_ret= NumericBadConsequence(@text, @levels, pn_vis, pn_hid)

        return bad_ret
    end
    return self
  end
  
  def substractVisibleTreasure(t)
    if(@nVisibleTreasures > 0)
        @nVisibleTreasures - 1
    end
  end
  
  def substractHiddenTreasure(t)
    if(@nHiddenTreasures>  0)
        @nHiddenTreasures - 1
    end
  end
  
  def isEmpty
    return @nHiddenTreasures == 0 && @nVisibleTreasures == 0
  end
  
  def to_s
    "\n\nDescripcion: #{@text} \nPerderas niveles: #{@levels} \nPerderas tesoros visibles= #{@nVisibleTreasures} \nPerderas Tesoros ocultos: #{@nHiddenTreasures}"
  end
end