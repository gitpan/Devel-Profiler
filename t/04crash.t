use Test::More tests => 3;
use Devel::Profiler::Test qw(profile_code check_tree get_times);

profile_code(<<'END', "check code that crashes Devel::DProf");
sub foo { goto FOO; }
foo();
FOO: 1;
END

check_tree(<<'END', "check crash tree", "-F");
main::foo
END

profile_code(<<'END', "check Test::More code that crashes Devel::DProf");
use Test::More qw(skip);
SKIP: { skip(1, "test"); }
END

# can't be sure Test::More's internals won't change the tree, so just
# make sure it doesn't crash.

