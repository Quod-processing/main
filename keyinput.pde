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
  }
  if (inputmod == 710) {
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && loginID.length()<8) {
      loginID = loginID + key;
      loginID = trim(loginID);
    } else if ((key == DELETE||key == BACKSPACE) && loginID.length()>0) loginID = loginID.substring(0, loginID.length()-1);
  } else if (inputmod == 720) {
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && loginPD.length()<8) {
      loginPD = loginPD + key;
      loginPD = trim(loginPD);
    } else if ((key == DELETE||key == BACKSPACE) && loginPD.length()>0) loginPD = loginPD.substring(0, loginPD.length()-1);
  } else if (inputmod == 4010) {
    if (( key>= '0' && key <= '9') || key == '.') Settings[2] = Settings[2] + key;
    else if ((key == DELETE||key == BACKSPACE) && Settings[2].length()>0) Settings[2] = Settings[2].substring(0, Settings[2].length()-1);
  }

  if (gmod == 700) {
    if (key==ENTER) {
      loginCache=-1;
      gmod= -3;
      click=0;
    }
  }
}