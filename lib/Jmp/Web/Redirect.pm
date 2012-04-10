package Jmp::Web::Redirect;
use sane;
use parent 'Aqua::Handler';
use URI;
use Jmp::DB::URL;

my $db = Jmp::DB::URL->new;

sub redirector {
    my ($self, $context, $id) = @_;

    if (my $row = $db->select_id($id)) {
        $db->increment_count($id);
        my $url = URI->new($row->{url})->as_string;
        return [301, [Location => $url], []];
    }

    return $self->throw(404);
}

1;

