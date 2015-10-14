from astropy.io import ascii
from numpy import where

# I have absolutely no idea how to only output the values of the table to the file. It insists on writing out "<Row '#' of table...>" as well as the names of each variable on each line. Would need more time to debug this and find out what's wrong.
def read_isochrone(filename, inage):

    outfile = open('select_age.txt', 'w')

    # Pull columns from .dat file:
    isodata = ascii.read(filename, names=['Z', 'Log_Age', 'M_initial', 'M_actual', 'Log_L', 'Log_Teff', 'Log_G', 'm_bol', 'U', 'B', 'V', 'R', 'I', 'J', 'H', 'K', 'int_IMF', 'Stage'])
    # Find data sets associated with user's input age:
    agestruct = isodata[where(isodata['Log_Age'] == inage)]

    for line in agestruct:
    	outfile.write('{}'.format(line) + "\n")
    outfile.close()

    print agestruct

read_isochrone('zp00.dat', 9)
