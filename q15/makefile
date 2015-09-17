# makefile for converting tex file to pdf file

summary.dvi : summary.tex
	latex summary.tex

summary.ps : summary.dvi
	dvips -Ppdf -G0 summary.dvi

summary.pdf : summary.ps
	ps2pdf summary.ps

#PDF : summary.pdf
#	xpdf summary.pdf
