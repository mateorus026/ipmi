//https://www.youtube.com/watch?v=5pS9AqdlF9Y

PImage referencia; 

int tipoFigura = 0; 

float angulo = 0;
float diametroInicial = 66.6;

float rColor = 0;
float gColor = 0;
float bColor = 0;

void setup(){ 
  
  size(800, 400); 
  
  referencia = loadImage("12.jpg");
  
  noStroke();
  
  fill(0); 
} 

void draw(){ 
  
  background(255); 
  
  image(referencia, 0, 0, 400, 400);
  
  float y = 400;         
  
  float diametro = diametroInicial;    
  float separacion = 0.90; 
  
  float margen = 3.0; 

  for (int fila = 0; fila < 30; fila++) {
    
    if (diametro - margen < 1.0 || y <= 0) {
      break; 
    } else {
    
    }
    
    float anchoColumna = diametro * separacion;
    
    int columnas = int(400 / anchoColumna);
    
    if (columnas > 0) {
      
      float spacingX = 400.0 / columnas;
      
      for (int i = 0; i < columnas; i++) {

        float x = 400 + (i * spacingX) + (spacingX / 2);
        
        float tam = diametro - margen; 
        float centroY = y - (diametro/2); 
        
        translate(x, centroY);
        rotate(angulo);
        
        fill(rColor, gColor, bColor);
        
        dibujarForma(tipoFigura, tam, separacion);
        
        rotate(-angulo);
        translate(-x, -centroY);
      }
    }
    
    y -= diametro * 0.99; 
    
    diametro *= 0.85;  
  }
}

void dibujarForma(int tipo, float tam, float sep) {
 
  if (tipo == 0) {
    
    ellipse(0, 0, tam, tam);
  } 
  else if (tipo == 1) {
   
    triangle(0, -tam/2, -tam/2, tam/2, tam/2, tam/2);
  } 
  else if (tipo == 2) {
    
    rectMode(CENTER);
    float tamCuadrado = tam * sep; 
    rect(0, 0, tamCuadrado, tamCuadrado);
    rectMode(CORNER); 
  }
}

float calcularModificador(float mX, float mY) {
  float d = dist(mX, mY, 600, 200);
  float mapeo = map(d, 0, 400, 0, random(0.1, 0.5));
  return mapeo;
}


void mousePressed() {
  tipoFigura++; 
  
  if (tipoFigura > 2) {
    tipoFigura = 0; 
  }
  
  angulo += calcularModificador(mouseX, mouseY);
  
  rColor = random(255);
  gColor = random(255);
  bColor = random(255);
} 

void keyPressed() {
 
  if (key == 'r' || key == 'R') {
    tipoFigura = 0;
    angulo = 0;
    diametroInicial = 66.6;
    
    rColor = 0;
    gColor = 0;
    bColor = 0;
  }
}
