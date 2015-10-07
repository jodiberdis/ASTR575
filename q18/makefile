# makefile for compiling C, Python, and IDL codes
# Can't get the idl code to compile through the makefile

all : q18_py q18_c

#q18_idl : q18_idl.pro
#	idl
#	.compile q18_idl.pro
#	q18_idl
#	exit

q18_py : q18_py.py
	python q18_py.py

q18_c : q18_c.c
	gcc -o q18 q18.c
	./q18
