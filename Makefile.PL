use 5.010001;
use ExtUtils::MakeMaker;

my $LIBS = qx(pkg-config glfw3 --libs --static) || '-lglfw3';
my $INCS = qx(pkg-config glfw3 --cflags)        || '';

WriteMakefile(
    NAME              => 'OpenGL::GLFW',
    VERSION_FROM      => 'lib/OpenGL/GLFW.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {
        'ExtUtils::MakeMaker' => 6.64,         # needed for TEST_REQUIRES
    },
    MIN_PERL_VERSION => '5.010',
    TEST_REQUIRES     => {
        'OpenGL::Modern' => '0.0404', # glUniformMatrix4fv_p
    },
    ABSTRACT_FROM     => 'lib/OpenGL/GLFW.pm', # retrieve abstract from module
    AUTHOR            => 'Chris Marshall <chm@cpan.org>',
    LICENSE           => 'perl',
    LIBS              => ["$LIBS"],            # e.g., '-lm'
    DEFINE            => '',                   # e.g., '-DHAVE_SOMETHING'
    INC               => "$INCS",              # e.g., '-I. -I/usr/include/other'
    META_MERGE        => {
        "meta-spec" => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url => 'git://github.com/devel-chm/OpenGL-GLFW.git',
                web => 'https://github.com/devel-chm/OpenGL-GLFW.git',
            },
        },
    },
);
