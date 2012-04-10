package Jmp::DB;
use sane;
use FindBin;
use DBIx::Connector;

sub new {
    my ($class, %args) = @_;

    my $dbname = $args{dbname} || "$FindBin::Bin/db/url.db";

    my $conn = DBIx::Connector->new(
        "dbi:SQLite:dbname=$dbname", "", "",
        { RootClass => 'DBIx::Extended' }
    );

    return bless { conn => $conn }, $class;
}

sub dbh { shift->{conn}->dbh }

1;
__END__
