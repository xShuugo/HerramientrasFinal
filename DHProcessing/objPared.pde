class objPared extends Objeto{  
   
  float paredWidth = 4;
  float paredDepth = 0.5;
    
  public objPared(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);     
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(255);
    map.canvas.rect(0,0, paredWidth*mult, paredDepth*mult);
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Pared" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
