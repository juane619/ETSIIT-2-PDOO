/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author adriii
 */
public class CardDealer {
    private static final CardDealer instance= new CardDealer();
    
    private ArrayList<Treasure> unusedTreasures=new ArrayList();
    private ArrayList<Treasure> usedTreasures=new ArrayList();
    private ArrayList<Monster> unusedMonster=new ArrayList();
    private ArrayList<Monster> usedMonster=new ArrayList();
    private ArrayList<Cultist> unusedCultists= new ArrayList();
    
    private CardDealer() {}
    
    
    private void initTreasureCardDeck(){
        unusedTreasures.add(new Treasure("¡Si mi amo!", 4, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Botas de investigacion", 3, TreasureKind.SHOES));
        unusedTreasures.add(new Treasure("Capucha de Cthulhu", 3, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("A prueba de babas", 2, TreasureKind.ARMOR));
        /*unusedTreasures.add(new Treasure("Botas de lluvia acida", 1, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Casco minero", 2, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Ametralladora ACME", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Camiseta de la ETSIIT", 1, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Clavo de rail ferroviario", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Cuchillo de sushi arcano", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Fez alopodo", 3, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Hacha prehistorica", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("El aparato del PR. Tesla", 4, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Gaita", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Insecticida", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Escopeta de 3 cañones", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Garabato mistico", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("La rebeca metalica", 2, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Lanzallamas", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-comicón", 1, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necronomicón", 5, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Linterna a 2 manos", 3, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-gnomicón", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necrotelecom", 2, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Mazo de los antiguos", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necro-playboycón", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Porra preternatural", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Shogulador", 1, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Varita de atizamiento", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Tentáculo de pega", 2, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Zapato deja-amigos", 1, TreasureKind.SHOES));
        */
        shuffleTreasures();
    }
    
    private void initMonsterCardDeck(){
        //TENOCHTITLAN
        Prize pz1=new Prize(1, 1);
        ArrayList <TreasureKind> tr_vis1= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid1= new ArrayList<TreasureKind>();
        tr_vis1.add(TreasureKind.HELMET);
        BadConsequence bc1= new SpecificBadConsequence("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, tr_vis1, tr_hid1);
        Monster m1= new Monster("Tenochtitlan", 2, bc1, pz1);
        unusedMonster.add(m1);
        
        //BYAKHEES DE BONANZA
        ArrayList <TreasureKind> tr_vis2= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid2= new ArrayList<TreasureKind>();
        tr_vis2.add(TreasureKind.ARMOR);
        tr_hid2.add(TreasureKind.ARMOR);
        Prize pz2=new Prize(2, 1);
        BadConsequence bc2= new SpecificBadConsequence("Pierdes tu armadura visible y otra oculta.", 0, tr_vis2, tr_hid2);
        Monster m2= new Monster("Byakhees de bonanza", 8, bc2, pz2);
        unusedMonster.add(m2);
        
        //EL SOPOR DE DUNWICH
        ArrayList <TreasureKind> tr_vis3= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid3= new ArrayList<TreasureKind>();
        tr_vis3.add(TreasureKind.SHOES);
        Prize pz3=new Prize(1, 1);
        BadConsequence bc3= new SpecificBadConsequence("Pierdes tu armadura visible y otra oculta.", 0, tr_vis3, tr_hid3);
        Monster m3= new Monster("El sopor de Dunwich", 2, bc3, pz3);
        unusedMonster.add(m3);
        
        //DEMONIOS DE MAGALUF
        ArrayList <TreasureKind> tr_vis4= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid4= new ArrayList<TreasureKind>();
        tr_vis4.add(TreasureKind.ONEHAND);
        tr_hid4.add(TreasureKind.ONEHAND);
        Prize pz4=new Prize(4, 1);
        BadConsequence bc4= new SpecificBadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta una mano visible y una mano oculta.", 0, tr_vis4, tr_hid4);
        Monster m4= new Monster("Demonios de Magaluf", 2, bc4, pz4);
        unusedMonster.add(m4);
        
        //EL GORRON EN EL UMBRAL
        Prize pz5=new Prize(3, 1);
        BadConsequence bc5= new NumericBadConsequence("Pierdes todos tus tesoros visibles.", 0, BadConsequence.MAXTREASURES, 0);
        Monster m5= new Monster("El gorron en el umbral", 13, bc5, pz5);
        unusedMonster.add(m5);
        
        //H.P Munchcraft
        ArrayList <TreasureKind> tr_vis6= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid6= new ArrayList<TreasureKind>();
        tr_vis6.add(TreasureKind.ARMOR);
        Prize pz6=new Prize(2, 1);
        BadConsequence bc6= new SpecificBadConsequence("Pierdes la armadura visible.", 0, tr_vis6, tr_hid6);
        Monster m6= new Monster("H.P. Munchcraft", 6, bc6, pz6);
        unusedMonster.add(m6);
        
        //Necrofago
        ArrayList <TreasureKind> tr_vis7= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid7= new ArrayList<TreasureKind>();
        tr_vis7.add(TreasureKind.ARMOR);
        Prize pz7=new Prize(1, 1);
        BadConsequence bc7= new SpecificBadConsequence("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, tr_vis7, tr_hid7);
        Monster m7= new Monster("Necrofago", 13, bc7, pz7);
        unusedMonster.add(m7);
        
        //El rey de rosado
        Prize pz8=new Prize(3, 2);
        BadConsequence bc8= new NumericBadConsequence("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0);
        Monster m8= new Monster("El rey de rosado", 11, bc8, pz8);
        unusedMonster.add(m8);
        
        //Flecher
        Prize pz9=new Prize(1, 1);
        BadConsequence bc9= new NumericBadConsequence("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0);
        Monster m9= new Monster("Flecher", 2, bc9, pz9);
        unusedMonster.add(m9);
        
        //Los hondos
        BadConsequence bc10 = new DeathBadConsequence("Estos monstruos resultan bastante artificiales y te aburren mortalmente. Estas muerto", true);
        Prize pz10 = new Prize(2, 1);
        Monster m10 = new Monster("Los hondos", 8, bc10, pz10);
        unusedMonster.add(m10);
        
        //Semillas Cthulhu
        BadConsequence bc11 = new NumericBadConsequence("Pierdes 2 niveles y 2 tesoros ocultos", 2, 0, 2);
        Prize pz11 = new Prize(2, 1);
        Monster m11 = new Monster("Semillas Cthulhu", 4, bc11, pz11);
        unusedMonster.add(m11);
        
        //Dameargo
        ArrayList<TreasureKind> tr_vis10 = new ArrayList();
        ArrayList<TreasureKind> tr_hid10 = new ArrayList();
        tr_vis10.add(TreasureKind.ONEHAND);
        BadConsequence bc12 = new SpecificBadConsequence("Te intentas escaquear. Pierdes una mano visible.", 0, tr_vis10, tr_hid10);
        Prize pz12 = new Prize(2, 1);
        Monster m12 = new Monster("Dameargo", 1, bc12, pz12);
        unusedMonster.add(m12);
        
        //Pollipolipo volante
        BadConsequence bc13 = new NumericBadConsequence("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0);
        Prize pz13 = new Prize(2, 1);
        Monster m13 = new Monster("Pollipolipo volante", 3, bc13, pz13);
        unusedMonster.add(m13);
        
        //YskhtihyssgGoth
        BadConsequence bc14 = new DeathBadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto", true);
        Prize pz14 = new Prize(3, 1);
        Monster m14 = new Monster("YskhtihyssgGoth", 14, bc14, pz14);
        unusedMonster.add(m14);
        
        //Familia feliz
        BadConsequence bc15 = new DeathBadConsequence("La familia te atrapa. Estas muerto", true);
        Prize pz15 = new Prize(3, 1);
        Monster m15 = new Monster("Familia feliz", 1, bc15, pz15);
        unusedMonster.add(m15);
        
        //Roboggoth
        ArrayList<TreasureKind> tr_vis16 = new ArrayList();
        ArrayList<TreasureKind> tr_hid16 = new ArrayList();
        tr_vis16.add(TreasureKind.BOTHHANDS);
        BadConsequence bc16 = new SpecificBadConsequence("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible",2, tr_vis16, tr_hid16);
        Prize pz16 = new Prize(2, 1);
        Monster m16 = new Monster("Roboggoth", 8, bc16, pz16);
        unusedMonster.add(m16);
        
        //El espia sordo
        ArrayList<TreasureKind> tr_vis17 = new ArrayList();
        ArrayList<TreasureKind> tr_hid17 = new ArrayList();
        tr_vis17.add(TreasureKind.HELMET);
        BadConsequence bc17 = new SpecificBadConsequence("Te asusta en la noche. Pierdes un casco visible", 0, tr_vis17, tr_hid17);
        Prize pz17 = new Prize(1, 1);
        Monster m17 = new Monster("El espía sordo", 5, bc17, pz17);
        unusedMonster.add(m17);
        
        //Tongue
        BadConsequence bc18 = new NumericBadConsequence("Menudo susto te llevas. Pierdes 2 niveles y cinco tesoros visibles.", 2, 5, 0);
        Prize pz18 = new Prize(2, 1);
        Monster m18 = new Monster("Tongle", 19, bc18, pz18);
        unusedMonster.add(m18);
        
        //Bicefalo
        ArrayList <TreasureKind> tr_vis19= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid19= new ArrayList<TreasureKind>();
        tr_vis19.add(TreasureKind.ONEHAND);
        tr_vis19.add(TreasureKind.BOTHHANDS);
        Prize pz19=new Prize(2, 1);
        BadConsequence bc19= new SpecificBadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, tr_vis19, tr_hid19);
        Monster m19= new Monster("Bicefalo", 21, bc19, pz19);
        unusedMonster.add(m19);
        
        //SECTARIOS
        //sec1
        ArrayList <TreasureKind> tr_vis_sec1= new ArrayList<TreasureKind>();
        ArrayList <TreasureKind> tr_hid_sec1= new ArrayList<TreasureKind>();
        tr_vis_sec1.add(TreasureKind.ONEHAND);
        Prize pz_sec1=new Prize(3, 1);
        BadConsequence bc_sec_1= new SpecificBadConsequence("Pierdes 1 mano visible.", 0, tr_vis_sec1, tr_hid_sec1);
        Monster m_sec_1= new Monster("El mal indecible impronunciable", 10, bc_sec_1, pz_sec1, -2);
        unusedMonster.add(m_sec_1);
        
        //sec2        
        Prize pz_sec2=new Prize(2, 1);
        BadConsequence bc_sec_2= new NumericBadConsequence("Pierdes tus tesoros visibles. Jajaja.", 0, BadConsequence.MAXTREASURES, 0);
        Monster m_sec_2= new Monster("Testigos oculares", 6, bc_sec_2, pz_sec2, 2);
        unusedMonster.add(m_sec_2);
        
        //sec3       
        Prize pz_sec3=new Prize(2, 5);
        BadConsequence bc_sec_3= new DeathBadConsequence("Hoy no es tu dia de suerte. Mueres.", true);
        Monster m_sec_3= new Monster("El gran cthulhu", 20, bc_sec_3, pz_sec3, 4);
        unusedMonster.add(m_sec_3);
        
        //sec4      
        Prize pz_sec4=new Prize(2, 1);
        BadConsequence bc_sec_4= new NumericBadConsequence("Tu gobierno te recorta 2 niveles", 2, 0, 0);
        Monster m_sec_4= new Monster("Serpiente político", 8, bc_sec_4, pz_sec4, -2);
        unusedMonster.add(m_sec_3);
        
        //FALTAN MONSTRUOS ADRI
        shuffleMonster();
    }
    
    private void initCultistCardDeck(){
        Cultist sec1= new Cultist("Sectario", 1);
        unusedCultists.add(sec1);
        
        Cultist sec2= new Cultist("Sectario", 2);
        unusedCultists.add(sec2);
        
        Cultist sec3= new Cultist("Sectario", 1);
        unusedCultists.add(sec3);
        
        Cultist sec4= new Cultist("Sectario", 2);
        unusedCultists.add(sec4);
        
        Cultist sec5= new Cultist("Sectario", 1);
        unusedCultists.add(sec5);
        
        Cultist sec6= new Cultist("Sectario", 1);
        unusedCultists.add(sec6);
        
        shuffleCultist();
    }
    
    private void shuffleTreasures(){
        Collections.shuffle(unusedTreasures);
    }
    
    private void shuffleMonster(){
        Collections.shuffle(unusedMonster);
    }
    
    private void shuffleCultist(){
        Collections.shuffle(unusedCultists);
    }
    
    
    public static CardDealer getInstance() {
        return instance;
    }
    
    public Treasure nextTreasure(){
        Treasure devolver;
       
        if(unusedTreasures.isEmpty()){
            unusedTreasures= usedTreasures;
            usedTreasures= new ArrayList();
            shuffleTreasures();
        }
        
        devolver = unusedTreasures.get(0);
        unusedTreasures.remove(0);
        usedTreasures.add(devolver);
        return devolver;
    }
    
    public Monster nextMonster(){
        Monster devolver;
         
        if(unusedMonster.isEmpty()){
            unusedMonster = usedMonster;
            usedMonster= new ArrayList();
            shuffleMonster();
        }
        
        devolver = unusedMonster.get(0);
        unusedMonster.remove(0);
        
        return devolver;
    }
    
    public Cultist nextCultist(){
        
        
        Cultist m = unusedCultists.get(0);
        
        unusedCultists.remove(m);
        
        return m;
    }
    
    public void giveTreasuresBack(Treasure t){
        usedTreasures.add(t);
    }
    
    public void giveMonsterBack(Monster m){
        usedMonster.add(m);
    }
    
    public void initCards(){
        initTreasureCardDeck();
        initMonsterCardDeck();
        initCultistCardDeck();
    }
}
