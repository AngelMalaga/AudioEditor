class DCanvas
{ 
 // PGraphics buffer;
  
  ArrayList<Float> coords = new ArrayList<Float>();
  
  public DCanvas()
  {
   buffer = createGraphics(700,350);


  }
   
   void draw()
   {

   buffer.beginDraw();
   drawLines();
   drawRectangles();
   buffer.endDraw();
  
  
  image(buffer,310,220);
   }
   
  
  
  
 void drawLines()
{
  buffer.beginDraw();
  buffer.background(c);
  buffer.stroke(180);
  buffer.strokeWeight(1);
  
  for (int i = 0; i <= 6; i++)
  {
    buffer.line(0, 50 * i, width, 50 * i);
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
  float x =  (mouseX -310);
  float y =  (mouseY -230);
  coords.add(x);
  coords.add(y);
  data.ShapePoints.add(new ShapeCreator(x,y,Shape,Size,dcolor));
 }
  
  
  
  
  
  
  
  
}
