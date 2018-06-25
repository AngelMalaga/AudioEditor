import controlP5.*;
import ddf.minim.*;
ControlP5 ui;
Minim minim;
AudioPlayer player;
DCanvas Dcanvas;
VCanvas Vcanvas;
LoadFile file;
Data  data;
Buffer buffers;


String name  = "Viva la vida";
int x,y,x1,y1,Shape = 1,coso;
color SColor; 
color c = color(255,255,255);
float r,R,G,B,lx,ly,Size,lineOne,lineTwo,Time,Range;
PVector dcolor = new PVector(0,0,0);
PGraphics buffer;
int rango,vrango;
String Path;
enum Day {
  circle,
  square
}

void setup()
{
  size(1024,600);
  minim = new Minim(this);
  player = minim.loadFile("data/audio/Eury.mp3",512);
  
  data = new Data();
  buffers = new Buffer();
  
  ui = new ControlP5(this);
  ui.addButton("ChargeFile")
  .setPosition(40,5)
  .setSize(100,35)
  .setLabel("Cargar archivo");
  
  ui.addButton("ExportFile")
  .setPosition(150,5)
  .setSize(100,35)
  .setLabel("Exportar archivo");
  
  ui.addButton("ChargeShapeCu")
  .setPosition(40,330)
  .setSize(100,35)
  .setLabel("Cuadrado");
  
    ui.addButton("ChargeShapeCi")
  .setPosition(150,330)
  .setSize(100,35)
  .setLabel("Circulo");
  
    ui.addButton("DeleteShape")
  .setPosition(40,550)
  .setSize(100,35)
  .setLabel("Eliminar Figura");
  
   ui.addSlider("R", 0, 255, 0, 40, 436, 210, 25);//  Colores RGB
   ui.addSlider("G", 0, 255, 0, 40, 466, 210, 25);//  Colores RGB
   ui.addSlider("B", 0, 255, 0, 40, 496, 210, 25);//  Colores RGB
   ui.addSlider("Time", 0, player.length()-Range, 1, 40, 220, 210, 25);
   
  // ui.addRange("coso", 0f, 60000f, 0, 60000, 40, 400, 210, 25);
   
   
   ui.addSlider("Size", 10, 35, 20, 40, 295, 210, 25);
   ui.addSlider("Range", 1, 14000, 1, 40, 260, 210, 25);
   
   ui.getController("Size").setValue(Size);
   ui.getController("Time").setValue(Time);
   ui.getController("Range").setValue(Range);
 
 
   ui.getController("R").setValue(R);
   ui.getController("G").setValue(G);
   ui.getController("B").setValue(B);
 //  Size = 25;
   
  
  Dcanvas = new DCanvas();
  Vcanvas = new VCanvas();
  
  
  
  //Implementar size
 // size = 50;
  //print("data:",size);
  //
}


void updateUi()
{
  
   ui.getController("Time").setMax(player.length()-Range);
   
  
   //ui.getController("Range").setMax((Math.round(14000))/1000);
   
}

void ChargeFile()
{
  


 
 selectInput("Ruta de lectura", "fileSelected");

}

void ExportFile()
{
 selectOutput("Ruta de guardado", "fileSave");
}

void ChargeShapeCu()
{
 Shape = 1;
}

void ChargeShapeCi()
{
 Shape = 2;
}
float lastTime = 0;
void DeleteShape()
{
     
    
   if(lastTime != Time)
   {
     lastTime = Time;
     Dcanvas.update();
   }
   
  
}


void draw()
{
   
  background(#BF4545);
  Dcanvas.draw();
  Vcanvas.draw();
  visualDraw();
  TimeLine();
  updateUi();
}

void visualDraw()
{
  

  
}

void TimeLine()
{
  
  
}





void keyPressed()
{

 if(player.isPlaying())
 {
   player.pause();
 }else
 {
  player.play(); 
 }

}

void mouseClicked()
{
   Dcanvas.Press();
   dcolor.set(R,G,B);
  // print("TimeLine:",Time);
    updateUi();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("ruta de lectura no escogida");
  } 
  else 
  {
   
    Path = selection.getAbsolutePath();
    file = new LoadFile();
    file.load();
    
  }
}

void fileSave(File selection) {
  if (selection == null) {
    println("ruta de guardado no escogida");
  } 
  else 
  {
   
    Path = selection.getAbsolutePath();
   data.savedata(name,60);
   ;
    
  }
}
