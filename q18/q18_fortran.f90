! Can't figure out how to run this code. I'm sure it's just a syntax issue somewhere,
! but I'm not fluent enough in Fortran to know where my mistake is.

subroutine factorial(n) result(res)
  n = 0
  recurse = 0
  res = 0

    if (n .eq. 0) then
        return 1
    else if
        recurse = factorial(n-1)
        res = n * recurse
        return res
    end if
end subroutine factorial

program q18_fortran
  var = 1
  maxvar = 100
  fac_maxvar = 20
  sumfac = 0

  do while (var .le. maxvar)
    if (var .lt. fac_maxvar) then
        facvar = factorial(var)
        print *, 'factorial of',var,'is: ',facvar
        sumfac = sumfac+facvar
    end if
    var = (2*var)+1
    print *, 'variable: ',var
  end do
    
  print *, 'sum of factorials: ',sumfac
end program q18_fortran


end
