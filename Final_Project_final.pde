// Final_Project_final_20180205
// team : taiyo whales
// 15-2505-025-0
// kujirada renya

// audio
import ddf.minim.*; // Music
Minim minim;
AudioPlayer battle;
AudioPlayer gameover;
AudioSample Congratulation;
AudioSample bullet;
AudioSample damage;
AudioSample hit;
AudioSample explode;

// start_screen
boolean start_flag = false;
PImage start_screen;

// object
PImage space;
Fighter fighter;
float wh;

Bullet[] bullets;   // An array of bullet objects
Timer timer;        // One timer object
Enemy[] enemies;    // An array of enemy objects
Life life;          // An array of life objects

// Bullet_variable
int total_Bullets = 0; // total_Bullets
int Bullet_Num = 100000;

// Enemy_variable
int total_enemies = 0; // total_enemies
int Enemy_Num = 150;
int Enemy_Pase = 1000;

// Bomb_vatiable
int total_Bombs = 0;
int Bomb_Num = 1000;

// Life_variable
int total_life = 25;

// score
int total_score = 0;


void setup() {
  size(500, 800);
  
  //Music
  minim = new Minim(this);
  battle = minim.loadFile("battle.mp3"); //It plays when game start
  gameover = minim.loadFile("gameover.mp3");   // It plays when game over
  Congratulation = minim.loadSample("clear.wav");   // It rings when game is cleared
  bullet = minim.loadSample("bullet.wav"); // bullet sound
  damage = minim.loadSample("damage.wav"); // damage sound
  hit = minim.loadSample("hit.wav");       // hit sound
  explode = minim.loadSample("explode.wav");   // explode sound
  
  imageMode(CENTER);
  smooth();
  ellipseMode(CENTER);
  rectMode(CORNER);

  start_screen = loadImage("start_screen.jpg");
  space = loadImage("space.jpg");
  fighter = new Fighter("Fighter.png");
  wh=0;

  bullets = new Bullet[Bullet_Num];     // Create 100000 bullets in the array

  enemies = new Enemy[Enemy_Num];     // Create 1000 enemied in the array 

  timer = new Timer(Enemy_Pase);   // Create a timer that goes off every 2 seconds
  timer.start();

  // Display the Life Gauge
  life = new Life(total_life);
}

void draw() {
  // start screen
  StartScreen();
  
  /// ***** game_start ***** ////
  if(start_flag) {
    background(5);
    image(space, 250, 400);
  
    Score();

    /****** Timer Movement *****/
    // Check the timer
    if (timer.isFinished()) {  // if Enemy_Pase (ms) has passed, drop object is maked.
      // Deal with rainenemies
      enemies[total_enemies] = new Enemy();  // Initialize one enemy
      total_enemies++;                       // Increment total_enemies

      timer.start();      // restart the timer
    }


    /****** Enemy Movement *****/
    // Move and display all enemies
    for (int i = 0; i < total_enemies; i++ ) {
      enemies[i].move();
      enemies[i].display();
      enemies[i].attack();

      // if enemy attack the fighter
      if (fighter.intersect(enemies[i])) {
        enemies[i].caught();
        life.damage();
      }
    }


    /****** Bullet Movement *****/
    // Move and display all bullets
    bullets[total_Bullets] = new Bullet();  // Initialize one bullet
    int display_bullet = 0;
    for (int i = display_bullet; i < total_Bullets; i++ ) {
      bullets[i].move();
      bullets[i].display();

      // if bullet attack the enemies
      for (int e = 0; e < total_enemies; e++ ) {
        if (bullets[i].intersect(enemies[e])) {
          bullets[i].hit();
        }
      }

      if ( bullets[i].reachedTop() ) {
        display_bullet++;
      }
    }
  
    if (mousePressed) {
      bullet.trigger();
      total_Bullets++;
    }  


    /***** Life Gauge Movement *****/
    life.display();
  

    /***** Fighter Movement *****/
    fighter.move(mouseX, mouseY, wh);
    fighter.display();

  
    /***** EndCheck *****/
    EndCheck(life.nowlife(), total_score);  
    }
  
}

void mouseWheel(MouseEvent event) {
  wh = wh + event.getAmount()/(2*PI);
}