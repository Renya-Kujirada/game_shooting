void EndCheck(int tl, int ts) {
  int N = 400;         // Display size
  
  // GameOver
  if(tl == 0) {
    battle.close();
    gameover.play();
    background(0);
    fill(255, 0, 0);
    textSize(60); 
    text("GAMEOVER", N / 5, N);
    noLoop();
  }
  
  // GameClear
  if(tl>0 && ts == 20) {
    battle.close();
    Congratulation.trigger();
    background(255);
    fill(0, 0, 255);
    textSize(60);
    text("GAMECLEAR!", N / 6, N);
    noLoop();
  }  
}  