//i said udp but it is just server connect
void onL() {
  statemod=1;

  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
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
        gmod=3;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) {
      rect(width/2-140, 380, 280, 70);
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text("sign up is not supported", width/2, 415);
      /*  
       if (click==1) {
       gmod=4;
       click=0;
       }
       */
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}

void onlL() {

  loginCache=-1;
  statemod=1;


  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("ID", width/2, 335);
  text("PASSWORD", width/2, 415);
  text("Login", width/2, 495);


  textAlign(LEFT, TOP);
  fill(255, 0, 0);
  textSize(16);
  if (loginID.length()==8) text("ID should be shorter than 9 letters", width/2+155, 335);
  if (loginPD.length()==8) text("PASSWORD should be shorter than 9 letters", width/2+155, 415);
  if (invalidIDPD==1) text("invalid ID or PASSWORD", width/2+155, 495);
  textAlign(CENTER, CENTER);
  strokeWeight(5);
  stroke(249, 100, 45);
  textSize(48);

  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) {
      cursor(TEXT);
      rect(width/2-140, 300, 280, 70);
      fill(0);
      text(loginID, width/2, 335);
      loginCache=0;
    } else if (mouseY>380&&mouseY<450) {
      cursor(TEXT);
      rect(width/2-140, 380, 280, 70);
      fill(0);
      text(loginPD, width/2, 415);
      loginCache=1;
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      fill(0);
      text("Login?", width/2, 495);
      if (click==1) {
        gmod = -3;
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


  if (loginCache==5) {
    fill(23, 93, 126);
    rect(width/2-140, 460, 280, 70);
    fill(0);
    text("Login Success!!", width/2, 495);
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

  textSize(48);
  textAlign(LEFT, CENTER);
  text("ID : "+loginID, 50, 335);
}