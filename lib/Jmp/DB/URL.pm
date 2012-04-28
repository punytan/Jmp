package Jmp::DB::URL;
use sane;
use parent 'DBIx::Rainy::Base';
use Carp;

__PACKAGE__->config_class("Jmp::DB::Config");

sub insert_url {
    my ($self, %args) = @_;

    for (qw/ url memo /) {
        Carp::croak "<$_> is required parameter"
            unless defined $args{$_};
    }

    $self->connect("url_master")->txn(
        fixup => sub {
            my $dbh = shift;
            my $sth = $dbh->prepare(
                "insert into urls (url, memo, count) values (?, ?, ?)"
            );
            $sth->execute($args{url}, $args{memo}, $args{count} || 0);
            $dbh->sqlite_last_insert_rowid;
        }
    );
}

sub list {
    my ($self, %args) = @_;
    $args{limit} ||= 30;

    $self->connect("url_master")->txn(
        fixup => sub {
            my $dbh = shift;
            $dbh->selectall_arrayref(
                "select * from urls order by id desc limit ?",
                {Slice => {}},
                $args{limit}
            );
        }
    );
}

sub increment_count {
    my ($self, $id) = @_;
    $self->connect("url_master")->txn(
        ping => sub {
            my $dbh = shift;
            my $sth = $dbh->prepare(
                "update urls set count = count + 1 where id = ?"
            );
            $sth->execute($id);
        }
    );
}

sub select_id {
    my ($self, $id) = @_;
    $self->connect("url_master")->txn(
        fixup => sub {
            my $dbh = shift;
            $dbh->selectrow_hashref(
                "select * from urls where id = ?", {}, $id
            );
        }
    );
}

1;
__END__
