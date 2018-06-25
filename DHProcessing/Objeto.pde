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
  }
  
  public String imprimir(){
    return "";    
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
    prop.addTextfield("txtLevelName").
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
      setText(str(posX)).
      setAutoClear(false);  
    prop.addTextfield("txtposY").
      setLabel("").
      setPosition(propBar.x+130+10+60, propBar.y).
      setSize(60, pad*2).
      setText(str(posY)).
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
      setText(str(angle)).
      setAutoClear(false);   
  }
}
