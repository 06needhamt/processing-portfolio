PImage bg; // Define Image Variable

int[] pixels; 
void setup() {
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("Aerial Campus 2013.jpg"); // Load Image
  bg.resize(1462, 914); // Scale The Image Down By A Factor of 4
    size(1462, 914); // Set Canvas Size
  pixels = new int[bg.pixels.length]; // Define Pixels Array
  for(int i = 0; i < bg.pixels.length; i++){ // For Each Pixel
    pixels[i] = bg.pixels[i]; // Copy Image Pixel i To Our Array
     pixels[i] = (int) random((float) ( (int) (pow(2,32) - 1))); // Assign Each Pixel A Random Colour
   }
  bg.pixels = pixels; // Copy The Random Pixels To The Image
}

void draw() {
  background(bg); // Draw The Background With The Modified Image
}
