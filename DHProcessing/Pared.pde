class Pared extends Objeto{  
   
  float paredHeight = 3;
  float paredWidth = 4;
  float paredDepth = 0.5;
    
  public Pared(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);     
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX - (paredWidth*50/2), posY-(paredWidth*50/2), paredWidth*50, paredDepth*50);
  }

  public String imprimir(){
    return "Pared" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
