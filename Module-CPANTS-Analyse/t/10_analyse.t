use Test::More;
use Test::NoWarnings;
use Test::Deep;

use Module::CPANTS::Analyse;
#use File::Spec::Functions;
use Data::Dumper    qw(Dumper);
use File::Copy      qw(copy);
use Module::CPANTS::Kwalitee::Distros;
{
    no warnings;
    *Module::CPANTS::Kwalitee::Distros::mirror = sub {
        copy 't/eg/Debian_CPANTS.txt', '.';
    };
}

my @tests = (
#    {
#        dist => 't/eg/Acme-DonMartin-0.06.tar.gz',
#    },
    {
        dist => 't/eg/Text-CSV_XS-0.40.tgz',
        kwalitee => {
           'extracts_nicely' => 1,
           'has_buildtool' => 1,
           'has_readme' => 1,
           'manifest_matches_dist' => 1,
           'metayml_declares_perl_version' => 0,
           'has_example' => 1,
           'has_test_pod_coverage' => 1,
           'metayml_is_parsable' => 1,
           'proper_libs' => 1,
           'has_changelog' => 1,
           'no_pod_errors' => 1,
           'use_strict' => 1,
           'kwalitee' => 39,
           'no_stdin_for_prompting' => 1,
           'has_test_pod' => 1,
           'easily_repackageable' => 1,
           'easily_repackageable_by_fedora' => 1,
           'has_tests' => 1,
           'easily_repackageable_by_debian' => 1,
           'has_manifest' => 1,
           'no_symlinks' => 1,
           'has_version' => 1,
           'extractable' => 1,
           'buildtool_not_executable' => 1,
           'has_working_buildtool' => 1,
           'metayml_has_license' => 1,
           'has_humanreadable_license' => 1,
           'no_generated_files' => 1,
           'has_meta_yml' => 1,
           'metayml_conforms_spec_current' => 1,
           'use_warnings' => 1,
           'no_large_files' => 1,
           'no_cpants_errors' => 1,
           'has_tests_in_t_dir' => 1,
           'has_version_in_each_file' => 1,
           'fits_fedora_license' => 1,
           'has_proper_version' => 1,
           'metayml_conforms_to_known_spec' => 1,
           'has_separate_license_file' => 0,
           'has_license_in_source_file' => 1,
           'metayml_has_provides'=>0,
           'distributed_by_debian'=>1,
           'latest_version_distributed_by_debian'=>0,
           'has_no_bugs_reported_in_debian'=>1,
           'has_no_patches_in_debian'=>0,
        },
        error => {
            'latest_version_distributed_by_debian' =>
                "Seen on CPAN: '0.40'. Reported by Debian: 'not-uploaded' See: <a href=http://packages.debian.org/src:libtext-csv-xs-perl>Basic homepage</a>",
                'has_no_patches_in_debian' => 'Number of patches reported: 1. See: <a href=http://packages.debian.org/src:libtext-csv-xs-perl>Basic homepage</a>',
        },
    },
    {
        dist =>  't/eg/Pipe-0.03.tar.gz',
        kwalitee => {
           'extracts_nicely' => 1,
           'has_buildtool' => 1,
           'has_readme' => 1,
           'manifest_matches_dist' => 0,
           'metayml_declares_perl_version' => 0,
           'has_example' => 0,
           'has_test_pod_coverage' => 1,
           'metayml_is_parsable' => 0,
           'proper_libs' => 1,
           'has_changelog' => 1,
           'no_pod_errors' => 1,
           'use_strict' => 1,
           'kwalitee' => 28,
           'no_stdin_for_prompting' => 1,
           'has_test_pod' => 1,
           'easily_repackageable' => 0,
           'easily_repackageable_by_fedora' => 0,
           'has_tests' => 1,
           'easily_repackageable_by_debian' => 1,
           'has_manifest' => 1,
           'no_symlinks' => 1,
           'has_version' => 1,
           'extractable' => 1,
           'buildtool_not_executable' => 1,
           'has_working_buildtool' => 1,
           'metayml_has_license' => 0,
           'has_humanreadable_license' => 0,
           'no_generated_files' => 1,
           'has_meta_yml' => 0,
           'metayml_conforms_spec_current' => 0,
           'use_warnings' => 1,
           'no_large_files' => 1,
           'no_cpants_errors' => 1,
           'has_tests_in_t_dir' => 1,
           'has_version_in_each_file' => 0,
           'fits_fedora_license' => 0,
           'has_proper_version' => 1,
           'metayml_conforms_to_known_spec' => 0,
           'has_separate_license_file' => 0,
           'has_license_in_source_file' => 1,
           'metayml_has_provides'=>0,
           'distributed_by_debian'=>1,
           'latest_version_distributed_by_debian'=>1,
           'has_no_bugs_reported_in_debian'=>0,
           'has_no_patches_in_debian'=>1,
        },
        error => {
            'has_version_in_each_file' => bag (
                                    'lib/Pipe/Tube/Say.pm',
                                    'lib/Pipe/Tube/Map.pm',
                                    'lib/Pipe/Tube/Cat.pm',
                                    'lib/Pipe/Tube/Glob.pm',
                                    'lib/Pipe/Tube/Sort.pm',
                                    'lib/Pipe/Tube/Uniq.pm',
                                    'lib/Pipe/Tube/Find.pm',
                                    'lib/Pipe/Tube/Grep.pm',
                                    'lib/Pipe/Tube/Split.pm',
                                    'lib/Pipe/Tube/Print.pm',
                                    'lib/Pipe/Tube/For.pm',
                                    'lib/Pipe/Tube.pm',
                                    'lib/Pipe/Tube/Chomp.pm',
                                    'lib/Pipe/Tube/Tuple.pm'
                                  ),
            'easily_repackageable' => 'easily_repackageable_by_fedora',
            'easily_repackageable_by_fedora' => 'fits_fedora_license',
            'metayml_conforms_spec_current'  => ['1.3', 
                'Missing mandatory field, \'author\' (author) [Validation: 1.3]',
                'Missing mandatory field, \'generated_by\' (generated_by) [Validation: 1.3]',
                'Missing mandatory field, \'version\' (version) [Validation: 1.3]',
                                            'Missing mandatory field, \'name\' (name) [Validation: 1.3]',
                                            'Missing mandatory field, \'license\' (license) [Validation: 1.3]',
                                            'Missing mandatory field, \'abstract\' (abstract) [Validation: 1.3]',
                                            'Missing mandatory field, \'version\' (meta-spec -> version) [Validation: 1.3]',
                                            'Missing mandatory field, \'url\' (meta-spec -> url) [Validation: 1.3]'
            ],
            'metayml_conforms_to_known_spec' => ['1.0', 
            'Missing mandatory field, \'generated_by\' (generated_by) [Validation: 1.0]',
                                                 'Missing mandatory field, \'version\' (version) [Validation: 1.0]',
                                                 'Missing mandatory field, \'name\' (name) [Validation: 1.0]',
                                                 'Missing mandatory field, \'license\' (license) [Validation: 1.0]'

            ],
            'manifest_matches_dist' => [
                                        'MANIFEST (27) does not match dist (26):',
                                        'Missing in MANIFEST: ',
                                        'Missing in Dist: META.yml'
                                      ],
            'has_no_bugs_reported_in_debian' => 'Number of bugs reported: 2. See: <a href=http://packages.debian.org/src:libpipe-perl>Basic homepage</a>',
        },
    },
    {
        dist => 't/eg/PPI-HTML-1.07.tar.gz',
        kwalitee => {
           'extracts_nicely' => 1,
           'has_buildtool' => 1,
           'has_readme' => 1,
           'manifest_matches_dist' => 1,
           'metayml_declares_perl_version' => 1,
           'has_example' => 1,
           'has_test_pod_coverage' => 0,
           'metayml_is_parsable' => 1,
           'proper_libs' => 1,
           'has_changelog' => 1,
           'no_pod_errors' => 1,
           'use_strict' => 1,
           'kwalitee' => 35,
           'no_stdin_for_prompting' => 1,
           'has_test_pod' => 1,
           'easily_repackageable' => 1,
           'easily_repackageable_by_fedora' => 1,
           'has_tests' => 1,
           'easily_repackageable_by_debian' => 1,
           'has_manifest' => 1,
           'no_symlinks' => 1,
           'has_version' => 1,
           'extractable' => 1,
           'buildtool_not_executable' => 1,
           'has_working_buildtool' => 1,
           'metayml_has_license' => 1,
           'has_humanreadable_license' => 1,
           'no_generated_files' => 1,
           'has_meta_yml' => 1,
           'metayml_conforms_spec_current' => 0,
           'use_warnings' => 0,
           'no_large_files' => 1,
           'no_cpants_errors' => 1,
           'has_tests_in_t_dir' => 1,
           'has_version_in_each_file' => 1,
           'fits_fedora_license' => 1,
           'has_proper_version' => 1,
           'metayml_conforms_to_known_spec' => 1,
           'has_separate_license_file' => 0,
           'has_license_in_source_file' => 1,
           'metayml_has_provides'=>0,
           'distributed_by_debian'=>0,
           'latest_version_distributed_by_debian'=>0,
           'has_no_bugs_reported_in_debian'=>0,
           'has_no_patches_in_debian'=>0,
         },
        error => {
           'metayml_conforms_spec_current' => [
                                                '1.3',
                                                'Missing mandatory field, \'version\' (meta-spec -> version) [Validation: 1.3]',
                                                'Missing mandatory field, \'url\' (meta-spec -> url) [Validation: 1.3]',
                                                'Expected a list structure (author) [Validation: 1.3]'
                                              ],
        },
    },
    {
        dist => 't/eg/App-Wack-0.05.tar.gz',
        kwalitee => {
           'extracts_nicely' => 1,
           'has_buildtool' => 1,
           'has_readme' => 1,
           'manifest_matches_dist' => 1,
           'metayml_declares_perl_version' => 0,
           'has_example' => 1,
           'has_test_pod_coverage' => 1,
           'metayml_is_parsable' => 1,
           'proper_libs' => 1,
           'has_changelog' => 1,
           'no_pod_errors' => 1,
           'use_strict' => 1,
           'kwalitee' => 38,
           'no_stdin_for_prompting' => 1,
           'has_test_pod' => 1,
           'easily_repackageable' => 1,
           'easily_repackageable_by_fedora' => 1,
           'has_tests' => 1,
           'easily_repackageable_by_debian' => 1,
           'has_manifest' => 1,
           'no_symlinks' => 1,
           'has_version' => 1,
           'extractable' => 1,
           'buildtool_not_executable' => 1,
           'has_working_buildtool' => 1,
           'metayml_has_license' => 1,
           'has_humanreadable_license' => 1,
           'no_generated_files' => 1,
           'has_meta_yml' => 1,
           'metayml_conforms_spec_current' => 1,
           'use_warnings' => 1,
           'no_large_files' => 1,
           'no_cpants_errors' => 1,
           'has_tests_in_t_dir' => 1,
           'has_version_in_each_file' => 1,
           'fits_fedora_license' => 1,
           'has_proper_version' => 1,
           'metayml_conforms_to_known_spec' => 1,
           'has_separate_license_file' => 0,
           'has_license_in_source_file' => 1,
           'metayml_has_provides'=>1,
           'distributed_by_debian'=>0,
           'latest_version_distributed_by_debian'=>0,
           'has_no_bugs_reported_in_debian'=>0,
           'has_no_patches_in_debian'=>0,
        },
        error => {
        },
    },
);

plan tests => 1 + 3 * @tests;

foreach my $t (@tests) {
    my $a=Module::CPANTS::Analyse->new({
        dist=> $t->{dist},
        _dont_cleanup=>$ENV{DONT_CLEANUP},
    });

    my $rv=$a->unpack;
    is($rv,undef,'unpack ok');

    $a->analyse;
    $a->calc_kwalitee;

    my $d=$a->d;
    my $kw=$a->d->{kwalitee};
    cmp_deeply($kw, $t->{kwalitee}, "kwalitee of $t->{dist}")
        or diag(Dumper $kw);
    cmp_deeply($d->{error}, $t->{error}, "error of $t->{dist}")
        or diag(Dumper $d->{error});
    #diag(Dumper $d);
}

