//statM : start menu
//loadS : load screne

void loadS1() {
  //frameRate(30);
  statemod=1;

  background(243, 241, 228);
  fill(23, 93, 126);
  textSize(120);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  textSize(36);
  fill(255, 135, 38);
  text("v0.6.1", width/2, 170);
  textSize(48);
  fill(0);
  textAlign(CENTER, BOTTOM);
  text("click to start!", width/2, height-10);

  //set loadS2
  gmod = -gmod;
}
void loadS2() {
  statemod=1;

  noStroke();
  fill(243, 241, 228);
  rect(45, 0, 200, 50);
  if (frameCount>48) frameCount=0;
  fill(0, (abs(frameCount-25)%26)*10);
  textSize(40);
  textAlign(LEFT, CENTER);
  text("'TAB' to set", 50, 25);

  if (click == 1) {
    gmod = -200;
    click = 0;
  }
}

void statM1() {
  statemod=1;
  background(243, 241, 228);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  textSize(36);
  fill(255, 135, 38);
  text("for OS X", width/2, 170);
  fill(241, 232, 212);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Online Play", width/2, 415);
  text("Help", width/2, 495);

  gmod = - gmod;
}

void statM2() {
  statemod=1;
  noStroke();
  textAlign(CENTER, CENTER);
  fill(241, 232, 212);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Online Play", width/2, 415);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(255, 206, 160);
    if (mouseY>300&&mouseY<370) { // Local Play
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        gmod=-300;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) { // Online Play
      rect(width/2-140, 380, 280, 70);

      if (serverstate==0 || myClient.active()==false) {
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(24);
        text("server connection fail", width/2, 415);
        if (click == 1) {
          thread("connectServer"); //retry to connect
          click = 0;
        }
      } else if (click==1) {
        gmod = -600;
        click=0;
      } else {
        fill(0);
        textSize(48);
        text("Online Play", width/2, 415);
      }
    } else if (mouseY>460&&mouseY<530) { // Help
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        link("http://www.mileu.ml");
        gmod=3000;
        click=0;
      }
    }
  }
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Help", width/2, 495);
}