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
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/PDF/main.pdf PDF/.

######

update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/MYLIB/* LECTURE/MYLIB/.

######

update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/01/CODE/* LECTURE/01/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/02/CODE/* LECTURE/02/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/03/CODE/* LECTURE/03/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/03-10/CODE/* LECTURE/03-10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/04/CODE/* LECTURE/04/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/04-10/CODE/* LECTURE/04-10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/05/CODE/* LECTURE/05/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/06/CODE/* LECTURE/06/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/06-10/CODE/* LECTURE/06-10/CODE/.
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/06-20/CODE/* LECTURE/06-20/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/07/CODE/* LECTURE/07/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/07-10/CODE/* LECTURE/07-10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/08/CODE/* LECTURE/08/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/09/CODE/* LECTURE/09/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/10/CODE/* LECTURE/10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/10-10/CODE/* LECTURE/10-10/CODE/.
update_code:: ; \
$(CPRF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/LECTURE/11/CODE/* LECTURE/11/CODE/.

######
#
update_html:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/HTML/book1.html HTML/.
update_html:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/HTML/[c,f,x]*.html HTML/.
#
######
#
update_htmltoc:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/HTML/HTMLTOC/book1.html HTML/HTMLTOC/.
update_htmltoc:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/HTML/HTMLTOC/[c,f,x]*.html HTML/HTMLTOC/.
#
######
#
update_htmlone:: ; \
$(CPF) \
$(PATSHOME)/doc/BOOK/ATS2FUNCRASH/HTML/ATS2FUNCRASH-BOOK-onechunk.html HTML/.
#
######

clean_html:: ; $(RMF) HTML/{c,f,x}*.html
clean_htmltoc:: ; $(RMF) HTML/HTMLTOC/{c,f,x}*.html

###### end of [Makefile] ######
