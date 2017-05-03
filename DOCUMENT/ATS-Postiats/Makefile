######
#
# A simple Makefile
#
######

CPF=cp -f

######

update:: \
update_prelude
update:: \
update_libats
update:: \
update_libats_ML
update:: \
update_libats_libc

######
#
update_prelude:: ; \
$(CPF) ${PATSHOME}/prelude/HTML/ATSPRE_all_in_one.raw prelude/HTML/.
update_prelude:: ; \
$(CPF) ${PATSHOME}/prelude/HTML/ATSPRE_all_in_one.html prelude/HTML/.
#
######
#
update_libats:: ; \
$(CPF) ${PATSHOME}/libats/HTML/ATSLIB_libats_all_in_one.raw libats/HTML/.
update_libats:: ; \
$(CPF) ${PATSHOME}/libats/HTML/ATSLIB_libats_all_in_one.html libats/HTML/.
#
######
#
update_libats_ML:: ; \
$(CPF) ${PATSHOME}/libats/ML/HTML/ATSLIB_libats_ML_all_in_one.raw libats/ML/HTML/.
update_libats_ML:: ; \
$(CPF) ${PATSHOME}/libats/ML/HTML/ATSLIB_libats_ML_all_in_one.html libats/ML/HTML/.
#
######
#
update_libats_libc:: ; \
$(CPF) ${PATSHOME}/libats/libc/HTML/ATSLIB_libats_libc_all_in_one.raw libats/libc/HTML/.
update_libats_libc:: ; \
$(CPF) ${PATSHOME}/libats/libc/HTML/ATSLIB_libats_libc_all_in_one.html libats/libc/HTML/.
#
######

###### end of [Makeifle] ######
