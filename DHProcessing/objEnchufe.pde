class objEnchufe extends Objeto {  

  float size = 0.2;

  public objEnchufe(String name, float posX, float posY, float angle) {
    super(name, posX, posY, angle);
  } 

  void draw() {
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(66, 192, 255);
    map.canvas.rect(0, 0, size*mult, size*mult/2);
    super.check = size*mult*1.5;
    map.canvas.popMatrix();
    super.draw();
  }

  public String imprimir() {
    return "Enchufe" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";
  }
}
