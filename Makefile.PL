use ExtUtils::MakeMaker;

use 5.006001;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME		=> 'Devel::Profiler',
    VERSION_FROM	=> 'lib/Devel/Profiler.pm',
    PREREQ_PM		=> { B => 0, Carp => 0, Time::HiRes => 0 },
    ABSTRACT_FROM       => 'lib/Devel/Profiler.pm',
    AUTHOR              => 'Sam Tregar <sam@tregar.com>',
);
