class Bomb {
  float x, y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  color c;
  float r;     // Radius of raindrop

  Bomb(float bx, float by) {
    r = 8;                 // All Bomb are the same size
    x = bx;                // Start with a enemy's x location
    y = by;                // Start with a enemy's x location
    speed = 7;             // Pick a speed
  }
  
  // Move the Bomb's down
  void move() {
    y += speed; 
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*4) {
      speed = 0;    // Stop it from moving by setting speed equal to zero
      y = -1000;    // Set the location to somewhere way off-screen
      return true;
    }
    else {
      return false;
    }
  }

  // Display the Bomb
  void display() {
    fill((int)random(0,255), (int)random(0,255), (int)random(0,255));
    stroke(0);
    strokeWeight(1);
    for (int i = 3; i > 0; i-- ) {
      ellipse(x,y,i*7,i*7);
    }
  }

  // If the Bomb is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
  }
}