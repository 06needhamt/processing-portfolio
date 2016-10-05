/**
 * Background Image. 
 * 
 * This example presents the fastest way to load a background image
 * into Processing. To load an image as the background, it must be
 * the same width and height as the program.
 */
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 

PImage bg;
int y;

int[] pixels; 
void setup() {
  size(1462, 914);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("Aerial Campus 2013.jpg");
  bg.resize(1462, 914);
  pixels = new int[bg.pixels.length];
  for(int i = 0; i < bg.pixels.length; i++){
    pixels[i] = bg.pixels[i];
     pixels[i] = (int) random((float) ( (int) (pow(2,16) - 1) << 16));
   }
  bg.pixels = pixels;
}

void draw() {
  background(bg);
  
}
