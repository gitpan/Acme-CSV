use ExtUtils::MakeMaker;

my $prereqs = {
  Test::More => 0.86,
};

WriteMakefile(
  ABSTRACT_FROM => 'lib/Acme/CSV.pm',
  VERSION_FROM  => 'lib/Acme/CSV.pm',
  NAME          => 'Acme::CSV',
  PREREQ_PM     => $prereqs,
  LICENSE       => 'lgpl',
  AUTHOR        => 'Christopher Rath <Christopher@Rath.ca>, Mark Mielke <Mark@Mielke.cc>, Alex Ayars <pause@nodekit.org>',
);
