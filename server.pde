void recieveServer() {
  String ServerRead = myClient.readString();
  String lineRead[] = split(ServerRead, "::");
  log.println("ServerRead : "+ServerRead);
  log.println("loginCache : "+loginCache);

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
          myClient.write("2"+":"+DeviceID+":"+loginID+":"+md5+"::");
        }
      } else if (lineCache[0].equals("2")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          loginCache=4;
          gmod = -750;
        } else {
          loginCache=-1;
          gmod = -700;
          validIDPDLI=1;
        }
      }
    }
    ///////////////////////////////////////////
    //end login
    //world join available
    if (lineCache[0].equals("w") && lineCache.length>1) {

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