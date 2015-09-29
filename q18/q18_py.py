# Question 18 code in Python language

var = 1
maxvar = 100
fac_maxvar = 20
sumfac = 0
count = 0

def factorial(n):
    if n == 0:
        return 1
    else:
        recurse = factorial(n-1)
        result = n * recurse
        return result

while var <= maxvar:
    if var < fac_maxvar:
        facvar = factorial(var)
        print 'factorial of',var,'is: ',facvar
        sumfac = sumfac+facvar
    count = count+1
    var = (2*var)+1
    print 'variable: ',var
    
print 'number of iterations = ',count  
print 'sum of factorials: ',sumfac
