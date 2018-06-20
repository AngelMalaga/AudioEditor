class ShapeCreator
{
   float py,px,size,R,G,B;
   int type;
   PVector rcolor ;
 
  //float[] data = new float [7];
  

   ShapeCreator(float px,float py,int type,float size,PVector rcolor)
  {

    this.px = px;
    this.py = py;
    this.size = size;
    this.type = type;
    this.R = rcolor.x;
    this.G = rcolor.y;
    this.B = rcolor.z;
    
   // drawShape();
  }
  
 float[] getData() {
    float[] data = new float [7];
    

     data[0] = px;
     data[1] = py;
     data[2] = type;
     data[3] = size;
     
     data[4] = R;
     data[5] = G;
     data[6] = B;
     
        return data;
    }

 
  
 void drawShape()
 {
   if(type == 1)
   {
    
    buffer.beginDraw();
     buffer.strokeWeight(2);
    buffer.stroke(2);
    buffer.fill(R,G,B);
    buffer.rect(px,py,size*2,size*2); 
    buffer.endDraw();

   }
   else
   {
     
     buffer.beginDraw();
     buffer.strokeWeight(2);
     buffer.fill(R,G,B);
     buffer.stroke(2);
     buffer.ellipse(px,py,size*2,size*2); 
     buffer.endDraw();
   }
   
  
 }

 
  
}
