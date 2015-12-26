//snglPvs() single play 1 vs 1 in one computer
void snglPvs1() {

  background(243, 241, 228);
  showBlock();
  showQuaz();//show number of quaz left

  //red, playerA
  fill(255, 0, 0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("A", 124, 40);

  //blue, playerB
  fill(0, 0, 255);
  textSize(48);
  text("B", 1012, 40);

  //downside ui
  if (turn == 4) {
    textSize(60);          
    noStroke();          
    fill(248, 236, 114);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);    
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 6) {
    textSize(60);          
    noStroke();          
    fill(248, 236, 114);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);    
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 5) {
    textSize(60);     
    noStroke();     
    fill(193, 243, 214);     
    rect(0, 540, 248, 100);     
    fill(0);     
    text("wait", 124, 590);         
    fill(248, 236, 114);          
    rect(888, 540, 248, 100);          
    fill(0);          
    text("quod", 1012, 590);
  } else if (turn == 7) {
    textSize(60);     
    noStroke();     
    fill(193, 243, 214);     
    rect(0, 540, 248, 100);     
    fill(0);     
    text("wait", 124, 590);         
    fill(248, 236, 114);          
    rect(888, 540, 248, 100);          
    fill(0);          
    text("quod", 1012, 590);
  }

  gmod = -gmod;
}

void snglPvs2() {

  //red, playerA
  //timepanel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  if (turn==4) {
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          turn=6;
          gmod = -gmod;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazA-=1;
          gmod = -gmod;
        }
      }
    }
    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      quazA-=1;
      turn=5;
      gmod = -gmod;
      timeA=0;
    }   

    if (timeA<-2400) {
      turn=5; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }

  if (turn==6) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      turn=5;
      gmod = -gmod;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      turn=5; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }


  ////////////////////////////////////////////////

  //blue, player B

  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (turn==5) {
    //hand of timepannel
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 3000, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=3;        
          turn=7;
          gmod = -gmod;
          timeB=0;
        } else if (mouseButton == RIGHT&&quazB>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazB-=1;
          gmod = -gmod;
        }
      }
    }
    //say there is quod
    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      quazB-=1;
      turn=4;
      gmod = -gmod;
      timeB=0;
    }   

    if (timeB<-3000) {
      turn=4; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }

  if (turn==7) {
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      turn=4;
      gmod = -gmod;
      quazB-=1;
      timeB=0;
    }      

    if (timeB<-250) {
      turn=4; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }
}