#!/bin/bash

# !!!!! I'm still working on this shell script, but I wanted to at least upload what I had so far. !!!!!

# shell script that determines system resources and exports them to external file
BINDIR="/home/hyades/"
FILENAMETXT="/home/users/berdis/Documents/CompAstro/ASTR575/q14/sys_res_output.txt"
FILENAMETEX="/home/users/berdis/Documents/CompAstro/ASTR575/q14/sys_res_output.tex"

#awk '{print 10^(3.5*$6 + 0.25*$5 - 12.67)}' > hw11.txt
cd $BINDIR
echo $BINDIR >> $FILENAMETXT
echo "CPU info:" >> $FILENAMETXT
cat /proc/cpuinfo >> $FILENAMETXT
echo "Memory info:" >> $FILENAMETXT
cat /proc/meminfo >> $FILENAMETXT

COL1=$1
COL2=$2

echo "\begin{center}" >> $FILENAMETEX
echo "{ \small" >> $FILENAMETEX
echo "\begin{tabular}{ r  c }" >> $FILENAMETEX
echo "\specialrule{.2em}{.1em}{.1em}" >> $FILENAMETEX
echo "Resource ID & Resource Value \\ \hline" >> $FILENAMETEX
echo "\specialrule{.1em}{.05em}{.05em}" >> $FILENAMETEX
$FILENAMETXT awk '{print $1}' >> $COL1
$FILENAMETXT awk '{print $2}' >> $COL2
echo $COL1" & "$COL2" \\" >> $FILENAMETEX
echo "\hline" >> $FILENAMETEX
echo "\end{tabular} }" >> $FILENAMETEX
echo "\end{center}" >> $FILENAMETEX


#echo "Number:"$NUMBER >> $FILENAME
