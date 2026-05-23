PImage fondo,poster,yellowguy,redguy,duck,maestro1,maestro2,maestro3; 

PFont titulo,texto; 

int estado, inicio; 

/*   Explicacion de abreviaturas

T:Titulo
I:Introduccion
Y:Yellow guy
r:rect
t:text
i:image
y:y
x:x

*/
//titulo
float Ty1,Ty2;

//Introduccion
float Iyr,Iyt,Iyi,Ixr,Ixt,Ixi;

//Yellow guy
float Yxi1,Yxr1,Yxt1,Yxi2,Yxr2,Yxt2;

float vel; 
void setup(){ 
  size(640,480); 
  //Imagenes cargadas 
  fondo = loadImage("fondo.jpg"); 
  poster = loadImage("poster.jpg"); 
  duck = loadImage("Duck.png"); 
  yellowguy = loadImage("yellow guy.png"); 
  redguy= loadImage("red guy.png"); 
  maestro1 = loadImage("maestro1.png"); 
  maestro2 = loadImage("maestro2.png"); 
  maestro3 = loadImage("maestro3.png"); 
  //Fuentes cargadas 
  titulo = loadFont("AgencyFB-Bold-100.vlw"); 
  texto = loadFont("AgencyFB-Reg-27.vlw"); 
  //asignar valores
  estado=0;
 inicio=millis();
 vel=3;
 
 Ty1=225;
 Ty2=320;
 
 Iyr=560;
 Iyt=590;
 Iyi=480;
 Ixr=270;
 Ixt=274;
 Ixi=15;
 
 Yxi1= -300;   
 Yxr1= -645;   
 Yxt1= -635;  
 Yxi2 = 10;
 Yxr2= 17;
 Yxt2= 350;
 
}

void draw (){
  image(fondo, 0, 0, width, height);

  println("X: " + mouseX + ", Y: " + mouseY+",F:"+frameCount);

  // ----------------PANTALLA 1 ----------------
  if(estado==0){
    textFont(titulo);
    text("DON´T HUG ME",75,Ty1);
    text("I´M SCARED",115,Ty2);

    if(millis()-inicio > 2000){
      estado = 1;
    }
  }

  else if (estado == 1) {
    textFont(titulo);
    text("DON´T HUG ME",75,Ty1);
    text("I´M SCARED",115,Ty2);

    noStroke();
    fill(255,0,0,120);
    rect(270,Iyr,355,250);

    fill(255);
    textFont(texto);
    text("Es una serie británica creada el 29 de julio del 2011 por un canal con el mismo nombre que la serie. Este busca burlarse de series para niños como Plaza Sésamo o los Muppets y los lleva a un lado más terrorífico y turbio. Sus protagonistas son:",274,Iyt,350,430);
    image(poster, 15, Iyi , 250, 400);

    Ty1 -= vel;
    Ty2 -= vel;
    Iyr -= vel;
    Iyt-= vel;
    Iyi-= vel;

    if (Ty2 < -50) {
      estado = 2;
      inicio = millis();
    }
  }

  else if (estado == 2) {
    noStroke();
    fill(255,0,0,120);
    rect(270,115,355,250);

    fill(255);
    textFont(texto);
    text("Es una serie británica creada el 29 de julio del 2011 por un canal con el mismo nombre que la serie. Este busca burlarse de series para niños como Plaza Sésamo o los Muppets y los lleva a un lado más terrorífico y turbio. Sus protagonistas son:",274,140,350,430);

    image(poster, 15, 56, 250, 400);

    if(millis()-inicio > 2000){
      estado = 3;
      Ixr = 270;
      Ixt = 274;
      Ixi = 15;
    }
  }

 else if (estado == 3) {
   
  noStroke();
  fill(255,0,0,120);
  rect(Ixr,115,355,250);
  fill(255);
  textFont(texto);
  text("Es una serie británica creada el 29 de julio del 2011 por un canal con el mismo nombre que la serie. Este busca burlarse de series para niños como Plaza Sésamo o los Muppets y los lleva a un lado más terrorífico y turbio. Sus protagonistas son:", Ixt,140,350,430);
  image(poster, Ixi, 56 , 250, 400);

  image(yellowguy, Yxi1, 40, 300, 480);
  fill(0,76,0,120);
  rect(Yxr1,240,380,140);
  fill(255);
  text("YELLOW GUY: Es el mas chico y el unico niño del elenco, por lo tanto el mas inocente y es el blanco de las burlas o regaños por parte de los maestros, y en ocaciones de sus amigos.", Yxt1,248,370,347);
  Ixr += vel;
  Ixt += vel;
  Ixi+= vel;
  Yxi1+= vel;
  Yxr1+= vel;
  Yxt1+= vel;
  
  if (Yxi1 >= 350) {
    estado = 4;
    inicio = millis();
  }
}

else if (estado == 4) {
  image(yellowguy,350,40,300,480);
  fill(0,76,0,120);
  rect(10,240,380,140);
  fill(255);
  text("YELLOW GUY: Es el mas chico y el unico niño del elenco, por lo tanto el mas inocente y es el blanco de las burlas o regaños por parte de los maestros, y en ocaciones de sus amigos.",17,248,370,347);

  if (millis() - inicio > 2000) {
    estado = 5;
    Yxi2 = 350;
    Yxr2 = 10;
    Yxt2 = 17;
  }
}
else if (estado == 5){
  image(yellowguy,Yxi2,40,300,480);
  fill(0,76,0,120);
  rect(Yxr2,240,380,140);
  fill(255);
  text("YELLOW GUY: Es el mas chico y el unico niño del elenco, por lo tanto el mas inocente y es el blanco de las burlas o regaños por parte de los maestros, y en ocaciones de sus amigos.",Yxt2,248,370,347);
  Yxi2 += vel;
  Yxr2 += vel;
  Yxt2 += vel;
  
  if (Yxt2> width + 50){
    estado=6;
    inicio=millis();
  }
}
else if (estado==6){
  image(redguy,420,80,190,500);
  fill(0,0,78,120);
  rect(30,200,400,150);
  fill(255);
  text("RED GUY:Es un adulto joven pero algo mas malhumorado, pero es el primero en cuestionar las lecciones de sus maestros y el primeo que logra escapar",40,210,380,390);
}
 else if (estado==7){
   image(duck,420,80,190,500);
 }
}
