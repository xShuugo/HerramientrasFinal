class Mesa{  
  String name;
  float posX;
  float posY;
  float sizeMesa = 10;
  float angle;
  
  public Mesa(String name, float posX, float posY, float angle){
    this.name = name;
    this.posX = posX;
    this.posY = posY;   
    this.angle = angle; 
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX, posY, sizeMesa,sizeMesa);
  }

  String mesaString(){
    return "Mesa" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";     
  }   
}
