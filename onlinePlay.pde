//online play before menus
void onlP1() {
  statemod=1;
  
  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 135, 38);
  textSize(36);
  text("Online Play", width/2, 170);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Log in", width/2, 335);
  text("Sign up", width/2, 415);
  text("Back", width/2, 495);
  gmod = -gmod;
}
void onlP2() {
  statemod=1;
  
  noStroke();
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);

  textAlign(CENTER, CENTER);
  fill(0);
  textSize(48);
  text("Log in", width/2, 335);
  text("Sign up", width/2, 415);
  text("Back", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) {
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        gmod = -700;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) {
      rect(width/2-140, 380, 280, 70);
      if(click == 1) {
        gmod = -800;
        click = 0;
      }
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}


void onlLVSBefore() {
  statemod=1;
  cursor(ARROW);
  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);

  textSize(30);    
  textAlign(CENTER, BOTTOM);
  switch(worldValid%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("0/2", width/2-110, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("1/2", width/2-110, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("2/2", width/2-110, 360);
    break;
  }  
  switch((worldValid/10)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("0/2", width/2, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("1/2", width/2, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("2/2", width/2, 360);
    break;
  }  
  switch((worldValid/100)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("0/2", width/2+110, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("1/2", width/2+110, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("2/2", width/2+110, 360);
    break;
  }  
  switch((worldValid/1000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("0/2", width/2-110, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("1/2", width/2-110, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("2/2", width/2-110, 470);
    break;
  }  
  switch((worldValid/10000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("0/2", width/2, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("1/2", width/2, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("2/2", width/2, 470);
    break;
  }  
  switch((worldValid/100000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("0/2", width/2+110, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("1/2", width/2+110, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("2/2", width/2+110, 470);
    break;
  }
  if (roomRequested == 0) {
    fill(0);
    textAlign(CENTER, TOP);
    if (mouseX>width/2-160&&mouseX<=width/2-60&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2-110, 360);
      if (click==1) {
        myClient.write("w"+":"+"1"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-160&&mouseX<=width/2-60&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2-110, 470);
      if (click==1) {
        myClient.write("w"+":"+"4"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-50&&mouseX<=width/2+50&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2, 360);
      if (click==1) {
        myClient.write("w"+":"+"2"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-50&&mouseX<=width/2+50&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2, 470);
      if (click==1) {
        myClient.write("w"+":"+"5"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2+60&&mouseX<=width/2+160&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2+110, 360);
      if (click==1) {
        myClient.write("w"+":"+"3"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2+60&&mouseX<=width/2+160&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2+110, 470);
      if (click==1) {
        myClient.write("w"+":"+"6"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    }
  } else if ((worldValid/pow(10, onlineJoinRoom-1))%10==3) gmod=-900;



//player info
  textSize(48);
  textAlign(LEFT, CENTER);
  text("ID : "+loginID, width-300, 250);
  
}