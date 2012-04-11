package Jmp::Router;
use sane;
use Router::Lazy;

sub register {
    my $router = Router::Lazy->instance("Jmp::Web");

    $router->get("/" => "Root#index");
    $router->get("/shorten" => "Root#index");
    $router->post("/shorten" => "Shorten#shorten");
    $router->get("/id/:id"  => "Redirect#redirector");

    return $router;
}

1;
__END__
