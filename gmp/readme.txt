These are the bindings and the static library for GMP 4.2 on Windows(The GNU MP Bignum Library)
See gmplib.org/ 

This is in alpha state. All functions that have been tried seem to work. (8 out of many)


Files:
gmp.h -original header file for gmp used for translation
gmp.d -bindings/header for D
libgmp.lib -static gmp lib made by gcc & objconv (http://agner.org/optimize/#objconv)(coff to omf library converter)
squareroot.d - example calculates square root of 2
gmptest.d - another example. 
dsss.conf - it is possible to build the whole thing throught dsss build


State:
No known errors at the moment. Many functions has not been tested.

Header file gmp.d:
It is not complete. It does not contain the low level positive-integer (i.e. N) routines and inlines. For most purposes, what is done should be enough. 
