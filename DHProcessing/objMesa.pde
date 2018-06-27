class objMesa extends Objeto {  

  float size = 1;

  public objMesa(String name, float posX, float posY, float angle) {
    super(name, posX, posY, angle);
  } 

  void draw() {
    super.draw();
    
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.fill(99, 83, 52);
    map.canvas.rect(0, 0, size*mult, size*mult);
    map.canvas.popMatrix();
  }

  boolean MouseOver() {
    if (offset().x/mult > posX-size/2 &&
        offset().x/mult < posX+size/2 &&
        offset().y/mult > posY-size/2 &&
        offset().y/mult < posY+size/2){
      super.checkOver = true;
      return true;
    }
    super.checkOver = false;
    return false;
  }

  public String imprimir() {
    return "Mesa" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";
  }
}
