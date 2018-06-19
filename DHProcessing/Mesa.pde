class Mesa extends Objeto{  
   
  float sizeMesa = 1;
    
  public Mesa(String name, float posX, float posY, float angle){
    super(name, posX, posY, angle);    
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX-(sizeMesa*50/2), posY-(sizeMesa*50/2), sizeMesa*50,sizeMesa*50);
  }

  public String imprimir(){
    return "Mesa" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";      
  }         
}
