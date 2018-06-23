class DCanvas
{ 
 // PGraphics buffer;
  
 // ArrayList<Float> coords = new ArrayList<Float>();
  
  public DCanvas()
  {
   buffer = createGraphics(711,350);


  }
   
   void draw()
   {

   buffer.beginDraw();
   drawLines();
   drawRectangles();
   buffer.endDraw();
  
  
  image(buffer,300,210);
   }
   
  
  
  
 void drawLines()
{
  buffer.beginDraw();
  buffer.background(c);
  buffer.stroke(180);
  buffer.strokeWeight(1);
  
  for (int i = 0; i <= rango; i++)
  {
    buffer.line(50 * i, 0, 50 * i, height); // filas
    
  }
   for (int i = 0; i <= 20; i++)
  {
    
    buffer.line(0, 50 * i-210 , width, 50 * i-210 );  // columnas
  }
  buffer.endDraw();
}
  
 
  void drawRectangles()
{
   buffer.beginDraw();
  for (int i = 0; i < data.ShapePoints.size(); i ++ )
  {
    data.ShapePoints.get(i).drawShape();
  }
  buffer.endDraw();
}




void Press()
 {
  float x = (50 *  (mouseX  / 50 )) -300 ;
  float y = (50 *  (mouseY  / 50 )) -210;
 // coords.add(x);
 // coords.add(y);
  //float coso = 0;
 //print("map, "+x);
  
  if(x >=0){
  float map = map(x, 0, buffer.width, 0, 14);
  int time = (Math.round(map)); // añadir time al Json
  //print("map, "+time);
  float TR = Time + time*1000;
  print("map, "+TR);
   
  data.ShapePoints.add(new ShapeCreator(x,y,Shape,Size,dcolor,TR));
  
  }
 }
  
  
  
  
  
  
  
  
}
