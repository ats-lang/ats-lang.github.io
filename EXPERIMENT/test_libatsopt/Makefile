#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
test_libatsopt_dats.js
#
######

test_libatsopt_dats.c: \
test_libatsopt.dats; $(PATSOPT) -o $@ -d $<
test_libatsopt_dats.js: \
test_libatsopt_dats.c; $(ATSCC2JS) -o $@ -i $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f test_libatsopt_dats.js

###### end of [Makefile] ######
