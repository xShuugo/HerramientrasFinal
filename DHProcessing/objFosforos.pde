class objFosforos extends Objeto{  
   
  float sizeMesa = 0.2;
  float cantidadFos = 0;
    
  public objFosforos(String name, float posX, float posY, float angle, float cantidadFos){
    super(name, posX, posY, angle);  
    this.cantidadFos = cantidadFos;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX*mult-(sizeMesa*mult/2), posY*mult-(sizeMesa*mult/2), sizeMesa*mult,sizeMesa*mult);
  }

  public String imprimir(){
    return "Fosforos"+ "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cantidadFos +"/";      
  }         
}
