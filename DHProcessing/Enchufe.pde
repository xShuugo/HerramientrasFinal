class Enchufe extends Objeto{  
   
  float sizeMesa = 0.2;
  float enchufeWidth = 2;
  float enchufeHeight = 2;
    
  public Enchufe(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);    
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX, posY, sizeMesa*50,sizeMesa*50/2);
  }
  
  public String imprimir(){
    return "Enchufe" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
