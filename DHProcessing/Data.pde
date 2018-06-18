class Data{
  // data
  ArrayList<String> data = new ArrayList<String>();
  ArrayList<Mesa> mesa = new ArrayList<Mesa>();
  
  // archivo
  PrintWriter file = null;
  String filePath = "";
  
  
  void callback(File file)
  {
    println(file);
  }
  
  
  void keyPressed()
  {
    if (key == 'o')
    {
      selectInput("Select a file", "openFile");
    }
    
    if (key == 's')
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
  
  void openFile(File path)
  {
    filePath = path.getAbsolutePath();
    data = new ArrayList<String>();
    
    String temp[] = loadStrings(path);
  
    if (temp[0].length() > 0);
    {
      String split[] = split(temp[0], " ");
      
      for (int i = 0; i < split.length; i++)
      {
        data.add((split[i]));
      }
    }
  }
  
  void onOutputSelected(File path)
  {
    filePath = path.getAbsolutePath();
    saveData();
  }
  
  void updateData(String x, String y, String c)
  {
    data.add(x); //
    data.add(y); //
    data.add(c); //
  }
  
  /*void drawData()
  {  
    for (int i = 0; i < data.size(); i += 3)
    {
      int x = int(data.get(i));
      int y = int(data.get(i + 1));  
      
      rect(x, y, 30, 80);
    }
  }*/
  
  void saveData()
  {
    file = createWriter(filePath);
    
    for (int i = 0; i < data.size(); i++)
    {
      if (i < data.size() - 1) file.print(data.get(i) + " ");
      else file.print(data.get(i));
    }
  
    file.flush();
    file.close();
  }
}
