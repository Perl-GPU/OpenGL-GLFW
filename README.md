OpenGL-GLFW version 0.02_01
============================

OpenGL::GLFW provides perl bindings to the GLFW3 library.

This first implementation requires you to have the GLFW
library and header files installed and in your compiler
search paths.  It does use pkg-config so if you have
the GLFW libraries built with the glfw3.pc file in your
PKG_CONFIG_PATH environment or the default location then
this module should build.

Alien::GLFW implementation is on the TODO list.


INSTALLATION
------------

Assuming that you have GLFW installed on your system and
have the includes and library in the standard, system locations,
you should be able To install this module by typing the
following:

   perl Makefile.PL
   make
   make test     # will run a sample program as final test
   make install


DEPENDENCIES
------------

This module provides a more modern, lighter-weight window and
system interaction interface compared to OpenGL::GLUT.  You
can use OpenGL::Modern for the perl bindings to OpenGL.


COPYRIGHT AND LICENCE

Copyright (C) 2017 by Chris Marshall <chm@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


