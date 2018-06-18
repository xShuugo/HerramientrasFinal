class Data{
  // data
  //ArrayList<String> data = new ArrayList<String>();
  ArrayList<Mesa> mesa = new ArrayList<Mesa>();
  
  String superString;
  
  // archivo
  PrintWriter file = null;
  String filePath = "";
  
  
  void callback(File file)
  {
    println(file);
  }  
  
  void selectSave(){
    {
      if (filePath != "")
      {
       saveData();
      }
      else
      {
        selectOutput("Select save location", "onOutputSelected");
      }
    }
  }
  
  
   
  void saveData()
  {      
    file = createWriter(filePath);
    file.print(superString); 
    file.flush();
    file.close();
  }
}
