use sane;
use FindBin::libs;
use Jmp::Web;
use Jmp::DB::Session;

my $session = Jmp::DB::Session->new;

my $jmp = Jmp::Web->new(
    handler_class => "Jmp::Web",
    middlewares => {
        Session => {
            Store => { DBI => { get_dbh => sub { $session->dbh } } }
        }
    }
);

$jmp->to_app;
