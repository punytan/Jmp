use sane;
use Jmp::Web;
use Jmp::Router;
use Jmp::DB::Session;
use Plack::Builder;

my $session = Jmp::DB::Session->new;

my $jmp = Jmp::Web->new(
    router => Jmp::Router->register,
    middlewares => {
        Session => {
            Store => { DBI => { get_dbh => sub { $session->dbh } } }
        }
    }
);

builder {
    enable_if { $ENV{PLACK_ENV} eq 'development' } 'Debug';
    $jmp->to_app;
};

