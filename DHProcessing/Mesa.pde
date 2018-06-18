class Mesa{  
  String name;
  float posX;
  float posY;
  float widthMesa;
  float heightMesa;
  
  public Mesa(String name, float posX, float posY, float widthMesa, float heightMesa){
    this.name = name;
    this.posX = posX;
    this.posY = posY;
    this.widthMesa = widthMesa;
    this.heightMesa = heightMesa;
  } 
  
  void draw(){
    rect(posX, posY, widthMesa, heightMesa);
  }
}
