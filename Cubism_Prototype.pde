ArrayList<Shape> shapes = new ArrayList<Shape>();

void setup() {
  size(800, 800);
  background(220);
}
void draw() {
  for (Shape s : shapes) {
    s.update();
    s.display();
  }
}

void mousePressed() {
  Shape newShape = new Shape(mouseX, mouseY);
  shapes.add(newShape);
}

class Shape {
  float x, y;
  int numVertices;
  float[] angles;
  float[] radii;
  color shapeColor;
  float rotationSpeed;

  Shape(float x, float y) {
    this.x = x;
    this.y = y;
    this.numVertices = int(random(3, 6));
    this.angles = new float[numVertices];
    this.radii = new float[numVertices];
    
    for (int i = 0; i <numVertices; i++) {
      angles[i] = random(TWO_PI);
      radii[i] = random(40, 100);
    }

    this.shapeColor = color(random(100, 255), random(100, 255), random(100, 255), 150);
    this.rotationSpeed = random(-0.05, 0.05);
  }

  void update() {
    for (int i = 0; i < numVertices; i++) {
      angles[i] += rotationSpeed;
    }
  }


  void display() {
    fill(shapeColor);
    noStroke();
    beginShape();
    for (int i = 0; i < numVertices; i++) {
      float vx = x + cos(angles[i]) * radii[i];
      float vy = y + sin(angles[i]) * radii[i];
      vertex(vx, vy);
    }
    endShape(CLOSE);
  }
}
