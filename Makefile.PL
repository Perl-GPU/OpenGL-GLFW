use 5.010001;
use ExtUtils::MakeMaker;

my $LIBS = qx(pkg-config glfw3 --libs --static) || '-lglfw3';
my $INCS = qx(pkg-config glfw3 --cflags)        || '';

WriteMakefile(
  NAME => 'OpenGL::GLFW',
  VERSION_FROM => 'lib/OpenGL/GLFW.pm',
  PREREQ_PM => {
    'ExtUtils::MakeMaker' => 6.64, # needed for TEST_REQUIRES
  },
  MIN_PERL_VERSION => '5.010',
  TEST_REQUIRES => {
    'OpenGL::Modern' => '0.0404', # glUniformMatrix4fv_p
  },
  ABSTRACT_FROM => 'lib/OpenGL/GLFW.pm',
  AUTHOR => 'Chris Marshall <chm@cpan.org>',
  LICENSE => 'perl',
  LIBS => [$LIBS],
  DEFINE => '',
  INC => $INCS,
  META_MERGE => {
    "meta-spec" => { version => 2 },
    resources => {
      bugtracker => {web=>'https://github.com/Perl-GPU/OpenGL-GLFW/issues'},
      repository => {
        type => 'git',
        url => 'git://github.com/Perl-GPU/OpenGL-GLFW.git',
        web => 'https://github.com/Perl-GPU/OpenGL-GLFW.git',
      },
    },
  },
);
