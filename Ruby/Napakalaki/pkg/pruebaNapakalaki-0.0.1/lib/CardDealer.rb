#!/bin/env ruby
# encoding: utf-8

require 'singleton'
require_relative 'SpecificBadConsequence.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'Treasure.rb'
require_relative 'TreasureKind.rb'
require_relative 'Cultist.rb'

class CardDealer
  include Singleton
  
  def initialize
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
    @unusedMonsters = Array.new
    @usedMonsters = Array.new
    @unusedCultists = Array.new
    @usedCultists = Array.new
  end
      
  def initTreasureCardDeck
    @unusedTreasures.push Treasure.new('¡Si mi amo!', 4, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('Botas de investigacion', 3, TreasureKind::SHOES)
    @unusedTreasures.push Treasure.new('Capucha de Cthulhu', 3, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('A prueba de babas', 2, TreasureKind::ARMOR)
    @unusedTreasures.push Treasure.new('Botas de lluvia acida', 1, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Casco minero', 2, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('Ametralladora ACME', 4, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Camiseta de la ETSIIT', 1, TreasureKind::ARMOR)
    @unusedTreasures.push Treasure.new('Clavo de rail ferroviario', 3, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Cuchillo de sushi arcano', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Fez alopodo', 3, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('Hacha prehistorica', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('El aparato del PR. Tesla', 4, TreasureKind::ARMOR)
    @unusedTreasures.push Treasure.new('Gaita', 4, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Insecticida', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Escopeta de 3 cañones', 4, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Garabato mistico', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('La rebeca metalica', 2, TreasureKind::ARMOR)
    @unusedTreasures.push Treasure.new('Lanzallamas', 4, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Necro-comicón', 1, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Necronomicón', 5, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Linterna a 2 manos', 3, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Necro-gnomicón', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Necrotelecom', 2, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('Mazo de los antiguos', 3, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Necro-playboycón', 3, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Porra preternatural', 2, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Shogulador', 1, TreasureKind::BOTHHANDS)
    @unusedTreasures.push Treasure.new('Varita de atizamiento', 3, TreasureKind::ONEHAND)
    @unusedTreasures.push Treasure.new('Tentáculo de pega', 2, TreasureKind::HELMET)
    @unusedTreasures.push Treasure.new('Zapato deja-amigos', 1, TreasureKind::SHOES)
    
    shuffleTreasures    
  end
  
  def initMonsterCardDeck
=begin
    # Monstruo 1 -> Byakhees de bonanza
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Pierdes tu armadura visible y otra oculta', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    @unusedMonsters << Monster.newMonsterNoCultist('Byakhees de bonanza', 8, prize, bad_consequence)
    
    # Monstruo 2 -> Tenochtitlan
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Embobados con el lindo primigenio te descartas de tu casco visible.', 0, [TreasureKind::HELMET], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('Tenochtitlan', 2, prize, bad_consequence)

    # Monstruo 3 -> El sopor de dunwich
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Pierdes tu armadura visible y otra oculta.', 0, [TreasureKind::SHOES], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('El sopor de dunwich', 2, prize, bad_consequence)

    # Monstruo 4 -> DEMONIOS DE MAGALUF
    prize = Prize.new(4, 1)
    bad_consequence = SpecificBadConsequence.new('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta una mano visible y una mano oculta.', 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    @unusedMonsters<< Monster.newMonsterNoCultist('Demonios de Magaluf', 2, prize, bad_consequence)
=end
   # Monstruo 5 -> EL GORRON DEL UMBRAL
    prize = Prize.new(3, 1)
    bad_consequence = NumericBadConsequence.new('Pierdes todos tus tesoros visibles.', 0, 0, 0 )
    @unusedMonsters<< Monster.newMonsterNoCultist('Demonios de Magaluf', 2, prize, bad_consequence)

    # Monstruo 6 -> H.P Munchcraft
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Pierdes la armadura visible.', 0, [TreasureKind::ARMOR], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('H.P. Munchcraft', 6, prize, bad_consequence)

    # Monstruo 7 -> Necrofago
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Sientes bichos bajo la ropa. Descarta la armadura visible.', 0, [TreasureKind::ARMOR], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('Necrofago', 13, prize, bad_consequence)

    # Monstruo 8 -> El rey de rosado
    prize = Prize.new(3, 2)
    bad_consequence = NumericBadConsequence.new('Pierdes 5 niveles y 3 tesoros visibles.', 5, 3, 0)
    @unusedMonsters<< Monster.newMonsterNoCultist('El rey de rosado', 11, prize, bad_consequence)

    # Monstruo 9 -> FLECHER
    prize = Prize.new(1, 1)
    bad_consequence = NumericBadConsequence.new('Toses los pulmones y pierdes 2 niveles.', 2, 0, 0)
    @unusedMonsters<< Monster.newMonsterNoCultist('Flecher', 2, prize, bad_consequence)

    # Monstruo 10 -> Los hondos
    prize = Prize.new(2, 1)
    bad_consequence = DeathBadConsequence.new('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto', true)
    @unusedMonsters<< Monster.newMonsterNoCultist('Los hondos', 8, prize, bad_consequence)

    # Monstruo 11 -> Semillas Cthulhu
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new('Pierdes 2 niveles y 2 tesoros ocultos.', 2, 0, 2)
    @unusedMonsters<< Monster.newMonsterNoCultist('Semillas Cthulhu', 4, prize, bad_consequence)

    # Monstruo 12 -> Dameargo
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Te intentas escaquear. Pierdes una mano visible.', 0, [TreasureKind::ONEHAND], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('Dameargo', 1, prize, bad_consequence)

    # Monstruo 13 -> Pollipólipo volante
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new('Da mucho asquito. Pierdes 3 niveles.', 3, 0, 0)
    @unusedMonsters<< Monster.newMonsterNoCultist('Pollipólipo volante', 3, prize, bad_consequence)

    # Monstruo 14 -> Yskhtihyssg-Goth
    prize = Prize.new(3, 1)
    bad_consequence = DeathBadConsequence.new('No le hace gracia que pronuncien mal su nombre. Estas muerto', true)
    @unusedMonsters<< Monster.newMonsterNoCultist('Yskhtihyssg-Goth', 14, prize, bad_consequence)

    # Monstruo 15 -> Familia feliz
    prize = Prize.new(3, 1)
    bad_consequence = DeathBadConsequence.new('La familia te atrapa. Estás muerto.', true)
    @unusedMonsters<< Monster.newMonsterNoCultist('Familia feliz', 1, prize, bad_consequence)

    # Monstruo 16 -> Roboggoth
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('Roboggoth', 8, prize, bad_consequence)

    # Monstruo 17 -> El espía sordo
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Te asusta en la noche. Pierdes un casco visible.', 0, [TreasureKind::HELMET], Array.new)
    @unusedMonsters<< Monster.newMonsterNoCultist('El espía sordo', 5, prize, bad_consequence)

    # Monstruo 18 -> Tongue
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.', 2, 5, 0)
    @unusedMonsters<< Monster.newMonsterNoCultist('Tongue', 19, prize, bad_consequence)

     # Monstruo 19 -> Bicefalo
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.', 3, [TreasureKind::ONEHAND], [TreasureKind::BOTHHANDS])
    @unusedMonsters<< Monster.newMonsterNoCultist('Bicefalo', 21, prize, bad_consequence)
    
    #SECTARIOS (modificar, despues de hacer herencia)
    #sec1
    prize = Prize.new(3, 1)
    bad_consequence = SpecificBadConsequence.new("Pierdes 1 mano visible.", 0, [TreasureKind::ONEHAND], Array.new)
    @unusedMonsters << Monster.newMonsterCultist("El mal indecible impronunciable", 10, prize, bad_consequence, -2)
        
    #sec2        
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new("Pierdes tus tesoros visibles. Jajaja.", 0, BadConsequence.MAXTREASURES, 0)
    @unusedMonsters << Monster.newMonsterCultist("Testigos oculares", 6, prize, bad_consequence, 2)
        
    #sec3       
    prize = Prize.new(2, 5)
    bad_consequence = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres.", true)
    @unusedMonsters << Monster.newMonsterCultist("El gran cthulhu", 20, prize, bad_consequence, 4)
    
    #sec4      
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new("Tu gobierno te recorta 2 niveles", 2, 0, 0)
    @unusedMonsters << Monster.newMonsterCultist("Serpiente político", 8, prize, bad_consequence, -2)
        
    #sec5
    prize = Prize.new(1, 1)
    bad_consequence = NumericBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas.", 2, 0, 0)
    @unusedMonsters << Monster.newMonsterCultist("Felpuggoth", 2, prize, bad_consequence, -2)
    
    shuffleMonsters
  end
  
  def initCultistCardDeck
    #Cultist 1
    @unusedCultists << Cultist.new("Sectario", 1)
    
    #Cultist 2
    @unusedCultists << Cultist.new("Sectario", 2)
    
    #Cultist 3
    @unusedCultists << Cultist.new("Sectario", 1)
    
    #Cultist 4
    @unusedCultists << Cultist.new("Sectario", 2)
    
    #Cultist 5
    @unusedCultists << Cultist.new("Sectario", 1)
    
    #Cultist 6
    @unusedCultists << Cultist.new("Sectario", 1)
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle
  end
  
  def shuffleCultists
    @unusedCultists.shuffle
  end
  
  def nextTreasure
    if !@unusedTreasures.empty?
      devolver = @unusedTreasures[0]
      @unusedTreasures.delete(devolver)

      return devolver
    end

    @unusedTreasures = @usedTreasures
    @usedTreasures.clear
    shuffleTreasures
    devolver = @unusedTreasures[0]
    @unusedTreasures.delete(devolver)

    return devolver
  end
  
  def nextCultist
    if !@unusedCultists.empty?
      devolver = @unusedCultists[0]
      @unusedCultists.delete(devolver)

      return devolver
    end

    @unusedCultists = @usedCultists
    @usedCultist.clear
    shuffleCultists
    devolver = @unusedCultists[0]
    @unusedCultists.delete(devolver)

    return devolver
  end
  
  def nextMonster
    if !@unusedMonsters.empty?
      devolver = @unusedMonsters[0]
      @unusedMonsters.delete(devolver)

      return devolver
    end

    @unusedMonsters = @usedMonsters
    @usedMonsters.clear
    shuffleMonsters
    devolver = @unusedMonsters[0]
    @unusedMonsters.delete(devolver)

    return devolver
  end
  
  def giveTreasureBack(tesoro)
    @usedTreasures << tesoro
  end
  
  def giveMonsterBack(monstruo)
    @usedMonsters << monstruo
  end
  
  def initCards
    initTreasureCardDeck
    initMonsterCardDeck
    initCultistCardDeck
  end
  
  private :initTreasureCardDeck, :initMonsterCardDeck, :initCultistCardDeck, :shuffleTreasures, :shuffleMonsters, :shuffleCultists

end
