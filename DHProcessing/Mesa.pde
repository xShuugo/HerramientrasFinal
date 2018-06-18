class Mesa{  
  String name;
  float posX;
  float posY;
  float sizeMesa = 10;
  
  public Mesa(String name, float posX, float posY){
    this.name = name;
    this.posX = posX;
    this.posY = posY;
  } 
  
  void draw(){
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    map.canvas.rect(posX, posY, sizeMesa,sizeMesa);
  }
}
