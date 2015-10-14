//v0.5.0
//beware for singleAI in ai check time.
void draw() {
  println("frameRate : "+frameRate);
  println("gmod : "+gmod);
  println("X : "+mouseX+" Y : "+mouseY);
  
  inputmod = -1;
  
  if (myClient.available()>0) recieveServer();

  if (escmod == 0) menu();
  else switch(gmod) {
  
  case -100:
    loadS1();
  case 100:
    loadS2();
    break;

  case -200:
    statM1(); // start menu
  case 200:
    statM2();
    break;

  case -300:
    snglP1(); // singlePlay
  case 300:
    snglP2(); // singlePlay
    break;
    
  case -400:
    snglPai1();
  case 400:
    snglPai2();
    break;

  case -500:
    snglPvs1();    
  case 500:
    snglPvs2();
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


  case -900:
    onlPvs1(); //online play
    break;
      case 900:
    onlPvs2(); //online play
    break;
    
  case -1000:
  case 1000:
    aWin(); // a win
    break;
    
  case -2000:
  case 2000:
    bWin(); // b win
    break;

  case -3000:
  case 3000:
    help(); // help
    break;
  }
  if (statemod==1) state();

  click=0;
}

void mouseReleased() {
  click = 1;
}

void keyPressed() {
  if (key == TAB) {
    if (escmod == -1) escmod=0;
    else {
      escmod=-1;
      gmod = -gmod;
    }
  } else if ((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9') || key == '.') {
    if (inputmod == 4010){
      Settings[2] = Settings[2] + key;
    }
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
    if (inputmod == 4010 && Settings[2].length()>0) Settings[2] = Settings[2].substring(0, Settings[2].length()-1);
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
          byte[] md5hash = messageDigest5(loginPD, "MD5");
          String md5string="";
          String md5="";
          for (int imd5=0; imd5<md5hash.length; imd5++) md5string+=(hex(md5hash[imd5], 2));
          md5=md5string.toLowerCase();
          println(md5);
          myClient.write("2"+":"+DeviceID+":"+loginID+":"+md5+"::");
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
          gmod=-900;
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