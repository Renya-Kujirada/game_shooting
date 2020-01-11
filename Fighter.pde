class Fighter { 
  PImage img;   // A variable for the image file
  float x, y;   // Variables for image location
  float rot;    // A variable for image rotation
  
  float r = 50;

  Fighter(String filename) {
    img = loadImage(filename);
    x = 0.0;
    y = width/2.0;
    rot = 0.0;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(rot);
    imageMode(CENTER);
    image(img, 0, 0, 80, 120);
    popMatrix();
  }
  
  void move(float tx,float ty, float tr) {
    x=tx;
    y=ty;
    rot+=tr;
  }
  
  //****** judgement
  // A function that returns true or false based on
  // if the catcher intersects a Fighter
  boolean intersect(Enemy d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < r + d.r) {
      tint(100);      
      return true;
    } else {
      return false;
    }
  }
  
  
  //****** judgement_bomb
  // A function that returns true or false based on
  // if the catcher intersects a Fighter
  boolean intersect_bombs(Bomb d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < r + d.r) {
      tint(100);    
      return true;
    } else {
      return false;
    }
  }
  
  
}