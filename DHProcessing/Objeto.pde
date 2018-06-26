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
  
  void draw(){
  if(MouseOver() || selectedObj == this)
    SelectedOverLay();  
  }
  
  public String imprimir(){
    return "";    
  }

  void SelectedOverLay(){
    map.canvas.noFill();
    map.canvas.stroke(255,255,255);
    map.canvas.ellipse(posX*mult,posY*mult,check,check);
  }

  boolean MouseOver(){
    if(PVector.dist(new PVector(posX*mult,posY*mult),new PVector(map.cmouse.x,map.cmouse.y))<check/2) return true;
    else return false;
  }

  void createProperties(){
    prop.addTextlabel("name").
      setText("Name:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255));

    prop.addTextfield("txtName").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(130, pad*2).
      setAutoClear(false).
      setText(name);
    
    propBar = new PVector(propBar.x,propBar.y+pad*3);

    prop.addTextlabel("pos").
      setText("Position:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255));

    prop.addTextfield("txtposX").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(nf(posX, 0, 1)).
      setAutoClear(false);  
    prop.addTextfield("txtposY").
      setLabel("").
      setPosition(propBar.x+130+10+60, propBar.y).
      setSize(60, pad*2).
      setText(nf(posY, 0, 1)).
      setAutoClear(false);
      
    propBar = new PVector(propBar.x,propBar.y+pad*3); 
    
    prop.addTextlabel("angle").
      setText("Angle:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255)); 
    
    prop.addTextfield("txtAngle").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(nf(angle, 0, 1)).
      setAutoClear(false);   
  }

  void checkTextFields(){}
}

void txtName(String value){
  selectedObj.name = trim(value);
}

void txtposX(String value){
  selectedObj.posX = Float.valueOf(nf(Float.valueOf(value), 0, 1));
  selectedObj.posX = float(int(selectedObj.posX*10))/10;
}

void txtposY(String value){
  selectedObj.posY = Float.valueOf(nf(Float.valueOf(value), 0, 1));
  selectedObj.posY = float(int(selectedObj.posY*10))/10;
}

void txtAngle(String value){
  selectedObj.angle = Float.valueOf(nf(Float.valueOf(value), 0, 1));
  selectedObj.angle = float(int(selectedObj.angle*10))/10;
  //selectedObj.angle = Float.valueOf(value);
}
