#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js
#
######
#
all:: words_dats.js
#
######
#
words_dats.c: \
  words.dats; $(PATSOPT) -o $@ -d $<
words_dats.js: \
  words_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
initgen: \
initgen.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -latslib
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f initgen

###### end of [Makefile] ######
