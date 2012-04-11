use sane;
use Jmp::Web;
use Jmp::Router;
use Jmp::DB::Session;

my $session = Jmp::DB::Session->new;

my $jmp = Jmp::Web->new(
    router => Jmp::Router->register,
    middlewares => {
        Session => {
            Store => { DBI => { get_dbh => sub { $session->dbh } } }
        }
    }
);

$jmp->to_app;
