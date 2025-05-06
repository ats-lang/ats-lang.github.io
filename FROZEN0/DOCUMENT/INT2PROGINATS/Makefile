#
# For updating INT2PROGINATS
#

######

CPF=cp -f
RMF=rm -f

######

all:: update_pdf
all:: update_html
all:: update_htmltoc
all:: update_htmlone

######

update_pdf:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/PDF/main.pdf PDF/.

######

update_html:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/HTML/book1.html HTML/.
update_html:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/HTML/[c,f,p,x]*.html HTML/.

######

update_htmltoc:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/HTML/HTMLTOC/book1.html HTML/HTMLTOC/.
update_htmltoc:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/HTML/HTMLTOC/[c,f,p,x]*.html HTML/HTMLTOC/.

######

update_htmlone:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/INT2PROGINATS/HTML/INT2PROGINATS-BOOK-onechunk.html HTML/.

######

clean_html:: ; $(RMF) HTML/{c,f,p,x}*.html
clean_htmltoc:: ; $(RMF) HTML/HTMLTOC/{c,f,p,x}*.html

###### end of [Makefile] ######
