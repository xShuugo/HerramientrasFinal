class Data {
  // data
  ArrayList<Objeto> objeto = new ArrayList<Objeto>();

  String superString;
  String[] openString;
  
  boolean doNew = false;
  boolean doOpen = false;
  boolean listReady = true;

  // archivo
  PrintWriter file = null;
  String filePath = "";

  void selectSave() {
    {
      if (filePath != "")
      {
        saveData();
      } else
      {
        selectOutput("Select save location", "onOutputSelected");
      }
    }
  }

  void saveData() {      
    file = createWriter(filePath);
    file.print(superString); 
    file.flush();
    file.close();
  }

  void selectFile() {
    selectInput("Seleccione un archivo", "onInputSelected");
  }

  void newList(){
    doNew = false;
    data.filePath = "";
    data.objeto = new ArrayList<Objeto>();
    createBorder();
    createSideBar();
    state = ToolState.MOVING;
    selectedObj = null;
    mult = 16;
    listReady = true;
  }

  void openList(){
    println("data 1");
    doOpen = false;
    selectFile();
  }

}

void onOutputSelected(File path) {
  if (path != null) {
    data.filePath = path.getAbsolutePath(); 
    data.saveData();
  }
}

void onInputSelected(File path) {
  if (path != null) {
    println("data 2");
    data.filePath = path.getAbsolutePath();    
    data.openString = split(loadStrings(path)[0], "/");
    levelName = data.openString[0];

    String[] pos = split(data.openString[1], "|");
    playerPos = new PVector(
      float(pos[0]), 
      float(pos[1]), 
      float(pos[2]));
    println("data 3");
    createSideBar();
    println("data 4");
    data.objeto = new ArrayList<Objeto>();
    
    println("data 5");
    for (int i = 2; i < data.openString.length; i++) {
      String[] objs = split(data.openString[i], "|");    
      switch(objs[0]) {
      case "Mesa": 
        data.objeto.add(new objMesa(objs[1], float(objs[2]), float(objs[3]), float(objs[4]))); 
        break;
      case "Lampara": 
        data.objeto.add(new objLampara(objs[1], float(objs[2]), float(objs[3]), float(objs[4]), float(objs[5]), float(objs[6]), Boolean.valueOf(objs[7]), objs[8])) ; 
        break;
      case "Pared": 
        data.objeto.add(new objPared(objs[1], float(objs[2]), float(objs[3]), float(objs[4]))); 
        break;
      case "Fosforos": 
        data.objeto.add(new objFosforos(objs[1], float(objs[2]), float(objs[3]), float(objs[4]), int(float(objs[5])))); 
        break;
      case "Cajafuerte": 
        data.objeto.add(new objCajafuerte(objs[1], float(objs[2]), float(objs[3]), float(objs[4]), objs[5], objs[6], Boolean.valueOf(objs[7]))); 
        break;
      case "Nota": 
        data.objeto.add(new objNota(objs[1], float(objs[2]), float(objs[3]), float(objs[4]), objs[5])); 
        break;
      case "Enchufe": 
        data.objeto.add(new objEnchufe(objs[1], float(objs[2]), float(objs[3]), float(objs[4]))); 
        break;
      case "PuertaF": 
        data.objeto.add(new objPuertaF(objs[1], float(objs[2]), float(objs[3]), float(objs[4]))); 
        break;
      }
    }
    println("data 6");
    recheckDependendies();
    println("data 7");
    data.listReady = true;
    println("data 8");
  } else data.listReady = true;
}



void recheckDependendies(){
  for(Objeto o:data.objeto){
      if(o instanceof objLampara){
        objLampara l = (objLampara) o;
        if(l.enchufeInicial == null)
          l.enchufeInicial = l.searchEnch(l.phEnchName);
      }
    }
}

void createBorder(){
  float j = 0;
  for(int i = 1; i <= 7; i++){    
    data.objeto.add(new objPared ("Pared"+i, -13+j, -14.75, 0));
    data.objeto.add(new objPared ("Pared"+(i+7), -14.75, -12.50+j, 90));
    data.objeto.add(new objPared ("Pared"+(i+(7*2)), -13+j, 14.75, 0));
    data.objeto.add(new objPared ("Pared"+(i+(7*3)), 14.75, -12.50+j, 90));
    j += 3.99;
  }
    data.objeto.add(new objPared ("Pared"+(1+(7*4)), 13, -14.75, 0));
    data.objeto.add(new objPared ("Pared"+(2+(7*4)), 13, 14.75, 0));
    data.objeto.add(new objPared ("Pared"+(3+(7*4)), -14.75, 13, 90));
    data.objeto.add(new objPared ("Pared"+(4+(7*4)), 14.75, 13, 90));
}
