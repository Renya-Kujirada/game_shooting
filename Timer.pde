class Timer {
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if Drop_Pase (ms) have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    int passedTime = millis()- savedTime;    // Check how much time has passed
    if (passedTime > totalTime) {
      tint(255);
      return true;
    } else {
      return false;
    }
  }
  
}