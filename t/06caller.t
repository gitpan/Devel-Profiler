use Test::More tests => 4;
use Devel::Profiler::Test qw(profile_code check_tree get_times);

profile_code(<<'END', "make sure overridden caller() works");
sub foo {
    die unless (caller(1))[3] eq 'main::bar';
}
sub bar {
    foo();
}
bar;
END

# make sure the call tree looks right
check_tree(<<END, "checking tree");
main::bar
   main::foo
END


profile_code(<<'END', "make sure overridden caller() works");
sub foo {
    die unless (caller(1))[3] eq 'main::bar';
    die unless (caller(2))[3] eq 'main::baz';
}
sub bar {
    foo();
    die unless (caller(1))[3] eq 'main::baz';
}
sub baz {
    bar();
    die if caller();
}
baz;
END

# make sure the call tree looks right
check_tree(<<END, "checking tree");
main::baz
   main::bar
      main::foo
END

