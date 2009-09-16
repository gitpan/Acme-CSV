use strict;
use warnings;

###
### Tests adapted from original CSV module by maintainer
###

use Test::More qw| no_plan |;

my @in = split /\n/, q|"One from FAQ will do","sec""ond"
"But, not","3rd""","or","""fifth"
"don't","forget","fourth"",""","and"  ,  """,""sixth".
"Of course, it doesn't solve",everything,8,N,1
"Is there a new emacs   perl-mode?"
"Tom","tom@fiction.org"
Empty fields needed,,"and "wanted

Some,"",boundary  ",cases"",  ,too
Grok this\, Spok!
"Didn't you notice\! in it \{the spec\}"
"Multi-
line",test|;

my @out = split /\n/, q|One from FAQ will do:sec"ond
But, not:3rd":or:"fifth
don't:forget:fourth",":"and"  :  """:""sixth".
Of course, it doesn't solve:everything:8:N:1
Is there a new emacs   perl-mode?
Tom:tom@fiction.org
Empty fields needed::"and "wanted

Some::boundary  ":cases"":  :too
Grok this\: Spok!
Didn't you notice\! in it \{the spec\}
"Multi-
line":test|;

use_ok("Acme::CSV");

for ( my $i = 0; $i < @in; $i++ ) {
  my $in = $in[$i];
  my $out = $out[$i];

  is( join(":", Acme::CSV::CSVsplit($in)), $out );
}
