// online login
void onlPL1() {
  gmod = -gmod;
  
  
}
void onlPL2() {

  loginCache=-1;
  statemod=1;


  background(243, 241, 228);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 135, 38);
  textSize(36);
  text("Log in", width/2, 170);
  fill(241, 232, 212);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  if(loginID.equals(" ")) text("ID", width/2, 335);
  else text(loginID, width/2, 335);
  text("PASSWORD", width/2, 415);
  text("Log in", width/2, 495);


  textAlign(LEFT, TOP);
  fill(255, 0, 0);
  textSize(16);
  if (loginID.length()==8) text("ID should be shorter than 9 letters", width/2+155, 335);
  if (loginPD.length()==8) text("PASSWORD should be shorter than 9 letters", width/2+155, 415);
  if (validIDPDLI==1) text("invalid ID or PASSWORD", width/2+155, 495);
  textAlign(CENTER, CENTER);
  strokeWeight(3);
  stroke(249, 100, 45);
  textSize(48);

  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(231, 233, 227);
    if (mouseY>300&&mouseY<370) {
      cursor(TEXT);
      rect(width/2-140, 300, 280, 70);
      fill(0);
      text(loginID, width/2, 335);
      inputmod = 710;
    } else if (mouseY>380&&mouseY<450) {
      cursor(TEXT);
      rect(width/2-140, 380, 280, 70);
      fill(0);
      text(loginPD, width/2, 415);
      inputmod = 720;
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      fill(0);
      text("Log in?", width/2, 495);
      if (click==1) {
        gmod = 710;
        click = 0;
      }
    } else cursor(ARROW);
  } else cursor(ARROW);
}

void onlLR() {

  if (loginCache==-1) {
    DeviceID=str((int)random(1000, 9999));
    loginCache=3;
    myClient.write("1"+":"+DeviceID+":"+loginID+"::");
  }
}