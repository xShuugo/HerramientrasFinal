class objCajafuerte extends Objeto{  
   
  float sizeMesa = 0.5;
  String password = "";
  boolean isOnTable;
  String contenido;
  
    
  public objCajafuerte(String name, float posX, float posY, float angle, String password, String contenido, boolean isOnTable){
    super(name, posX, posY, angle);    
    this.password = password;
    this.contenido = contenido;
    this.isOnTable = isOnTable;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    
    if(isOnTable) map.canvas.rect(posX*mult-(mult/2), posY*mult-(mult/2), mult, mult);   

    map.canvas.rect(posX*mult-(sizeMesa*mult/2), posY*mult-(sizeMesa*mult/2), sizeMesa*mult,sizeMesa*mult);    
  }

  public String imprimir(){
    return "Cajafuerte" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + password + "|" + contenido + "|" + isOnTable + "/";      
  }         
}
