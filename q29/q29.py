#A historical functional form of the initial mass function (IMF, the number of stars formed as a function of 
#stellar mass) is the Salpeter IMF, which has dN/dM propto M-2.35. Considering such a relation with a minimum 
#mass 0.5M and a maximum mass 100M, write a routine based on the methodology ddiscussed in class (no canned 
#routines!) that generates random deviates to populate such a distribution. Use your routine to general some 
#plots of IMFs for several different sample sizes, which you should plot in histogram form. Overlay the Salpeter 
#function on your plots. 

import numpy as np
import matplotlib.pyplot as plt
from pylab import *

def anintegral(a, b):
    ''' Computes analytic integral of the Salpeter IMF Function '''
    return ((b**-1.35)/-1.35) - ((a**-1.35)/-1.35)

masses = np.arange(0.5,100.5,0.5)     # Creates range of masses 0.5-100, with stepsize 0.5
cumeinteg = np.zeros(len(masses))     # Empty array for cumulative integral values

# Calculate the cumulative integral at each mass
for i in range(len(masses)):
    cumeinteg[i] = anintegral(0.5,masses[i]) / anintegral(0.5,100.) # Divide resulting number by anintegral(0.5,100.) 
                                                                    #     to normalize so numbers go to 1 rather than 1.88
# Set up a plot to populate 4 subplots
plt.clf()
plt.cla()
fig = plt.figure(figsize=(15,8))
fig.subplots_adjust(wspace=0.4,hspace=0.4)
bins = 99.5 / 0.5          # Number of bins for bin size=0.5

# Create array of random numbers between 0 and 1
num = [100,1000,5000,10000]   # Generate plots with several different sample sizes
maxrange = [10,15,15,20]   # Maximum x axis range for plots
for j in range(len(num)):
    randnum = np.random.random_sample((num[j]))
    cumemass = np.zeros(len(randnum))

# Find corresponding x values (masses) - use where statement: where difference between random and actual equals minimum possible random - actual
    for i in range(len(randnum)):
        index_cumemass = np.where(abs(randnum[i]-cumeinteg) == min(abs(randnum[i]-cumeinteg)))
        cumemass[i] = masses[index_cumemass]

# Plot histogram of resulting mass value
    ax=fig.add_subplot(2,2,j+1)
    plt.hist(cumemass, bins)
    plt.plot(masses[1:], (masses[1:]**-2.35)*(num[j]/anintegral(0.5,100.)))
    plt.xlim(0,maxrange[j])
    plt.xlabel('Mass')
    plt.ylabel('Number of Stars')

plt.show()
