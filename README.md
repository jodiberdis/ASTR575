# ASTR575
Material for ASTR575: Computational Astrophysics

ISP_Subtract.pro is an IDL code that I wrote last year for my undergraduate senior thesis. 
It uses values outputted by a separate 'serkfit.pro' to compute Ppar and Pisp for each of the four PAfs#.
It reads in original blue/red data files. 
For each set, it calculates ISP at each wavelength using the empirical Serkowski Law, 
then extracts a Q_ISP and U_ISP value from the Total_ISP, 
and finally subtracts those from the original Q and U values to get Q_Intrinsic and U_Intrinsic. 
Last, it outputs data to four sets of blue/red files of intrinsic data.
