#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
ATSCC2JS=$(PATSHOME)/bin/atscc2js
ATSCC2PY3=$(PATSHOME)/bin/atscc2py3
#
######
#
all:: words_dats.js
all:: words_dats.py
#
######
#
words_dats.c: words.dats; $(PATSOPT) -d $< |
#
######
#
words_dats.js: words.dats; \
  $(PATSOPT) -DATS LIBATSCC2JS -d $< | $(ATSCC2JS) -o $@ -i
#
words_dats.py: words.dats; \
  $(PATSOPT) -DATS LIBATSCC2PY3 -d $< | $(ATSCC2PY3) -o $@ -i
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
