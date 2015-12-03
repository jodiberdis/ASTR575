# Write a routine to convolve a vector of length 8192 pixels that consists of a series of delta functions spaced every 10 pixels, with a Gaussian with $ \sigma$ = 5 pixels. Do the convolution in physical space, writing the convolution integral explicitly (i.e., don't use a canned convolution routine!) Then do it in Fourier space by taking the Fourier transform of the vector and the Gaussian, multiplying them, and then Fourier transforming back (canned routines OK!). Plot both results. 

import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
from pylab import *

plt.clf()
plt.cla()

# Define initial variables and blank arrays
x=np.arange(8192)             # Vector of length 8192 pixels
delta=np.zeros(len(x))        # Array for series of delta functions
convsum=np.zeros(len(x))      # Array to populate series of convolution functions
sigma=5.                      # Gaussian with sigma = 5 pixels
conv=0.                       # Initialize variable conv: sums contributions from each convolution multiplication

# Create array of length 8192 pixels with delta functions spaced every 10 pixels
for i in range(len(x)):
    if ((x[i]%10) == 0):
        delta[i] = 1
    else:
        delta[i] = 0

# Calculate convolution at every pixel
for i in range(50,250):
    gauss = 5.*(1./(sigma*np.sqrt(2.*np.pi)))*np.exp(-((x[i-30:i+30]-i)**2.)/(2.*sigma**2.))
    conv=0.
    for j in range(60):
        conv = conv + (gauss[j]*delta[i+j])    # Sums contributions at each pixel
    convsum[i] = conv                            # Populates convsum array with summed conv values

# Plotting time:
plt.plot(x,delta)
plt.plot(x[0:i+30], convsum[0:i+30])
plt.xlim(100,200)
plt.xlabel('X')
plt.ylabel('Y')
plt.show()
