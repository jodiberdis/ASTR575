import matplotlib.pyplot as plt
from pylab import *
from astropy.io import ascii
import matplotlib.patches as mpatches
import math

plt.clf()
plt.cla()

#os.environ['ISOCHRONE_DIR'] = '/home/holtz/analysis/apogee/dist/isochrones/'

# Pull columns from .dat files:
isodata00 = ascii.read('zp00.dat', names=['Z', 'Log_Age', 'M_initial', 'M_actual', 'Log_L', 'Log_Teff', 'Log_G', 'm_bol', 'U', 'B', 'V', 'R', 'I', 'J', 'H', 'K', 'int_IMF', 'Stage'])
isodata01 = ascii.read('zp01.dat', names=['Z', 'Log_Age', 'M_initial', 'M_actual', 'Log_L', 'Log_Teff', 'Log_G', 'm_bol', 'U', 'B', 'V', 'R', 'I', 'J', 'H', 'K', 'int_IMF', 'Stage'])
isodata16 = ascii.read('zm16.dat', names=['Z', 'Log_Age', 'M_initial', 'M_actual', 'Log_L', 'Log_Teff', 'Log_G', 'm_bol', 'U', 'B', 'V', 'R', 'I', 'J', 'H', 'K', 'int_IMF', 'Stage'])

data=[isodata00,isodata01,isodata16]

fig = plt.figure(figsize=(15,8))
fig.subplots_adjust(wspace=0.4,hspace=0.4)
colors=['red','blue','green']

addage=[]
addmetal=[]

#agestruct = isodata[where(isodata['Log_Age'] == inage)]
for i in range(len(data)):
    agestruct = data[i][where(data[i]['Log_Age'] == 9)]
    metalstruct = data[i][where(data[i]['Z'] == 0.0191)]
    
#    addage.append(agestruct)
#    addmetal.append(metalstruct)



#print addmetal
#    print 'stuff should be below this:'
#    print where(data[i]['Z'] == 0.0191)

#for i in range(len(data)):

    ax=fig.add_subplot(221)
    plt.scatter((agestruct['Log_Teff']), (agestruct['Log_G']),color=colors)
    plt.title('1 Gyr -- Effective Temperature vs. Surface Gravity')
    plt.xlim(4.2,3.4)
    plt.xlabel('log T_eff')
    plt.ylabel('log G')

    ax=fig.add_subplot(223)
    plt.scatter((agestruct['Log_Teff']), (agestruct['m_bol']),color=colors)
    plt.title('1 Gyr -- Effective Temperature vs. Bolometric Magnitude')
    plt.xlim(4.2,3.4)
    plt.xlabel('log T_eff')
    plt.ylabel('m_bol')

    ax=fig.add_subplot(222)
    plt.scatter((metalstruct['Log_Teff']), (metalstruct['Log_G']), linewidth='0', c=metalstruct['Log_Age'],cmap='RdYlBu')
    plt.title('Solar Metallicity -- T_eff vs. Surface Gravity')
    plt.xlim(4.2,3.4)
    plt.xlabel('log T_eff')
    plt.ylabel('log G')

    ax=fig.add_subplot(224)
    plt.scatter((metalstruct['Log_Teff']), (metalstruct['m_bol']), linewidth='0', c=metalstruct['Log_Age'],cmap='RdYlBu')
    plt.title('1 Gyr -- T_eff vs. Bolometric Magnitude')
    plt.xlim(4.2,3.4)
    plt.xlabel('log T_eff')
    plt.ylabel('m_bol')



plt.savefig('hrdiagrams.png', bbox_inches='tight')
