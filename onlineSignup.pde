// online signup
void onlPS1() {
  gmod = -gmod;
}
void onlPS2() {
  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 135, 38);
  textSize(36);
  text("Sign up", width/2, 170);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("ID", width/2, 335);
  text("PASSWORD", width/2, 415);
  text("Sign up", width/2, 495);

  textAlign(LEFT, TOP);
  fill(255, 0, 0);
  textSize(16);
  if (signupID.length()==8) text("ID should be shorter than 9 letters", width/2+155, 335);
  if (signupPD.length()==8) text("PASSWORD should be shorter than 9 letters", width/2+155, 415);
  if (validIDPDSU==1) text("inconsistent PASSWORD", width/2+155, 495);
  textAlign(CENTER, CENTER);
  strokeWeight(5);
  stroke(249, 100, 45);
  textSize(48);


  fill(241, 232, 212);
  if (mouseY>300&&mouseY<370&&mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    cursor(TEXT);
    rect(width/2-140, 300, 280, 70);
    fill(0);
    text(signupID, width/2, 335);
    inputmod = 810;
  } else if (mouseY>380&&mouseY<450&&mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    cursor(TEXT);
    rect(width/2-140, 380, 280, 70);
    fill(0);
    text(signupPD, width/2, 415);
    inputmod = 820;
  } else if (mouseY>460&&mouseY<530&&mouseX>(width/2-140)&&mouseX<(width/2+140)&&signupPDC.equals(signupPD)&&!signupPDC.equals(" ")) {
    rect(width/2-140, 460, 280, 70);
    fill(0);
    text("Sign up?", width/2, 495);
    if (click==1) {
      gmod = 810;
      click = 0;
    }
  } else if (!signupPD.equals(" ")) {
    cursor(ARROW);
    rect(width/2+160, 380, 280, 70);
    fill(0);
    textSize(48);
    text(signupPDC, width/2+300, 415);
    
    if (signupPDC.equals(" ")) {
      textSize(36);
      text("RETYPE PASSWORD", width/2+300, 415);
    }
    
    if (!signupPDC.equals(signupPD)) {
      fill(255, 0, 0);
      textSize(16);
      text("Passwords do not match", width/2+300, 470);
    }
    inputmod = 830;
  }
}

void onlSR(){
    if (signupCache==-1) {
    DeviceID=str((int)random(1000, 9999));
    signupCache=3;
    myClient.write("1"+":"+DeviceID+":"+loginID+"::");
  }
}