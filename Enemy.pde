class Enemy {
  float x, y;     // Variables for location of Enemy
  float moveChangeX;
  float moveChangeY;
  float speed;    // Speed of Enemy
  color c;
  float r;        // Radius of Enemy
  
  int damage = 0;  // Enemy's life
  
  // make Bomb object
  Bomb bombs;
  boolean makebomb = false;

  Enemy() {
    r = 8;                 // All Enemys are the same size
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    
    moveChangeX = random(-5.0, 8.0);    
    speed = random(0.1, 2);   // Pick a random speed
    c = color(250, 50, 50); // Color
  }

  // Move the Enemy down
  void move() {
    // Increment by speed
    x += moveChangeX;
    //y += (speed + moveChangeY);
    y += speed;
    
    if ((x > width) || (x < 0)) {
      moveChangeX = - moveChangeX;
    }
    
    // Enemy's attack
    if(y > 50 && makebomb == false ) {
      bombs = new Bomb(x,y);  // Initialize one drop
      makebomb = true;
    }
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

  // Display the Enemy
  void display() {
    // Display the drop
    rectMode(CENTER); 
    stroke(0);
    strokeWeight(2);
    fill(c);
    
    for (int i = 4; i > 0; i--) {
      rect(x, y, i * 8, i * 8);
    } 
  }
  
  void attack() {    
    if(makebomb) {
       bombs.move();
       bombs.display();
       
       // if bomb attack the fighter
       if (fighter.intersect_bombs(bombs)) {  // if user catch the drops.
         bombs.caught();
         life.damage();
       }
    }  
  }


  // If the drop is caught
  void caught() {
    damage++;
    if(damage == 1) {
      c = color(250, 100, 50);
    }  
    else if(damage == 2) {
      c = color(250, 200, 50);
    }
    else if(damage == 3) {
      explode.trigger();
      total_score++;
      // Stop it from moving by setting speed equal to zero
      speed = 0; 
      // Set the location to somewhere way off-screen
      y =  2000;
    }  
  }

}