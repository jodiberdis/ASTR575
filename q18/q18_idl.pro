pro q18_idl

 var = 1
 maxvar = 100
 fac_maxvar = 20
 sumfac = 0

while (var LE maxvar) do begin
  if (var LT fac_maxvar) then begin
     facvar = factorial(var)
  endif
  print, 'factorial of',var,' is: ',facvar
  sumfac = sumfac+facvar
  var = (2*var)+1
  print, 'variable: ',var
endwhile

print, 'sum of factorials: ',sumfac


end
