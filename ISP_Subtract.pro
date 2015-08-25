pro subtractalldates

 path = '/home/berdis/V356Sgr/V356_raw_data'
 readcol, path + '/txt/datesonlyall.txt', dates, FORMAT='A' ;Dates that we want to read into later

 Pperp= 0.79346555     ; Value outputted from serkfit, "Umax" top of serk curve
 lambdamax= 6059.5946  ; Value outputted from serkfit, wavelength that corresponds to top of serk curve
 PAfs1= 21.552112      ; Position Angles from field star ISP estimates
 PAfs2= 32.072476      ;  "    "
 PAfs3= 19.626629      ;  "    "
 PAfs4= 27.857947      ;  "    "

 K = (1.68E-4)*(lambdamax) - 0.002    ;Defined as K term in Serkowski law

 Ppar1 = Pperp/(tan(2*(!dtor*PAfs1))) ;Computes parallel component for PAfs1
 Pisp1 = sqrt((Pperp^2) + (Ppar1^2))  ;Computes total ISP for PAfs1

 Ppar2 = Pperp/(tan(2*(!dtor*PAfs2))) ;Computes parallel component for PAfs2
 Pisp2 = sqrt((Pperp^2) + (Ppar2^2))  ;Computes total ISP for PAfs2

 Ppar3 = Pperp/(tan(2*(!dtor*PAfs3))) ;Computes parallel component for PAfs3
 Pisp3 = sqrt((Pperp^2) + (Ppar3^2))  ;Computes total ISP for PAfs3

 Ppar4 = Pperp/(tan(2*(!dtor*PAfs4))) ;Computes parallel component for PAfs4
 Pisp4 = sqrt((Pperp^2) + (Ppar4^2))  ;Computes total ISP for PAfs4

openw, 1, '/home/berdis/Desktop/ISPvalues', WIDTH=250
printf,1,Ppar1, Pisp1
printf,1,Ppar2, Pisp2
printf,1,Ppar3, Pisp3
printf,1,Ppar4, Pisp4
close, 1


for i=0, N_ELEMENTS(dates)-1 do begin ;create for loop to read in data from files
  
  readcol,path + '/txt/CCDtxt/Blue/'+dates[i]+ 'b.txt', bWave, bFlux, bq, bu, berr, FORMAT='D,D,D,D,D' ;read in rotated blue files by date
  readcol,path + '/txt/CCDtxt/Red/'+dates[i]+'r.txt', rWave, rFlux, rq, ru, rerr, FORMAT='D,D,D,D,D' ;read in rotated red files by date
  
