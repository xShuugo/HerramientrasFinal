class Nota extends Objeto{  
   
  float sizeMesa = 0.3;
  String contenido = "";
    
  public Nota(String name, float posX, float posY, float angle, String contenido){
    super(name, posX, posY, angle); 
    this.contenido = contenido;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX-(sizeMesa*50/2), posY-(sizeMesa*50/2), 0.4*50, 0.6*50);
  }

  public String imprimir(){
    return "Nota" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + contenido + "/";      
  }         
}
