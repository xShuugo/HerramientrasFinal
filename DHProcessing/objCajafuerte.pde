class objCajafuerte extends Objeto{  
   
  float size = 0.5;
  String password = "";
  boolean isOnTable;
  String contenido;
  
    
  public objCajafuerte(String name, float posX, float posY, float angle, String password, String contenido, boolean isOnTable){
    super(name, posX, posY, angle);    
    this.password = password;
    this.contenido = contenido;
    this.isOnTable = isOnTable;
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    super.check = size*mult*1.5;
    if(isOnTable){
      map.canvas.fill(99,83,52);
      map.canvas.rect(0,0, mult, mult); 
      super.check = mult*1.5;
    }  

    map.canvas.fill(255,0,0);
    map.canvas.rect(0,0, size*mult,size*mult);    
    
    map.canvas.popMatrix();
    super.draw();
  }

  public String imprimir(){
    return "Cajafuerte" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + password + "|" + contenido + "|" + isOnTable + "/";      
  }
  
  void createProperties(){
    super.createProperties();    
       
    propBar = new PVector(propBar.x,propBar.y+pad*3);
    
    prop.addTextlabel("lblPassword").
      setText("Clave:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255)); 
    
    prop.addTextfield("txtPassword").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(password).
      setAutoClear(false);
      
    propBar = new PVector(propBar.x,propBar.y+pad*3);
    
    prop.addTextlabel("lblContent").
      setText("Contenido:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255)); 
    
    prop.addTextfield("txtContenidoCaja").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(contenido).
      setAutoClear(false);
      
    propBar = new PVector(propBar.x,propBar.y+pad*3);
    
    prop.addTextlabel("lblIsOnTable").
      setText("Esta sobre una mesa ?:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255)); 
   
    prop.addCheckBox("cbIsOnTable").
      setLabel("").
      setPosition(propBar.x+130,propBar.y+(pad/3)).
      setSize(pad, pad).
      setColorForeground(color(120)).
      setColorActive(color(0, 255, 0)).
      setColorLabel(color(255)).            
      addItem("", 0);

    if(isOnTable) prop.get(CheckBox.class,"cbIsOnTable").activate(0);
    else prop.get(CheckBox.class,"cbIsOnTable").deactivate(0);
  }
  void checkTextFields(){
    if(prop.get(Textfield.class,"txtPassword")!=null)
      password = prop.get(Textfield.class,"txtPassword").getText();
      
    if(prop.get(Textfield.class,"txtContenidoCaja")!=null)
      contenido = prop.get(Textfield.class,"txtContenidoCaja").getText();
      
    if(prop.get(CheckBox.class,"cbIsOnTable")!=null){
      isOnTable = prop.get(CheckBox.class,"cbIsOnTable").getState(0);     
    }
  }  
}

void txtPassword(String value){
  selectedObj.checkTextFields();
}

void txtContenidoCaja(String value){
  selectedObj.checkTextFields();
}