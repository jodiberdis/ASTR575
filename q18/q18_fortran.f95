! Can't figure out how to run this code. I'm sure it's just a syntax issue somewhere,
! but I'm not fluent enough in Fortran to know where my mistake is.

q18_fortran.f95

function factorial(n) result(result)
integer :: n = 0, recurse = 0, result = 0

    if n .eq. 0 then
        return 1
    else
        recurse = factorial(n-1)
        res = n * recurse
        return res
    endif
end function factorial

program calcfac
integer :: var = 1, maxvar = 100, fac_maxvar = 20, sumfac = 0

  do while var .le. maxvar
    if var .lt. fac_maxvar then
        facvar = call factorial(var)
        print *, 'factorial of',var,'is: ',facvar
        sumfac = sumfac+facvar
    endif
    var = (2*var)+1
    print *, 'variable: ',var
  end do
    
  print *, 'sum of factorials: ',sumfac
end program calcfac


end
