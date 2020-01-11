void StartScreen() {
  int N = 400;         // Display size
  
  if(!start_flag) {
    image(start_screen, 250, 400);
    
    fill(0, 255, 255);
    textSize(50); 
    text("game start : \n press any key", N / 7, N - 50);
    
    if(keyPressed){
      start_flag = true;
      battle.loop();  // music start
    }
  }  
}