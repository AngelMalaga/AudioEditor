class ShapeCreator
{
   float py,px,size,R,G,B,rt;
   int type,vtime;
   PVector rcolor ;

   ShapeCreator(float px,float py,int type,float size,PVector rcolor,float rt )
  {

    this.px = px;
    this.py = py;
    this.size = size;
    this.type = type;
    this.R = rcolor.x;
    this.G = rcolor.y;
    this.B = rcolor.z;
    this.rt = rt;
 
  }
  
 float[] getData() {
    float[] data = new float [8];
    

     data[0] = px;
     data[1] = py;
     data[2] = type;
     data[3] = size;
     
     data[4] = R;
     data[5] = G;
     data[6] = B;
     data[7] = rt;
     
        return data;
    }

 
  
 void drawShape()
 {
   if(type == 1)
   {
    
    Dcanvas.buffer.beginDraw();
     Dcanvas.buffer.fill(R,G,B);
     Dcanvas.buffer.rect(px+25,py+25,size*2,size*2); 
     Dcanvas.buffer.endDraw();

   }
   else
   {
     
      Dcanvas.buffer.beginDraw();
      Dcanvas.buffer.fill(R,G,B);
      Dcanvas.buffer.ellipse(px+25,py+25,size*2,size*2); 
      Dcanvas.buffer.endDraw();
   }
   

  
 }
/// Editar/////////////////////////////////////////////////////  NO se esta bien, hay que mejorar esta parte
 void vdrawShape()
 {

      float   x = map(rt, 0, player.length(), 0, Vcanvas.buffer.width);  // ni idea de como funciono  D:
      float   y = map(py, 0, Vcanvas.buffer.height, 0, 7); // buscar el funcionamiento  de map
      y = y+2;
      Vcanvas.buffer.beginDraw();
      Vcanvas.buffer.fill(R,G,B);
      Vcanvas.buffer.ellipse(x,y*9,10,10); 
      Vcanvas.buffer.endDraw();
      // print("map, "+y);
 }
  
}
