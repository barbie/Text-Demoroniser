use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'			=> 'Text::Demoroniser',
    'VERSION_FROM'	=> 'lib/Text/Demoroniser.pm',
    'PREREQ_PM'		=> {

        Encode::ZapCP1252   => 0,
		Test::More	        => 0.70,	# for testing
	},
	NO_META			=> 1,

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT	=> 'A text filter that allows you to demoronise a string',
       AUTHOR	=> 'Barbie <barbie@cpan.org>') : ()),
);
