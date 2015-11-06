import matplotlib.pyplot as plt
from pylab import *
from astropy.io import ascii

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

for i in range(len(data)):
    agestruct = data[i][where(data[i]['Log_Age'] == 9)]
    metalstruct = data[i][where(data[i]['Z'] == 0.02)]

    print agestruct
    print metalstruct


    ax=fig.add_subplot(221)
    plt.scatter((agestruct['Log_Teff'])[i], (agestruct['Log_G'])[i],color=colors)

    ax=fig.add_subplot(223)
    plt.scatter((agestruct['Log_Teff'])[i], (agestruct['m_bol'])[i],color=colors)

    ax=fig.add_subplot(222)
    plt.scatter((metalstruct['Log_Teff'])[i], (metalstruct['Log_G'])[i],color=colors)

    ax=fig.add_subplot(224)
    plt.scatter((metalstruct['Log_Teff'])[i], (metalstruct['m_bol'])[i],color=colors)


plt.savefig('hrdiagrams.png', bbox_inches='tight')
