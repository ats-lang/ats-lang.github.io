INSTALL := /usr/bin/install -c
PACKAGE_TARNAME := ats2-postiats
PACKAGE_VERSION := 0.2.9

prefix := /usr/local
exec_prefix := ${prefix}
bindir := ${exec_prefix}/bin

abs_top_srcdir := /home/hwxi/Research/ATS-Postiats/doc/DISTRIB/ATS-Postiats

AR := ar
CC := gcc
LN_S := ln -s
INSTALL := /usr/bin/install -c
MKDIR_P := /bin/mkdir -p

PATSHOME := $(abs_top_srcdir)
PATSLIBHOME := $(prefix)/lib/$(PACKAGE_TARNAME)-$(PACKAGE_VERSION)

HAVE_LIBGMP := yes
