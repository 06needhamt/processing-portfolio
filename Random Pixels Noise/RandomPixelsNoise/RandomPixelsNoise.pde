float increment = 0.02; // Define Perlin Noise Time Increment
PImage img; // Define Image Variable

void setup() {
  img = loadImage("Annual Review Front Cover.jpg"); // Load Base Image
  img.resize(1460, 1080); // Scale The Image Down By A Factor of 5
  size(1460, 1080); // Set Canvas Size
  
}

void draw() {
  
  loadPixels(); // Load The Pixel Array

  float xoff = 0.0; // Start xoff at 0
  float detail = map(mouseX, 0, width, 0.1, 0.6);
  noiseDetail(8, detail);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff, yoff) * 255;

      // Try using this line instead
      //float bright = random(0,255);
      
      int rand = (int) random(10); // Generate A Random Number Between 1 and 10
      if(rand % 2 == 0) // If The Random Number Is Divisible By Two
        pixels[x+y*width] = ((int) bright); // Set The Alpha Channel 
      else if(rand % 3 == 0) // If The Random Number Is Divisible By Three
        pixels[x+y*width] = ((int) bright << 8); // Set The Blue Channel 
      else if(rand % 5 == 0) // If The Random Number Is Divisible By Five
        pixels[x+y*width] = ((int) bright << 16); // Set The Green Channel 
      else
        pixels[x+y*width] = ((int) bright << 24); // Otherwise Set The Red Channel
    }
  }
  
  updatePixels(); // Update The Pixels Array
}



