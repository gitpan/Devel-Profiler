use Test::More tests => 2;
use Devel::Profiler::Test qw(profile_code check_tree get_times 
                             write_module cleanup_module);

# setup module file for test below
write_module("Exporting", <<'END');
package Exporting;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(exported);
sub exported { 1; }
1;
END

profile_code(<<'END', "Check that the profiler groks packages");
use Exporting;
exported();
END

check_tree(<<'END', "Check tree for package usage");
Exporting::exported
END

cleanup_module("Exporting");
