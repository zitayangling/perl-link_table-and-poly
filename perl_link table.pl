use perl_link_table;
use strict;

my $self = perl_link_table->new(10);
$self->add_node(1,undef);
$self->add_node(2,undef);
$self->add_node(3,undef);
$self->add_node("www",2);
$self->add_node("xxx",4);
$self->add_node("yyy",undef);
# print $$self{head}->{next}->{next}->{data};
$self->print_link;

