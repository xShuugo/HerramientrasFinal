class Cajafuerte extends Objeto{  
   
  float sizeMesa = 0.5;
  String password = "";
  boolean isOnTable;
  String contenido;
  
    
  public Cajafuerte(String name, float posX, float posY, float angle, String password, String contenido, boolean isOnTable){
    super(name, posX, posY, angle);    
    this.password = password;
    this.contenido = contenido;
    this.isOnTable = isOnTable;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    
    if(isOnTable == false){      
      map.canvas.rect(posX-(sizeMesa*50/2), posY-(sizeMesa*50/2), sizeMesa*50,sizeMesa*50);
    } else if(isOnTable){      
      map.canvas.rect(posX-25, posY-25, 50, 50);
      map.canvas.rect(posX-(sizeMesa*50/2), posY-(sizeMesa*50/2), sizeMesa*50,sizeMesa*50);
    }
  }

  public String imprimir(){
    return "Cajafuerte" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + password + "|" + contenido + "|" + isOnTable + "/";      
  }         
}