;----------------------------------------------------------------------------------------------------------------------
; Blue data
 bPollam1=dblarr(N_ELEMENTS(bWave))  ; P(lambda) in Serkowski Law
 buintr1=dblarr(N_ELEMENTS(bWave))   ; U Intrinsic (subtracted)
 bqintr1=dblarr(N_ELEMENTS(bWave))   ; Q Intrinsic (subtracted)
 buisp1=dblarr(N_ELEMENTS(bWave))    ; U ISP - Calculated from P(lambda) at each wavelength
 bqisp1=dblarr(N_ELEMENTS(bWave))    ; Q ISP -  "   "

 bPollam2=dblarr(N_ELEMENTS(bWave))
 buintr2=dblarr(N_ELEMENTS(bWave))
 bqintr2=dblarr(N_ELEMENTS(bWave))
 buisp2=dblarr(N_ELEMENTS(bWave))
 bqisp2=dblarr(N_ELEMENTS(bWave))

 bPollam3=dblarr(N_ELEMENTS(bWave))
 buintr3=dblarr(N_ELEMENTS(bWave))
 bqintr3=dblarr(N_ELEMENTS(bWave))
 buisp3=dblarr(N_ELEMENTS(bWave))
 bqisp3=dblarr(N_ELEMENTS(bWave))

 bPollam4=dblarr(N_ELEMENTS(bWave))
 buintr4=dblarr(N_ELEMENTS(bWave))
 bqintr4=dblarr(N_ELEMENTS(bWave))
 buisp4=dblarr(N_ELEMENTS(bWave))
 bqisp4=dblarr(N_ELEMENTS(bWave))  

 
  for j=0, N_ELEMENTS(bWave)-1 do begin 
    bPollam1[j] = Pisp1*exp(-K*((alog(lambdamax/bWave[j]))^2))   ;Calculates ISP total polarization at each wavelength
    buisp1[j]=bPollam1[j]*sin(2*(!dtor*PAfs1))                   ;Calculates ISP U at each wavelength
    buintr1[j]=bu[j] - buisp1[j]                                  ;Subtracts Uisp from total to get Uintrinsic
    bqisp1[j]=bPollam1[j]*cos(2*(!dtor*PAfs1))                   ;Calculates ISP Q at each wavelength
    bqintr1[j]=bq[j] - bqisp1[j]                                  ;Subtracts Qisp from total to get Qintrinsic
  endfor
  
  for j=0, N_ELEMENTS(bWave)-1 do begin 
    bPollam2[j] = Pisp2*exp(-K*((alog(lambdamax/bWave[j]))^2))
    buisp2[j]=bPollam2[j]*sin(2*(!dtor*PAfs2))
    buintr2[j]=bu[j] - buisp2[j]
    bqisp2[j]=bPollam2[j]*cos(2*(!dtor*PAfs2))
    bqintr2[j]=bq[j] - bqisp2[j]
  endfor
  
  for j=0, N_ELEMENTS(bWave)-1 do begin 
    bPollam3[j] = Pisp3*exp(-K*((alog(lambdamax/bWave[j]))^2))
    buisp3[j]=bPollam3[j]*sin(2*(!dtor*PAfs3))
    buintr3[j]=bu[j] - buisp3[j]
    bqisp3[j]=bPollam3[j]*cos(2*(!dtor*PAfs3))
    bqintr3[j]=bq[j] - bqisp3[j]
  endfor
  
  for j=0, N_ELEMENTS(bWave)-1 do begin 
    bPollam4[j] = Pisp4*exp(-K*((alog(lambdamax/bWave[j]))^2))
    buisp4[j]=bPollam4[j]*sin(2*(!dtor*PAfs4))
    buintr4[j]=bu[j] - buisp4[j]
    bqisp4[j]=bPollam4[j]*cos(2*(!dtor*PAfs4))
    bqintr4[j]=bq[j] - bqisp4[j]
  endfor 
   
;-----------------------------------------------------------------------------------------------------------
; Red data
 rPollam1=dblarr(N_ELEMENTS(rWave))  ; P(lambda) in Serkowski Law
 ruintr1=dblarr(N_ELEMENTS(rWave))   ; U Intrinsic (subtracted)
 rqintr1=dblarr(N_ELEMENTS(rWave))   ; Q Intrinsic (subtracted)
 ruisp1=dblarr(N_ELEMENTS(rWave))    ; U ISP - Calculated from P(lambda) at each wavelength
 rqisp1=dblarr(N_ELEMENTS(rWave))    ; Q ISP -  "   "

 rPollam2=dblarr(N_ELEMENTS(rWave))
 ruintr2=dblarr(N_ELEMENTS(rWave))
 rqintr2=dblarr(N_ELEMENTS(rWave))
 ruisp2=dblarr(N_ELEMENTS(rWave))
 rqisp2=dblarr(N_ELEMENTS(rWave))

 rPollam3=dblarr(N_ELEMENTS(rWave))
 ruintr3=dblarr(N_ELEMENTS(rWave))
 rqintr3=dblarr(N_ELEMENTS(rWave))
 ruisp3=dblarr(N_ELEMENTS(rWave))
 rqisp3=dblarr(N_ELEMENTS(rWave))

 rPollam4=dblarr(N_ELEMENTS(rWave))
 ruintr4=dblarr(N_ELEMENTS(rWave))
 rqintr4=dblarr(N_ELEMENTS(rWave))
 ruisp4=dblarr(N_ELEMENTS(rWave))
 rqisp4=dblarr(N_ELEMENTS(rWave))  

 
  for j=0, N_ELEMENTS(rWave)-1 do begin 
    rPollam1[j] = Pisp1*exp(-K*((alog(lambdamax/rWave[j]))^2))   ;Calculates ISP total polarization at each wavelength
    ruisp1[j]=rPollam1[j]*sin(2*(!dtor*PAfs1))                   ;Calculates ISP U at each wavelength
    ruintr1[j]=ru[j] - ruisp1[j]                                  ;Subtracts Uisp from total to get Uintrinsic
    rqisp1[j]=rPollam1[j]*cos(2*(!dtor*PAfs1))                   ;Calculates ISP Q at each wavelength
    rqintr1[j]=rq[j] - rqisp1[j]                                  ;Subtracts Qisp from total to get Qintrinsic
  endfor
  
  for j=0, N_ELEMENTS(rWave)-1 do begin 
    rPollam2[j] = Pisp2*exp(-K*((alog(lambdamax/rWave[j]))^2))
    ruisp2[j]=rPollam2[j]*sin(2*(!dtor*PAfs2))
    ruintr2[j]=ru[j] - ruisp2[j]
    rqisp2[j]=rPollam2[j]*cos(2*(!dtor*PAfs2))
    rqintr2[j]=rq[j] - rqisp2[j]
  endfor
  
  for j=0, N_ELEMENTS(rWave)-1 do begin 
    rPollam3[j] = Pisp3*exp(-K*((alog(lambdamax/rWave[j]))^2))
    ruisp3[j]=rPollam3[j]*sin(2*(!dtor*PAfs3))
    ruintr3[j]=ru[j] - ruisp3[j]
    rqisp3[j]=rPollam3[j]*cos(2*(!dtor*PAfs3))
    rqintr3[j]=rq[j] - rqisp3[j]
  endfor
  
  for j=0, N_ELEMENTS(rWave)-1 do begin 
    rPollam4[j] = Pisp4*exp(-K*((alog(lambdamax/rWave[j]))^2))
    ruisp4[j]=rPollam4[j]*sin(2*(!dtor*PAfs4))
    ruintr4[j]=ru[j] - ruisp4[j]
    rqisp4[j]=rPollam4[j]*cos(2*(!dtor*PAfs4))
    rqintr4[j]=rq[j] - rqisp4[j]
  endfor  



