//i said udp but it is just server connect
void onlP() {
  background(184, 241, 241);
  showBlock();

  //red, playerA
  fill(255, 0, 0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text(loginID, 124, 40);

  //timepannel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  //show number of quaz left
  if (quazA>0) {
    fill(255, 227, 212);
    rect(0, 220, 248, 40);
  }
  if (quazA>1) {
    fill(255, 212, 194);
    rect(0, 270, 248, 40);
  }
  if (quazA>2) {
    fill(255, 197, 188);
    rect(0, 320, 248, 40);
  }
  if (quazA>3) {
    fill(255, 163, 162);
    rect(0, 370, 248, 40);
  }
  if (quazA>4) {
    fill(231, 94, 90);
    rect(0, 420, 248, 40);
  }
  if (quazA>5) {
    fill(187, 62, 69);
    rect(0, 470, 248, 40);
  }

  //turn of A
  if (turn == 0) {
    aiTurn=1;//set Ai for compute

    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI)- HALF_PI;//100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);   
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);


    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          //w+worldID+playerID+action+xcoordinate+ycoordinate
          myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"quod"+":"+lastBlockX+":"+lastBlockY+"::");
          turn=2;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"quaz"+":"+int((mouseX-204)/57)+":"+int((mouseY+44)/57)+"::");
          quazA-=1;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"squd"+":"+1+":"+1+"::");
      quazA-=1;
      turn=1;
      timeA=0;
    }

    if (timeA<-2400) {
      turn = 1; // turn A end for time limit
      timeA = 0;
      timeB = 0;
    }
  }

  if (turn==2) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);  
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);

    if (click==1&&mouseX<248&&mouseY>540)
    {

      chkQd(0);
      myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"squd"+":"+1+":"+1+"::");
      turn=1;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      turn=1; // turn A end for tiem limit
      timeA=0;
    }
  }

  ///////////////////////////////////////////////

  //blue, playerB
  fill(0, 0, 255);
  textSize(48);
  text(enemyID, 1012, 40);
  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);


  if (quazB>0) {
    fill(212, 163, 110);
    rect(888, 220, 248, 40);
  }
  if (quazB>1) {
    fill(196, 132, 85);
    rect(888, 270, 248, 40);
  }
  if (quazB>2) {
    fill(156, 97, 71);
    rect(888, 320, 248, 40);
  }
  if (quazB>3) {
    fill(131, 88, 74);
    rect(888, 370, 248, 40);
  }
  if (quazB>4) {
    fill(110, 76, 68);
    rect(888, 420, 248, 40);
  }
  if (quazB>5) {
    fill(79, 69, 64);
    rect(888, 470, 248, 40);
  }


  if (turn==1) {
    //hand of timepannel
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 3000, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    textSize(60); 
    noStroke();
    fill(193, 243, 214);
    rect(0, 540, 248, 100);
    fill(0);
    text("wait", 124, 590);
    fill(255, 238, 96);
    rect(888, 540, 248, 100);
    fill(0);
    text("finish", 1012, 590);


    //mouse click check
    if (lastEnemyAction == 1) {//quod
      lastBlockX = enemyBlkX;
      lastBlockY = enemyBlkY;
      blk[lastBlockX][lastBlockY] = 3;
      lastEnemyAction = 0;
      turn=3;
      timeB=0;
    } else if (lastEnemyAction == 2) { //quaz
      quazB-=1;
      blk[enemyBlkX][enemyBlkY] = 0;
      lastEnemyAction = 0;
    } else if (lastEnemyAction == 3) {//say there is quod
      chkQd(1);
      lastEnemyAction = 0;
      quazB-=1;
      turn=0;
      timeB=0;
    }


    //time end check
    if (timeB<-3000) {
      turn=0; // turn A end for tiem limit
      timeB=0;
    }
  } else if (turn==3) {
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    textSize(60); 
    noStroke();
    fill(193, 243, 214);
    rect(0, 540, 248, 100);
    fill(0);
    text("wait", 124, 590);
    fill(255, 238, 96);
    rect(888, 540, 248, 100);
    fill(0);
    text("finish", 1012, 590);

    //say there is quod
    if (lastEnemyAction == 3) {//say there is quod
      chkQd(1);
      lastEnemyAction = 0;
      quazB-=1;
      turn = 0;
      timeB=0;
    }
    //end of time limit
    if (timeB<-250) {
      turn=0; // turn A end for tiem limit
      timeB=0;
    }
  }
}