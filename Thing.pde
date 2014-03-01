PImage img;

void setup() {
  size(480, 360);
  frameRate(30);
  img = loadImage("Cookie.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {
  fill(4);
 // rect(20,20,20,20);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r;
      r = red (img.pixels[loc]);
      float maxdist = 100;//Changes the size of the light
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      r = constrain(r, 0, 255);
      color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  //rect(30,30,30,30);
  updatePixels();
}
