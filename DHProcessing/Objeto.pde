public class Objeto{  
  public String name;
  public float posX;
  public float posY; 
  public float angle;
  public float check;
  
  public Objeto(String name, float posX, float posY, float angle){
    this.name = name;
    this.posX = posX;
    this.posY = posY;   
    this.angle = angle; 
  } 

  // public Objeto(){
  //   this.name = "newObj";
  //   this.posX = 0;
  //   this.posY = 0;   
  //   this.angle = 0; 
  // }
  
  void draw(){
  }
  
  public String imprimir(){
    return "";    
  }

  
  boolean MouseOver(){
    if(PVector.dist(new PVector(posX*mult,posY*mult),new PVector(map.cmouse.x,map.cmouse.y))<check/2) return true;
    else return false;
  }
}
