#A historical functional form of the initial mass function (IMF, the number of stars formed as a function of stellar mass) is the Salpeter IMF, which has dN/dM propto M-2.35. Considering such a relation with a minimum mass 0.5M and a maximum mass 100M, write a routine based on the methodology ddiscussed in class (no canned routines!) that generates random deviates to populate such a distribution. Use your routine to general some plots of IMFs for several different sample sizes, which you should plot in histogram form. Overlay the Salpeter function on your plots. 

import numpy as np


#def func(x):
#    fx = (x**-2.35)
#    return fx

def anintegral(a, b):
    return ((b**-1.35)/-1.35) - ((a**-1.35)/-1.35)
    
print anintegral(0.5,100.)

#(b - a) * random_sample() + a
masses = (100-0.5) * np.random.random_sample((50)) + 0.5
print masses


