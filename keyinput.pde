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
  
  switch(inputmod){
    
   case 710:
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && loginID.length()<10) {
      loginID = loginID + key;
      loginID = trim(loginID);
    } else if ((key == DELETE||key == BACKSPACE) && loginID.length()>0) loginID = loginID.substring(0, loginID.length()-1);
    break;
    
  case 720:
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && loginPD.length()<10) {
      loginPD = loginPD + key;
      loginPD = trim(loginPD);
    } else if ((key == DELETE||key == BACKSPACE) && loginPD.length()>0) loginPD = loginPD.substring(0, loginPD.length()-1);
    break;
    
  case 810:
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && signupID.length()<10) {
      signupID = signupID + key;
      signupID = trim(signupID);
    } else if ((key == DELETE||key == BACKSPACE) && signupID.length()>0) signupID = signupID.substring(0, signupID.length()-1);
    break;
    
  case 815:
    if (((key >= 'a' && key <= 'z') || ( key>= '0' && key <= '9') || ( key=='.')) && signupEmail.length()<15) {
      signupEmail = signupEmail + key;
      signupEmail = trim(signupEmail);
    } else if ((key == DELETE||key == BACKSPACE) && signupEmail.length()>0) signupEmail = signupEmail.substring(0, signupEmail.length()-1);
    break;
    
  case 820:
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && signupPD.length()<10) {
      signupPD = signupPD + key;
      signupPD = trim(signupPD);
    } else if ((key == DELETE||key == BACKSPACE) && signupPD.length()>0) signupPD = signupPD.substring(0, signupPD.length()-1);
    break;
    
  case 830:
    if (((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) && signupPDC.length()<10) {
      signupPDC = signupPDC + key;
      signupPDC = trim(signupPDC);
    } else if ((key == DELETE||key == BACKSPACE) && signupPDC.length()>0) signupPDC = signupPDC.substring(0, signupPDC.length()-1);
    break;
    
  case 4010:
    if (( key>= '0' && key <= '9') || key == '.') Settings[2] = Settings[2] + key;
    else if ((key == DELETE||key == BACKSPACE) && Settings[2].length()>0) Settings[2] = Settings[2].substring(0, Settings[2].length()-1);
    break;
    
  }
  
  if (gmod == 700) {
    if (key==ENTER) {
      loginCache=-1;
      gmod = 710;
      click=0;
    }
  }
}