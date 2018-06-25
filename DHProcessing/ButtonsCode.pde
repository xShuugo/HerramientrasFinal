void controlEvent(ControlEvent e) 
{  
  String n = e.getName();
  if (n.equals("objectList"))
  {
    String currentItem = objectList.getItem((int)e.value()).get("name").toString();
    switch(currentItem){
      case "Mesa":        map.tempObj = new objMesa       ("tempMesa",0,0,0);break;
      case "Lampara" :    map.tempObj = new objLampara    ("tempLampara",0,0,0,0,0,true,"null");break;
      case "Pared" :      map.tempObj = new objPared      ("tempPared",0,0,0);break;
      case "Fosforos" :   map.tempObj = new objFosforos   ("tempFosforos",0,0,0,0); break;
      case "Enchufe" :    map.tempObj = new objEnchufe    ("tempEnchufe",0,0,0);  break;
      case "Cajafuerte" : map.tempObj = new objCajafuerte ("tempCajafuerte",0,0,0,"null","null",true); break;
      case "Nota" :       map.tempObj = new objNota       ("tempNota",0,0,0,"null");  break;      
    }
    state = ToolState.DRAWING;
  }
  if(n.equals("txtLevelName"))
    levelName = sb.get(Textfield.class, "txtLevelName").getText();
  if(n.equals("txtPlayerX") || n.equals("txtPlayerY") || n.equals("txtPlayerZ"))
    playerPos = new PVector(
      Float.valueOf(sb.get(Textfield.class,"txtPlayerX").getText()),
      Float.valueOf(sb.get(Textfield.class,"txtPlayerY").getText()),
      Float.valueOf(sb.get(Textfield.class,"txtPlayerZ").getText()));
  println(n);
}

void generateObject(){
  float X = random(-map.canvas.width/(2*mult),map.canvas.width/(2*mult));
  float Y = random(-map.canvas.height/(2*mult),map.canvas.height/(2*mult));
  float angle = 0;
  boolean isOnBool = random(1) > .5;
  int randomObject = round(random(0, 6));
  switch(randomObject){
    case 0:  data.objeto.add(new objMesa("Mesa"+qObj,X,Y, angle));  break;
    case 1:  data.objeto.add(new objLampara("Lampara"+qObj, X,Y, angle, 3, 10, isOnBool, "prueba"));  break;
    case 2:  data.objeto.add(new objPared("Pared"+qObj, X, Y, angle));  break;
    case 3:  data.objeto.add(new objFosforos("Fosforos"+qObj, X, Y, angle, 3));  break;
    case 4:  data.objeto.add(new objEnchufe("Enchufe"+qObj, X, Y, angle));  break;
    case 5:  data.objeto.add(new objCajafuerte("Cajafuerte"+qObj, X, Y, angle, "", "", isOnBool));  break;
    case 6:  data.objeto.add(new objNota("Nota"+qObj, X, Y, angle, "")); break;
  }
  qObj++;
}

void exportFile(){
  String aux = "";

  println("?");
  for(Objeto o:data.objeto){    
    aux += o.imprimir();    
  }  
  data.superString = levelName +"/"+ playerPos.x +"|"+ playerPos.y +"|"+ playerPos.z +"/"+ aux;
  data.selectSave();
}

void openFile(){
  data.objeto = new ArrayList<Objeto>();
  data.selectFile();
}

void newMap(){
  data.objeto = new ArrayList<Objeto>();
}

void moveObject(){
  state = ToolState.MOVING;
  map.tempObj = null;
}

void rotateObject(){
  state = ToolState.ROTATE;
  map.tempObj = null;
}