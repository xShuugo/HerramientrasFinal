class objMesa extends Objeto{  
   
  float size = 1;
    
  public objMesa(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);    
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(99,83,52);
    map.canvas.rect(0,0, size*mult,size*mult);
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Mesa" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }
  
  boolean MouseOver(){
    if(map.cmouse.x/mult < posX+size/2 &&
       map.cmouse.x/mult > posX-size/2 &&
       map.cmouse.y/mult < posY+size/2 &&
       map.cmouse.y/mult > posY-size/2) return true;
    else return false;
  }
}
