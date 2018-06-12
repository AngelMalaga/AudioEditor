class DCanvas
{ 
  PGraphics buffer;
  color c = color(255,255,255);
  
  public DCanvas()
  {
   buffer = createGraphics(700,350);
  }
  
   void draw()
   {

  buffer.beginDraw();
  buffer.background(c);
 // buffer.ellipse(50,50,30,30);
  buffer.ellipse(mouseX-309,mouseY-220,50,50);
  buffer.endDraw();
  
  image(buffer,310,220);
   }
  
}
