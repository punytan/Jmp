package Jmp::DB::Config;
use sane;
use FindBin;
use parent 'DBIx::Rainy::Config';

my $base_path = "$FindBin::Bin/db";

my $attrs = {
    RaiseError => 1,
    AutoCommit => 1,
    PrintError => 0,
    ShowErrorStatement  => 1,
    AutoInactiveDestroy => 1,
    sqlite_unicode => 1,
};

__PACKAGE__->add_connect_info(
    url_master => {
        dsn => "dbi:SQLite:dbname=${base_path}/url.db",
        user => "", password => "",
        attrs => $attrs,
    }
);

1;
__END__
