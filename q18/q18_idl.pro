pro q18_idl

 var = 1
 maxvar = 100
 fac_maxvar = 20
 sumfac = 0
 count = 0

while (var LE maxvar) do begin
  if (var LT fac_maxvar) then begin
     facvar = factorial(var)
     print, 'factorial of',var,' is: ',facvar
     sumfac = sumfac+facvar
  endif
  count = count+1
  var = (2*var)+1
  print, 'variable: ',var
endwhile

print, 'number of iterations = ',count
print, 'sum of factorials: ',sumfac


end
