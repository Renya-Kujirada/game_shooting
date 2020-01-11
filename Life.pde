class Life {
  int x_pos, y_pos;  // Rectangle's x_position, y_posiion
  int wid, hei;      // Rectangle's width, height
  int max_life;
  int now_life;
  color c;

  Life(int tl) {
    x_pos = 65;
    y_pos = 740;
    wid = 15;
    hei = 20;
    max_life=tl;
    now_life=tl;

    //c = color(0, 255, 0);
  }

  void display() {
    rectMode(CORNER);
    fill(0, 255, 0);
    textSize(20);
    text("Life:" + now_life, 30, 25);
    

    // Recreate and Display the Life Gauge
    // gray background
    noStroke();
    fill(100);
    rect(0, 720, 500, 80);
    fill(0, 255, 0);
    text("HP:",x_pos-40, y_pos+18);

    if (now_life < 5) {
      c = #ff0000;
    } 
    else if (now_life < 14) {
      c = #ffff00;
    } 
    else {
      c = #90ee90;
    }

    // white rect
    //noStroke();
    stroke(0);
    fill(255);
    rect(x_pos-1, y_pos-1, wid*max_life+3, hei+3);
    
    // life_guage
    stroke(255);
    fill(c);
    for (int  l=0; l<now_life; l++) {
      rect(x_pos + wid*l, y_pos, wid, hei);
    }
  }
  
  int nowlife() {
    return(now_life);
  }
  
  void damage() {
    damage.trigger();
    now_life--;
  }
  
}  