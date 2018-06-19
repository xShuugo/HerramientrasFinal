class objPared extends Objeto{  
   
  float paredWidth = 4;
  float paredDepth = 0.5;
    
  public objPared(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);     
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX*mult - (paredWidth*mult/2), posY*mult-(paredDepth*mult/2), paredWidth*mult, paredDepth*mult);
  }

  public String imprimir(){
    return "Pared" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
