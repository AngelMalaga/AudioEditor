import controlP5.*;
import ddf.minim.*;
ControlP5 ui;
Minim minim;
AudioPlayer player = null;
DCanvas Dcanvas;
VCanvas Vcanvas;
LoadFile file;
Data  data;
Buffer buffers;
ControlGroup messageBox; ////////
ControlGroup messageBox2;///////


//String name  = "Viva la vida";
int x,y,x1,y1,Shape = 1,coso;
color SColor; 
color c = color(255,255,255);
float r,R,G,B,lx,ly,Size,lineOne,lineTwo,Time,Range;
PVector dcolor = new PVector(0,0,0);
//PGraphics buffer;
int messageBoxResult= -1;////////////////
String messageBoxString = "";///////////////

int rango,vrango,stime;
String Path;
public enum Hstate {
  save,
  draw,
  load,
  none
  
}
Hstate state = Hstate.none;

void setup()
{
  size(1024,600);
  minim = new Minim(this);
 
  
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
  
  ui.addButton("ChargeSong")
  .setPosition(260,5)
  .setSize(100,35)
  .setLabel("Cargar mp3");
  
  
  /// esto tendria que estar en drawUi(),pero  causa errores al cargar 
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
   ui.addSlider("Time", 0, 10, 1, 40, 220, 210, 25); // rango
   

   
   
  ui.addSlider("Size", 10, 35, 20, 40, 295, 210, 25);
  ui.addSlider("Range", 1, 14000, 1, 40, 260, 210, 25);
   
   ui.getController("Size").setValue(Size);
   ui.getController("Time").setValue(Time);
   ui.getController("Range").setValue(Range);
 
 
   ui.getController("R").setValue(R);
   ui.getController("G").setValue(G);
   ui.getController("B").setValue(B);
   
  //       textos de ayuda
    Button b = ui.addButton("toggleBox",1,700,10,100,30);
    b.setLabel("Ayuda");
    
  // control p5 es el problema
 
}

void drawUi()
{
 
  /*
    Problemas con controlP5
      aca tendria que ser el dibujado de los controles
   */
   
   
   Dcanvas = new DCanvas();
    Vcanvas = new VCanvas();
   

    int m = millis();
    if(m > 2000)
     {
     charge();
     }
    
   
 }


void charge()
{
  if(player != null){ 
 
     int m = millis();
     if(m > 2000)
       {
     state = state.draw;
       } 
       
     }else
     {drawUi();}
}



void updateUi()
{
  if(player != null){ 
   
  ui.getController("Time").setMax(player.length()-Range);
  }
}

void ChargeSong()
{
   selectInput("Ruta del mp3", "fileSong");
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


void DeleteShape()
{
     
    

   
  
}


void draw()
{
   
  background(#BF4545);
 
     
  if(state == state.draw){
  Dcanvas.draw();
  Vcanvas.draw();
  updateUi();
  }
  
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
  if(state == state.draw){
   Dcanvas.Press();
   dcolor.set(R,G,B);
    updateUi();
  }
  
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
    data.savedata(60);
   ;
    
  }
}

void fileSong(File selection) {
  if (selection == null) {
    println("ruta de lectura no escogida");
  } 
  else 
  {
    
    Path = selection.getAbsolutePath();
    player = minim.loadFile(Path,512); 
   // player(Path);
    data.fileSong(Path);
    
    drawUi();
    
   
  }
}

///////// El boton de ayuda da error  
/*

void toggleBox(int theValue){
  if(messageBox.isVisible()) {
    messageBox.hide();
    messageBox2.hide();
  } else {
    messageBox.show();
    messageBox2.show();
  }
  
  
}



void createMessageBox(){
    messageBox = ui.addGroup("Ayuda",20,215,250);
 messageBox.setBackgroundHeight(330);
 messageBox.setBackgroundColor(color(0,100));
 messageBox.hide();
  
  // add a TextLabel to the messageBox.
  Textlabel l = ui.addTextlabel("messageBoxLabel","Este slash te permite determinar el tipo de la cancion",2,10);
  l.moveTo(messageBox);
 
 messageBox2 = ui.addGroup("Ayuda2",300,215,300);
 messageBox2.setBackgroundHeight(100);
 messageBox2.setBackgroundColor(color(0,100));
 messageBox2.hide();
  
  // add a TextLabel to the messageBox.
  Textlabel j = ui.addTextlabel("messageBoxLabel2","Aqui puedes poner los cuadrado y circulos ",20,20);
  j.moveTo(messageBox2);
}
*/
