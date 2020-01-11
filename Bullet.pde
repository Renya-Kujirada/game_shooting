class Bullet {
  float x,y;     // Variables for location of Bullet
  float speed;   // Speed of Bullet
  color c;
  float r;       // Radius of Bullet

  Bullet() {
    r = 8;                 // All Bullets are the same size
    x = mouseX;            // Start with a random x location
    y = mouseY - 35;       // Start a little above the window
    speed = 20;            // Pick a speed
    c = color(50,50,250);  // Color
  }

  // Move the Bullet down
  void move() {
    // Increment by speed
    y -= speed; 
  }

  // Check if it hits the bottom
  boolean reachedTop() {
    // If we go a little beyond the bottom
    if (y < -10) {
      speed = 0;    // Stop it from moving by setting speed equal to zero
      y = -1000;    // Set the location to somewhere way off-screen
      return true;
    }
    else {
      return false;
    }
  }

  // Display the Bullet
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r-1; i++ ) {
      rect(x,y + i*4,i*2,i*2);
    }
  }
  
  // A function that returns true or false based on
  // if the catcher intersects a Bullet
  boolean intersect(Enemy d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < r + d.r) {
      d.caught();
      return true;
    }
    else {
      return false;
    }
  }
   
  // If the drop is caught
  void hit() {
    hit.trigger();
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000; 
  }
   
}