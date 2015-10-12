//v0.4.1
//beware for singleAI in ai check time.
void draw() {

  if (myClient.available()>0) recieveServer();

  if (escmod == 0) menu();
  else switch(gmod) {
  case 0:
    statM(); // start menu
    break;

  case 1:
    snglP(); // singlePlay
    break;

  case 2:
    onL(); // onlinePlay
    break;

  case 3:
    onlL(); // online login
    break;

  case -3:
    onlLR(); // online login request to server
    break;

  case 10:
    onlLVSBefore(); // online play with others before for waiting
    break;

  case 4:
    onlS(); // ?
    break;

  case -4:
    onlP(); //online play
    break;

  case 5:
    aWin(); // a win
    break;

  case 6:
    bWin(); // b win
    break;

  case 7:
    help(); // help
    break;
  }
  if (statemod==1) state();

  click=0;
}

void mouseReleased() {
  if (escmod==0) click=1;
  else if (clicked==1) click=-1;
  else click=1;

  clicked+=1;
}

void keyPressed() {
  if (key == TAB) {
    if (escmod == -1) escmod=0;
    else escmod=-1;
  } else if ((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) {
    if (loginCache==0&&loginID.length()<8) {
      loginID = loginID + key;
      loginID = trim(loginID);
    } else if (loginCache==1&&loginPD.length()<8) {
      loginPD = loginPD + key;
      loginPD = trim(loginPD);
    }
  } else if (key==ENTER) {
    if (loginCache==-1||loginCache==0||loginCache==1) {
      loginCache=-1;
      gmod= -3;
      click=0;
    }
  } else if (key == DELETE||key == BACKSPACE) {
    if (loginCache==0&&loginID.length()>0) loginID = loginID.substring(0, loginID.length()-1);
    if (loginCache==1&&loginPD.length()>0) loginPD = loginPD.substring(0, loginPD.length()-1);
  }
}

void recieveServer() {
  String ServerRead = myClient.readString();
  String lineRead[] = split(ServerRead, "::");
  println(ServerRead);
  println(loginCache);

  for (int i=0; i<lineRead.length; i++) {
    String lineCache[] = split(lineRead[i], ":");
    //about login
    if (loginCache==3) {
      if (lineCache[0].equals("1")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          myClient.write("2"+":"+DeviceID+":"+loginID+":"+loginPD+"::");
        }
      } else if (lineCache[0].equals("2")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          loginCache=4;
          gmod=10;
        } else {
          loginCache=-1;
          gmod=3;
          invalidIDPD=1;
        }
      }
    }
    ///////////////////////////////////////////
    //end login
    //world join available
    if (lineCache[0].equals("w")) {

      //gameplay start
      if (lineCache[1].equals("start")) {
        if (lineCache[3].equals(loginID) || lineCache[4].equals(loginID)) {
          if (lineCache[3].equals(loginID)) {
            enemyID=lineCache[4];
            turn = 0;
          } else {
            enemyID=lineCache[3];
            turn = 1;
          }
          onlineJoinRoom = parseInt(lineCache[2]);
          roomRequested = 2;
          statemod=0;
          gmod=-4;
        }
        
        //w+play+worldID+playerID+action+xcoordinate+ycoordinate
      } else if (lineCache[1].equals("play")&&parseInt(lineCache[2])==onlineJoinRoom) {
        if (lineCache[3].equals(enemyID)) {
          // lastEnemyAction 0 default, 1 is quod, 2 is quaz, 3 is say quod(squd)
          if (lineCache[4].equals("quod")) {
            lastEnemyAction = 1;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          } else if (lineCache[4].equals("quaz")) {
            lastEnemyAction = 2;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          } else if (lineCache[4].equals("squd")) {//say there is quod
            lastEnemyAction = 3;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          }
        }
      } else worldValid=parseInt(lineCache[1]);
    }
    //world join available end
  }
}