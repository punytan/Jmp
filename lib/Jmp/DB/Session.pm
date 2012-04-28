package Jmp::DB::Session;
use sane;
use DBIx::Connector;
use FindBin;

sub new {
    my $class = shift;
    my $attrs = {
        RaiseError => 1,
        AutoCommit => 1,
        PrintError => 0,
        ShowErrorStatement  => 1,
        AutoInactiveDestroy => 1,
    };

    my $base_path = "$FindBin::Bin/db";
    my $conn = DBIx::Connector->new(
        "dbi:SQLite:dbname=${base_path}/sessions.db", "", "",
        $attrs
    );

    return bless { conn => $conn }, $class;
}

sub dbh { shift->{conn}->dbh }

1;

