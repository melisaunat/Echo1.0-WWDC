import processing.video.*;

Movie myMovie;

void setup() {
  size(700, 700); 
  
  myMovie = new Movie(this, "/Users/melisaunat/Desktop/WORKING WITH DATA AND CODE /ASSESSMENT 2/Capturing_and_Video_Prototype/data/coldplay.mov");
  myMovie.loop();
}

void draw() {
  background(0);
  
  myMovie.read();
  if (myMovie.available()) {
    
  }
    pushMatrix();
  
  translate(width / 2, height / 2);
  rotate(HALF_PI);  

  float aspectRatio = float(myMovie.width) / myMovie.height;
  int newWidth = int(height * aspectRatio);
  int newHeight = height;

  image(myMovie, -newWidth / 2, -newHeight / 2, newWidth, newHeight);

  popMatrix();
  
    displayOverlayText();
}

void displayOverlayText() {
  fill(255);  
  textSize(60); 

  textAlign(CENTER, BOTTOM); 
  text("Best Night Ever", width / 2, height - 30);  
}
