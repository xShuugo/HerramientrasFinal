class objMesa extends Objeto{  
   
  float sizeMesa = 1;
    
  public objMesa(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);    
  } 
  
  void draw(){
    map.canvas.noStroke();
    map.canvas.fill(99,83,52);
    map.canvas.rect(posX*mult-(sizeMesa*mult/2), posY*mult-(sizeMesa*mult/2), sizeMesa*mult,sizeMesa*mult);
  }

  public String imprimir(){
    return "Mesa" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
