{
#Program calculates ionization of each atomic/molecular lines in the input linelist, and determines what "level" of ionization
#that line is at (i.e., ionized III, IV, VI, etc...).
 newspecid = substr($0,1,12) 
 nlines = $2
 #Assigns the keyword 'id' to an integer of the atomic number of each atomic/molecular line
 id = int(newspecid)
 ion = (newspecid - id ) * 100 + 1
 if (newspecid * 1.0 == 108.16) molid = 108.001016
 else if (newspecid * 1.0 == 101.01) molid = 101.001001
 else if (newspecid * 1.0 == 101.02) molid = 101.001002
 else if (newspecid * 1.0 == 114.28) molid = 114.001028
 else if (newspecid * 1.0 == 114.29) molid = 114.001029
 else if (newspecid * 1.0 == 114.30) molid = 114.001030
 else if (newspecid * 1.0 == 606.12) molid = 606.012012
 else if (newspecid * 1.0 == 606.13) molid = 606.012013
 else if (newspecid * 1.0 == 606.33) molid = 606.013013
 else if (newspecid * 1.0 == 607.12) molid = 607.012014
 else if (newspecid * 1.0 == 607.13) molid = 607.013014
 else if (newspecid * 1.0 == 607.15) molid = 607.012015
 else if (newspecid * 1.0 == 608.12) molid = 608.012016
 else if (newspecid * 1.0 == 608.13) molid = 608.013016
 else if (newspecid * 1.0 == 608.17) molid = 608.012017
 else if (newspecid * 1.0 == 608.18) molid = 608.012018
 else if (newspecid * 1.0 == 126.56) molid = 126.001056
#Assigns ionization level to each line 
iontype = "I "
 if (substr(newspecid,7,3) == ".01") iontype = "II"
 if (substr(newspecid,7,3) == ".02") iontype = "III"
 if (substr(newspecid,7,3) == ".03") iontype = "IV"
 if (substr(newspecid,7,3) == ".04") iontype = "V "
 if (substr(newspecid,7,3) == ".05") iontype = "VI"
 if (substr(newspecid,7,3) == ".06") iontype = "VII"
 if (substr(newspecid,7,3) == ".07") iontype = "VIII"
 if (substr(newspecid,7,3) == ".08") iontype = "IX"
 if (newspecid * 1.0 < 100 && substr($0,10,3) == "000" && newspecid * 1.0 > 1.5 && (iontype == "II" || iontype == "III" || iontype == "I ")) printf("'%7.4f             '%5.0f%10i\n",id,ion,nlines)
 else if (newspecid * 1.0 < 100 && substr($0,10,3) != "000" && newspecid * 1.0 > 1.5 && (iontype == "II" || iontype == "III" || iontype == "I ")) printf("'%7.4f             '%5.0f%10i\n",id + substr($0,10,3)/1000,ion,nlines)
 #else printf("'%11.6f         '%5.0f%10i\n",molid,1,nlines)
#Assigns element abbreviation to each line depending on its atomic number
 if (id ==  1) type = "H "
 if (id ==  2) type = "HE"
 if (id ==  3) type = "LI"
 if (id ==  4) type = "BE"
 if (id ==  5) type = "B "
 if (id ==  6) type = "C "
 if (id ==  7) type = "N "
 if (id ==  8) type = "O "
 if (id ==  9) type = "F "
 if (id == 10) type = "NE"
 if (id == 11) type = "NA"
 if (id == 12) type = "MG"
 if (id == 13) type = "AL"
 if (id == 14) type = "SI"
 if (id == 15) type = "P "
 if (id == 16) type = "S "
 if (id == 17) type = "CL"
 if (id == 18) type = "AR"
 if (id == 19) type = "K "
 if (id == 20) type = "CA"
 if (id == 21) type = "SC"
 if (id == 22) type = "TI"
 if (id == 23) type = "V "
 if (id == 24) type = "CR"
 if (id == 25) type = "MN"
 if (id == 26) type = "FE"
 if (id == 27) type = "CO"
 if (id == 28) type = "NI"
 if (id == 29) type = "CU"
 if (id == 30) type = "ZN"
 if (id == 31) type = "GA"
 if (id == 32) type = "GE"
 if (id == 33) type = "AS"
 if (id == 34) type = "SE"
 if (id == 35) type = "BR"
 if (id == 36) type = "KR"
 if (id == 37) type = "RB"
 if (id == 38) type = "SR"
 if (id == 39) type = "Y "
 if (id == 40) type = "ZR"
 if (id == 41) type = "NB"
 if (id == 42) type = "MO"
 if (id == 43) type = "TC"
 if (id == 44) type = "RU"
 if (id == 45) type = "RH"
 if (id == 46) type = "PD"
 if (id == 47) type = "AG"
 if (id == 48) type = "CD"
 if (id == 49) type = "IN"
 if (id == 50) type = "SN"
 if (id == 51) type = "SB"
 if (id == 52) type = "TE"
 if (id == 53) type = "I "
 if (id == 54) type = "XE"
 if (id == 55) type = "CS"
 if (id == 56) type = "BA"
 if (id == 57) type = "LA"
 if (id == 58) type = "CE"
 if (id == 59) type = "PR"
 if (id == 60) type = "ND"
 if (id == 61) type = "PM"
 if (id == 62) type = "SM"
 if (id == 63) type = "EU"
 if (id == 64) type = "GD"
 if (id == 65) type = "TB"
 if (id == 66) type = "DY"
 if (id == 67) type = "HO"
 if (id == 68) type = "ER"
 if (id == 69) type = "TM"
 if (id == 70) type = "YB"
 if (id == 71) type = "LU"
 if (id == 72) type = "HF"
 if (id == 73) type = "TA"
 if (id == 74) type = "W "
 if (id == 75) type = "RE"
 if (id == 76) type = "OS"
 if (id == 77) type = "IR"
 if (id == 78) type = "PT"
 if (id == 79) type = "AU"
 if (id == 80) type = "HG"
 if (id == 81) type = "TL"
 if (id == 82) type = "PB"
 if (id == 83) type = "BI"
 if (id == 84) type = "PO"
 if (id == 85) type = "AT"
 if (id == 86) type = "RN"
 if (id == 87) type = "FR"
 if (id == 88) type = "RA"
 if (id == 89) type = "AC"
 if (id == 90) type = "TH"
 if (id == 91) type = "PA"
 if (id == 92) type = "U "
 if (id == 93) type = "NP"
 if (id == 94) type = "PU"
 if (id == 95) type = "AM"
 if (id == 96) type = "CM"
 if (id == 97) type = "BK"
 if (id == 98) type = "CF"
 if (id == 99) type = "ES"
 if (newspecid * 1.0 < 100 && newspecid * 1.0 > 1.5 && (iontype == "II" || iontype == "III" || iontype == "I ")) printf("'%2s %s'\n",type,iontype)


 while ((getline < inputfile) && newspecid * 1.0 > 1.5 && (iontype == "II" || iontype == "III" || iontype == "I ")) {
  if (substr($0,1,1) != "#") {
    count = count + 1
    specid = substr($0,47,8) * 1.0
    if (specid * 1.0 == substr(newspecid,2,8) * 1.0 ) {
     iso2 = substr($0,143,3)
     isof = substr($0,146,6) 
     if((substr(newspecid,10,3)*1.0 != 0 && iso2*1.0 == substr(newspecid,10,3)*1.0 && isof * 1.0 != 0) || (substr(newspecid,10,3)*1.0 == 0 && isof*1.0 == 0) ) {
      lam = substr($0,1,9) * 10.0
      orggf = substr($0,11,7) 
      newgf = substr($0,19,7) 
      enewgf = substr($0,27,4)
      if (enewgf == "    ") enewgf = 9.99
      snewgf = substr($0,32,3)
      astgf = substr($0,35,7)
      sastgf = substr($0,43,3)
      EP1 = substr($0,55,12)
      J1 = substr($0,67,5)
      EP1id = substr($0,72,11)
      EP2 = substr($0,83,12)
      J2 = substr($0,95,5)
      EP2id = substr($0,100,11)
      Rad = substr($0,111,6)
      sta = substr($0,117,6)
      vdW = substr($0,123,6)
      unlte = substr($0,130,2)
      lnlte = substr($0,132,2)
      iso1 = substr($0,134,3)
      hyp = substr($0,137,6) 
      hE1 = substr($0,152,5)
      hE2 = substr($0,157,5)
      g1 = substr($0,168,5)
      g2 = substr($0,173,5)
      vdWorg = substr($0,178,3)
      vdWast = substr($0,181,6)
      if (vdWast * 1.0 < -1.0 ) vdW = vdWast
      if (EP1 * 1 < 0) { ep = EP1 * -1; gu = (J2 * 2.0) + 1}
      else {ep = EP1; gu = (J2 * 2.0) + 1}
      if (EP2 * 1 < 0) { EP2 = EP2 * -1}
      if (EP2 * 1 < ep * 1 ) {ep = EP2; gu = (J1 * 2.0) + 1; junk = EP1id; EP1id = EP2id; EP2id = junk}
      if (J2 == "     " || J1 == "     ") gu = 99
      ep = ep * 1.24e-4
      if ( astgf != "       ") gf = astgf + hyp + isof
      else if ( newgf != "       ") gf = newgf + hyp + isof
      else gf = orggf + hyp + isof
      if (newspecid *1.0 < 100 && newspecid *1.0 > 1.5) printf("%10.3f %6.3f %7.3f %9.2f %6.1f %9.2e 'x' 'x' 0.0 1.0 '%2s %3s %11s %11s'\n",lam, ep, gf,vdW, gu, 10^(Rad)-1,type,iontype,EP1id,EP2id)
#       if (iontype ="II") printf("%10.3f %6.3f %7.3f %9.2f %6.1f %9.2e 'x' 'x' \n",lam, ep, gf,vdW, gu, 10^(Rad)-1)
      }
     }
  }
 }  
 count = 0
 close (inputfile)
  
  
}
