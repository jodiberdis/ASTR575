#A historical functional form of the initial mass function (IMF, the number of stars formed as a function of 
#stellar mass) is the Salpeter IMF, which has dN/dM propto M-2.35. Considering such a relation with a minimum 
#mass 0.5M and a maximum mass 100M, write a routine based on the methodology ddiscussed in class (no canned 
#routines!) that generates random deviates to populate such a distribution. Use your routine to general some 
#plots of IMFs for several different sample sizes, which you should plot in histogram form. Overlay the Salpeter 
#function on your plots. 

import numpy as np
import matplotlib.pyplot as plt
from pylab import *

#def func(x):
#    fx = (x**-2.35)
#    return fx


def anintegral(a, b):          # Computes analytic integral
    return ((b**-1.35)/-1.35) - ((a**-1.35)/-1.35)

masses = np.arange(0.5,100.5,0.5)     # Creates range of masses 0.5-100, with stepsize 0.5
cumeinteg = np.zeros(len(masses))     # Empty array for cumulative integral values

for i in range(len(masses)):
    cumeinteg[i] = anintegral(0.5,masses[i]) / anintegral(0.5,100.) # Divide resulting number by anintegral(0.5,100.) 
#    print masses[i], cumeinteg[i]                                   #     to normalize so numbers go to 1 rather than 1.88


# create array of random numbers between 0 and 1
num = 1000
randnum = np.random.random_sample((num))
cumemass = np.zeros(len(randnum))

# find corresponding x values (masses) - use where statement: where difference between random and actual equals minimum possible random - actual
for i in range(len(randnum)):
    index_cumemass = np.where(abs(randnum[i]-cumeinteg) == min(abs(randnum[i]-cumeinteg)))
    cumemass[i] = masses[index_cumemass]
print cumemass
# Do histogram of resulting mass values 


plt.clf()
plt.cla()
bins = 99.5 / 0.5
plt.hist(cumemass, bins)

plt.xlim(0,30)
#plt.ylim(0,1)
plt.xlabel('Mass')
plt.ylabel('Number of Stars')
plt.show()
