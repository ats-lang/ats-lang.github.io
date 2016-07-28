#
# For updating INT2PROGINATS
#

######

CPF=cp -f
RMF=rm -f
CPRF=cp -rf
RMRF=rm -rf

######

all:: update_pdf
all:: update_html
all:: update_htmltoc
all:: update_htmlone
all:: update_code

######

update_pdf:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/PDF/main.pdf PDF/.

######

update_html:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/HTML/book1.html HTML/.
update_html:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/HTML/[c,f,p,x]*.html HTML/.

######

update_htmltoc:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/HTML/HTMLTOC/book1.html HTML/HTMLTOC/.
update_htmltoc:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/HTML/HTMLTOC/[c,f,p,x]*.html HTML/HTMLTOC/.

######

update_htmlone:: ; \
$(CPF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/HTML/ATS2TUTORIAL-BOOK-onechunk.html HTML/.

######

upload_code:: ; \
$(CPRF) $(PATSHOME)/doc/BOOK/ATS2TUTORIAL/CODE/* CODE/.

######

clean_html:: ; $(RMF) HTML/{c,f,p,x}*.html
clean_htmltoc:: ; $(RMF) HTML/HTMLTOC/{c,f,p,x}*.html

###### end of [Makefile] ######
