# ats-lang.github.io
For hosting certain parts of
[ats-lang.org](https://www.ats-lang.org)

[comment]: # Tue May  6 06:18:17 PM EDT 2025

[comment]: # HX-2025-05-06: Let's start to build now!

## Resources

- [Downloads](./DOWNLOAD/README.md)
- [Documents](./DOCUMENT/README.md)
- [Libraries](./LIBRARY0/README.md)

## What is ATS?

Let me first paraphrase
[Prof. John Reynolds](https://en.wikipedia.org/wiki/John_C._Reynolds).
_A programming language should be simple and general; it should possess
a (highly) efficient implementation and allow for (highly) extensive
error-checking both statically and dynamically_.  And I now add my own.
_A programming language should also (greatly) enhance programming
productivity through its forever expanding meta-programming
support_. ATS aspires to be such a superman programing language, and it
is becoming one.

ATS is a statically typed programming language originally designed to
unify implementation with formal specification. It is equipped with a
highly expressive type system rooted in the framework Applied Type System,
which gives the language its name. In particular, both dependent types
and linear types are available in ATS.

## What is ATS good for?
- ATS can greatly enforce precision in practical programming.
- ATS can greatly facilitate refinement-based software development.
- ATS allows the programmer to write efficient functional programs
  that directly manipulate native unboxed data representation.
- ATS allows the programmer to reduce the memory footprint of
  a program by making use of linear types.
- ATS allows the programmer to enhance the safety (and efficiency) of
  a program by making use of theorem-proving.
- ATS allows the programmer to write safe low-level code that runs in OS kernels.
- ATS can help teach type theory, demonstrating both convincingly and concretely
  the power and potential of types in constructing high-quality software.

## Suggestion on learning ATS

ATS is feature-rich (like C++). Prior knowledge of functional
programming based on ML and imperative programming based on C can be a
big plus for learning ATS. In general, one should expect to encounter
many unfamiliar programming concepts and features in ATS and be
prepared to spend a substantial amount of time on learning
them. Hopefully, one will become a superbly confident programmer at
the end who can enjoy implementing large and complex systems with
minimal need for debugging.