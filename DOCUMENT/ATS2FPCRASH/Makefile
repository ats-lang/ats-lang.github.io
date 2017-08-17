#
# For updating INT2PROGINATS
#

######

CPF=cp -f
RMF=rm -f
CPRF=cp -rf
RMRF=rm -rf

######
#
#all:: update_pdf
#
all:: update_code
#
#all:: update_html
#all:: update_htmltoc
#all:: update_htmlone
#
######

update_pdf:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/PDF/main.pdf PDF/.

######

update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/01/CODE/* LECTURE/01/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/02/CODE/* LECTURE/02/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/03/CODE/* LECTURE/03/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/04/CODE/* LECTURE/04/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/05/CODE/* LECTURE/05/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/06/CODE/* LECTURE/06/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/06-10/CODE/* LECTURE/06-10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/LECTURE/07/CODE/* LECTURE/07/CODE/.

######
#
update_html:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/HTML/book1.html HTML/.
update_html:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/HTML/[c,f,p,x]*.html HTML/.
#
######
#
update_htmltoc:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/HTML/HTMLTOC/book1.html HTML/HTMLTOC/.
update_htmltoc:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/HTML/HTMLTOC/[c,f,p,x]*.html HTML/HTMLTOC/.
#
######
#
update_htmlone:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FPCRASH/HTML/ATS2FPCRASH-BOOK-onechunk.html HTML/.
#
######

clean_html:: ; $(RMF) HTML/{c,f,p,x}*.html
clean_htmltoc:: ; $(RMF) HTML/HTMLTOC/{c,f,p,x}*.html

###### end of [Makefile] ######
