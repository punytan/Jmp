package Jmp::Web::Shorten;
use sane;
use parent 'Aqua::Handler';
use URI;
use Jmp::DB::URL;
use Encode;

my $db = Jmp::DB::URL->new;

sub shorten {
    my ($self, $context) = @_;

    my $url = $context->request->body_parameters->{url}
        or return $self->throw(500);

    my $memo = Encode::decode_utf8( $context->request->body_parameters->{memo} // '' );
    my $location = URI->new($url)->as_string;

    my $last_insert_id = $db->insert_url(
        url  => $location,
        memo => $memo,
    );

    $context->stash->{url} = $location;
    $context->stash->{memo} = $memo;
    $context->stash->{id} = $last_insert_id;

    return $self->render("shorten/result");
}

1;
__END__