;------------------------------------------------------------------------------------------------------------------
;Create txt files for intrinsic (subtracted) q and u values for each of the four position angles
; Blue data  
  openw,1,path+'/subtracted_values/PAfs1/Blue/'+dates[i]+'b_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(bWave)-1 do begin
    printf,1,bWave[j],bFlux[j],bqintr1[j],buintr1[j],berr[j]
  endfor
  close, 1

  openw,1,path+'/subtracted_values/PAfs2/Blue/'+dates[i]+'b_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(bWave)-1 do begin
    printf,1,bWave[j],bFlux[j],bqintr2[j],buintr2[j],berr[j]
  endfor
  close, 1
  
  openw,1,path+'/subtracted_values/PAfs3/Blue/'+dates[i]+'b_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(bWave)-1 do begin
    printf,1,bWave[j],bFlux[j],bqintr3[j],buintr3[j],berr[j]
  endfor
  close, 1
  
  openw,1,path+'/subtracted_values/PAfs4/Blue/'+dates[i]+'b_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(bWave)-1 do begin
    printf,1,bWave[j],bFlux[j],bqintr4[j],buintr4[j],berr[j]
  endfor
  close, 1
  
;Red data --------------------------------------------------------------------------------
  openw,1,path+'/subtracted_values/PAfs1/Red/'+dates[i]+'r_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(rWave)-1 do begin
    printf,1,rWave[j],rFlux[j],rqintr1[j],ruintr1[j],rerr[j]
  endfor
  close, 1

  openw,1,path+'/subtracted_values/PAfs2/Red/'+dates[i]+'r_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(rWave)-1 do begin
    printf,1,rWave[j],rFlux[j],rqintr2[j],ruintr2[j],rerr[j]
  endfor
  close, 1
  
  openw,1,path+'/subtracted_values/PAfs3/Red/'+dates[i]+'r_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(rWave)-1 do begin
    printf,1,rWave[j],rFlux[j],rqintr3[j],ruintr3[j],rerr[j]
  endfor
  close, 1
  
  openw,1,path+'/subtracted_values/PAfs4/Red/'+dates[i]+'r_int.txt',WIDTH=250
  printf,1,'Wavelength       Flux          Intrinsic Q      Intrinsic U        new error'
  for j=0,N_ELEMENTS(rWave)-1 do begin
    printf,1,rWave[j],rFlux[j],rqintr4[j],ruintr4[j],rerr[j]
  endfor
  close, 1

endfor
end