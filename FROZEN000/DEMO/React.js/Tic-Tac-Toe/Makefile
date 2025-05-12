######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
MYATSCC=$(PATSHOME)/bin/myatscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all::

######

all:: \
Tic-Tac-Toe_dats.js

######

%_dats.c: %.dats; $(PATSOPT) -o $@ -d $<
%_dats.js: %_dats.c; $(ATSCC2JS) -o $@ -i $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean
cleanall:: ; rm -f *_dats.js

######

testall:: all
testall:: cleanall

###### end of [Makefile] ######
