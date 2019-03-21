import processing.video.*;
PImage Fuego, Tuga, Ballena;                  //imagenes para representar pixeles
Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();  
  Fuego=loadImage("Fuego.png");
  Ballena=loadImage("ballena.png");
  Tuga = loadImage("Tuga.png");
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height);                  // dibujamos la imagen de la webcam
    int rojoX = 0;
    int rojoY = 0;
    int verdeX = 0;
    int verdeY = 0;
    int azulX = 0;
    int azulY = 0;
    
    float RojoValue = 0;                            // valor de los pixeles en propiedad de rojo
    float VerdeValue = 0;
    float AzulValue = 0;
    
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {                    //analizaremos cada pixel en valor rojo
      for (int x = 0; x < video.width; x++) {    
        int pixelValue = video.pixels[index];                   // obtenemos los valores del pixel
        float pixelcolorRojo = red(pixelValue);                 //determinamos el nivel de rojo de los pixeles
        float pixelcolorVerde = green(pixelValue);
        float pixelcolorAzul = blue(pixelValue);
        
        
        if (pixelcolorRojo > RojoValue) { //si el pixel anterior es mas rojo que el nuevo se almacenará, de no ser asi, seguira con el siguiente
          RojoValue = pixelcolorRojo; 
          rojoY = y; //guardamos el valor de y 
          rojoX = x; //guardamos el valor de x
        }
         
        if (pixelcolorAzul > AzulValue) { //si el pixel anterior es mas azul que el nuevo se almacenará, de no ser asi, seguira con el siguiente
          AzulValue = pixelcolorAzul; 
          azulY = y; //guardamos el valor de y 
          azulX = x; //guardamos el valor de x
        }     
          if (pixelcolorVerde > VerdeValue) {          //si el pixel anterior es mas verde que el nuevo se almacenará, de no ser asi, seguira con el siguiente
          VerdeValue = pixelcolorVerde; 
          verdeY = y; //guardamos el valor de y 
          verdeX = x; //guardamos el valor de x
        }
        index++;
      }
    }

    image(Fuego,rojoX-100, rojoY-100, 200, 200);   
    image(Tuga,verdeX-100, verdeY-100, 200, 200);  
    image(Ballena,azulX-100, azulY-100, 200, 200);  

}
}
