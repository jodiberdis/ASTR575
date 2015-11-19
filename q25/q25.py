import matplotlib.pyplot as plt
from pylab import *
import pyfits
from astropy.io import ascii
import matplotlib.patches as mpatches
import math
import numpy as np

#plt.clf()
#plt.cla()

#os.environ['ISOCHRONE_DIR'] = '/home/holtz/analysis/apogee/dist/isochrones/'

# Pull columns from .dat files:
data = ascii.read('zp01.dat', names=['Z', 'Log_Age', 'M_initial', 'M_actual', 'Log_L', 'Log_Teff', 'Log_G', 'm_bol', 'U', 'B', 'V', 'R', 'I', 'J', 'H', 'K', 'int_IMF', 'Stage'])

agestruct = data[where(data['Log_Age'] == 9)]

x = agestruct['Log_Teff']
y = agestruct['Log_L']
nbins = 10000

xlen = int(np.sqrt(nbins))
ylen = xlen

dx = (max(x)-min(x))/xlen
dy = (max(y)-min(y))/ylen


newx=[]
newy=[]
binx=[]
biny=[]
numstars=[]
totstars=np.zeros([xlen, ylen])

for i in range(len(agestruct)-1):
    tem = abs(agestruct[i+1]['int_IMF'] - agestruct[i]['int_IMF'])
    numstars.append(tem)

#print len(numstars)

for i in range(xlen+1):
    specdx = (i * dx) + min(x)
    specdy = (i * dy) + min(y)
    newx.append(specdx)
    newy.append(specdy)
#print max(y)

for i in range(xlen):
    for j in range(len(x)-1):
        if (x[j] >= newx[i]) and (x[j] <= newx[i+1]):
            binx.append(i)
    for k in range(len(y)-1):
        if (y[k] >= newy[i]) and (y[k] <= newy[i+1]):
            biny.append(i)

for i in range(len(binx)-1):              # For each pair of points (in teff/lum data)
    difbinx = abs(binx[i] - binx[i+1])+1  # difference between bins of two consecutive points
    difbiny = abs(biny[i] - biny[i+1])+1
    area = difbinx*difbiny                # area of difference in bins
    binstar = numstars[i]/area            # number of stars in each bin
#    print binstar
#    for j in range(min(binx[i],binx[i+1]), max(binx[i],binx[i+1])):
#        for k in range(min(biny[i],biny[i+1]), max(biny[i],biny[i+1])):
#            totstars[j,k] = totstars[j,k] + binstar

    for j in (np.arange(difbinx)+min([binx[i],binx[i+1]])):
        for k in (np.arange(difbiny)+min([biny[i],biny[i+1]])):
            totstars[j,k] = totstars[j,k] + binstar


print totstars

hdu = pyfits.PrimaryHDU(totstars)
hdu.writeto('hess.fits')

