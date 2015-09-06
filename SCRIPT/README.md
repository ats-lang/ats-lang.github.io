# Scripts for ATS2

## [Homebrew for ATS2](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/ats2-postiats.rb)

This script is for installing ATS2 under a Mac OS. It is maintained externally.

## [C9-ATS2-install.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install.sh)

This script is for installing ATS2 and ATS2-contrib under a
distrbution of Linux. It is primarily used on an Ubuntu box
provided by [Cloud-9](http://c9.io).

## [C9-ATS2-install-cs320.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-cs320.sh)

This script is a variant of C9-ATS2-install.sh. It is tailored
mainly for teaching BU-CAS-CS-320.

## [C9-ATS2-install-cs520.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-cs520.sh)

This script is a variant of C9-ATS2-install.sh. It is tailored
mainly for teaching BU-CAS-CS-520.

## [Sortsmill-Gentoo-Overlay](https://bitbucket.org/sortsmill/sortsmill-gentoo-overlay)

The sortsmill overlay for Gentoo is a collection of ebuilds related in some
way to font development.  A brief description of this overlay is available
[on-line](https://groups.google.com/forum/?fromgroups#!topic/ats-lang-users/JqX9zV2uexk).


It is a Mercurial
[repository](https://bitbucket.org/sortsmill/sortsmill-gentoo-overlay) and
is listed by "layman -L" under the name sortsmill. So you can install it,
if you are using layman, with the command

        layman -a sortsmill

Ebuilds related to ATS2 include

*       dev-lang/ats2                 -- install ATS2
*       dev-lang/ats2-github          -- (try to) install ATS2-github
*       dev-lang/ats2-contrib         -- install ATS2-contrib
*       dev-lang/ats2-contrib-github  -- install ATS2-contrib-github
*       app-emacs/ats2-mode           -- install ats2-mode and optionally also install flymake

You can have multiple versions of ATS2 and ATS2-contrib installed
simultaneously, using eselect or settings of PATSHOME and/or PATSHOMERELOC
to control which versions are used. The ATS2 and ATS2-contrib versions are
controlled independently. (I thought this better than trying to impose
version-matching constraints.)

There is also dev-lang/ats for installing ATS1; this is pulled in by
dev-lang/ats2-github. It is a clumsy ebuild based on the one that is in the
main Gentoo repository.

A Gentoo ebuild is just a Bash script running in a certain environment,
mostly defining certain Bash functions, and so may be useful even to
non-Gentoo users as reading material. (It's not a makefile, nor is it in a
special file format like what you find in rpm and dpkg packages.)

(Gentoo users may be curious about my ebuild-writing style. It is based on
what is common practice in Exherbo Linux, though their repository layout
and script conventions are different.)
