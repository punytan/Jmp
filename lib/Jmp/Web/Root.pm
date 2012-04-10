package Jmp::Web::Root;
use sane;
use parent 'Aqua::Handler';
use Data::Dumper;
use Jmp::DB::URL;

my $db = Jmp::DB::URL->new;

sub index {
    my ($self, $context) = @_;

    $context->stash->{list} = [ reverse @{ $db->list } ];

    return $self->render("root/index");
}

1;
