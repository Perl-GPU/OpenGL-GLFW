use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'OpenGL::GLFW',
    VERSION_FROM      => 'lib/OpenGL/GLFW.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/OpenGL/GLFW.pm', # retrieve abstract from module
    AUTHOR            => 'Chris Marshall <chm@cpan.org>',
    LICENSE           => 'perl',
    LIBS              => ['-L/cygdrive/c/Perl/local64/glfw/lib -lglfw3 -lX11 -lxrandr -lxinerama -lxcursor'], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    # Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
