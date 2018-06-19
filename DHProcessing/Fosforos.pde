class Fosforos extends Objeto{  
   
  float sizeMesa = 0.2;
  float cantidadFos = 0;
    
  public Fosforos(String name, float posX, float posY, float angle, float cantidadFos){
    super(name, posX, posY, angle);  
    this.cantidadFos = cantidadFos;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX-(sizeMesa*50/2), posY-(sizeMesa*50/2), sizeMesa*50,sizeMesa*50);
  }

  public String imprimir(){
    return "Fosforos" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cantidadFos +"/";      
  }         
}
