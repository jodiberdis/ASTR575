import matplotlib.pyplot as plt
from pylab import *
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
nbins = 625

xlen = int(np.sqrt(nbins))
ylen = xlen

dx = (max(x)-min(x))/xlen
dy = (max(y)-min(y))/ylen


newx=[]
newy=[]
binx=[]
biny=[]
numstars=[]

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

for i in range(len(binx)-1):
    difx = abs(binx[i] - binx[i+1])+1
    dify = abs(biny[i] - biny[i+1])+1
    area = difx*dify
    binstar = numstars[i]/area
    for j in range(difx + min([binx[i],binx[i+1]]):
        print j
            
     #forloop goes here i, xbin
         #nest for goes here j, ybin




#fig = plt.figure(figsize=(15,8))
#fig.subplots_adjust(wspace=0.4,hspace=0.4)
#colors=['red','blue','green']


#agestruct = isodata[where(isodata['Log_Age'] == inage)]
#for i in range(len(data)):
#    agestruct = data[i][where(data[i]['Log_Age'] == 9)]
#    metalstruct = data[i][where(data[i]['Z'] == 0.0191)]
    




#    ax=fig.add_subplot(221)
#    plt.scatter((agestruct['Log_Teff']), (agestruct['Log_G']),color=colors)
#    plt.title('1 Gyr -- Effective Temperature vs. Surface Gravity')
#    plt.xlim(4.2,3.4)
#    plt.xlabel('log T_eff')
#    plt.ylabel('log G')

#    ax=fig.add_subplot(223)
#    plt.scatter((agestruct['Log_Teff']), (agestruct['m_bol']),color=colors)
#    plt.title('1 Gyr -- Effective Temperature vs. Bolometric Magnitude')
#    plt.xlim(4.2,3.4)
#    plt.xlabel('log T_eff')
#    plt.ylabel('m_bol')

#    ax=fig.add_subplot(222)
#    plt.scatter((metalstruct['Log_Teff']), (metalstruct['Log_G']), linewidth='0', c=metalstruct['Log_Age'],cmap='RdYlBu')
#    plt.title('Solar Metallicity -- T_eff vs. Surface Gravity')
#    plt.xlim(4.2,3.4)
#    plt.xlabel('log T_eff')
#    plt.ylabel('log G')

#    ax=fig.add_subplot(224)
#    plt.scatter((metalstruct['Log_Teff']), (metalstruct['m_bol']), linewidth='0', c=metalstruct['Log_Age'],cmap='RdYlBu')
#    plt.title('1 Gyr -- T_eff vs. Bolometric Magnitude')
#    plt.xlim(4.2,3.4)
#    plt.xlabel('log T_eff')
#    plt.ylabel('m_bol')



#plt.savefig('hrdiagrams.png', bbox_inches='tight')
