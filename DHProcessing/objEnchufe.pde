class objEnchufe extends Objeto{  
   
  float sizeMesa = 0.2;
  float enchufeWidth = 2;
  float enchufeHeight = 2;
    
  public objEnchufe(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);    
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX*mult, posY*mult, sizeMesa*mult,sizeMesa*mult/2);
  }
  
  public String imprimir(){
    return "Enchufe" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
