public class Objeto {  
  public String name;
  public float posX;
  public float posY; 
  public float angle;
  public boolean checkOver = false;

  public Objeto(String name, float posX, float posY, float angle) {
    this.name = name;
    this.posX = posX;
    this.posY = posY;   
    this.angle = angle;
  } 

  void draw() {
    if((MouseOver() || selectedObj == this) && state != ToolState.DRAWING) map.canvas.stroke(255);
    else map.canvas.noStroke();
  }

  public String imprimir() {
    return "";
  }

  PVector offset(){
    float d = PVector.dist(new PVector(posX*mult,posY*mult),map.cmouse);
    float a = degrees(atan2(
        posX-map.cmouse.x/mult, 
        posY-map.cmouse.y/mult));
    return new PVector(
      posX*mult+ d*sin(radians(-angle-a)),
      posY*mult+ d*cos(radians(-angle-a)));
  }

  boolean MouseOver() {
    return false;
  }

  void createProperties() {
    prop.addTextlabel("name").
      setText("Name:"). 
      setPosition(propBar.x, propBar.y+7).
      setColorValue(color(255, 255, 255));

    prop.addTextfield("txtName").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(130, pad*2).
      setAutoClear(false).
      setText(name);

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("pos").
      setText("Position:"). 
      setPosition(propBar.x, propBar.y+7).
      setColorValue(color(255, 255, 255));

    prop.addTextfield("txtposX").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(nf(posX, 0, 2)).
      setAutoClear(false);  
    prop.addTextfield("txtposY").
      setLabel("").
      setPosition(propBar.x+130+10+60, propBar.y).
      setSize(60, pad*2).
      setText(nf(posY, 0, 2)).
      setAutoClear(false);

    propBar = new PVector(propBar.x, propBar.y+pad*3); 

    prop.addTextlabel("angle").
      setText("Angle:"). 
      setPosition(propBar.x, propBar.y+7).
      setColorValue(color(255, 255, 255)); 

    prop.addTextfield("txtAngle").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(nf(angle, 0, 2)).
      setAutoClear(false);
  }

  void checkTextFields() {
  }
}

void txtName(String value) {
  selectedObj.name = trim(value);
}

void txtposX(String value) {
  selectedObj.posX = float(nf(float(value), 0, 2));
  selectedObj.posX = float(int(selectedObj.posX*100))/100;
}

void txtposY(String value) {
  selectedObj.posY = float(nf(float(value), 0, 2));
  selectedObj.posY = float(int(selectedObj.posY*100))/100;
}

void txtAngle(String value) {
  selectedObj.angle = float(nf(float(value), 0, 2));
  selectedObj.angle = float(int(selectedObj.angle*100))/100;
  //selectedObj.angle = float(value);
}
