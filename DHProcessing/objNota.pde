class objNota extends Objeto{  
   
  float sizeMesa = 0.3;
  String contenido = "[Sin Contenido]";
    
  public objNota(String name, float posX, float posY, float angle, String contenido){
    super(name, posX, posY, angle); 
    this.contenido = contenido;
  } 
  
  void draw(){
    map.canvas.noStroke();
    map.canvas.fill(255,225,91);
    map.canvas.rect(posX*mult-(sizeMesa*mult/2), posY*mult-(sizeMesa*mult/2), 0.4*mult, 0.6*mult);
  }

  public String imprimir(){
    return "Nota" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + contenido + "/";      
  }         
}
