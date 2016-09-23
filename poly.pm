use strict;

package poly;
# print "请输入链表的head和长度：\n";
sub node {
    my ($coef,$expon,$next) = @_;
    my %node = (
    coef=>$coef,
    expon=>$expon,
    next=>$next,
        );
    return %node;
}
sub new {
    my ($class,$size) = @_;
    $class = ref $class if ref $class;
    my %head = (
            coef=>undef,
            expon=>undef,
            next=>undef,
        );
    my $link_table = {
                head =>\%head,
                next=>undef,
                max_size => $size,
                curr_size=>0,
               };

    bless ($link_table,$class);
    $link_table;
}
sub add_node {
    my $self = shift;
    my ($coef,$expon,$next) = @_;
    $$self{curr_size}++;
    my %node = &node($coef,$expon,$next);
    if ($next == undef) 
    {
        if ($$self{head}->{next} == undef) 
        {
            $$self{head}->{next} = \%node;
            $$self{next} = $$self{head}->{next};
        }else
        {   
            $$self{next}->{next} = \%node;
            $$self{next} = $$self{next}->{next};
        }

    }
    else
    {
        if ($next =~ /\d+/ ) 
        {
            if ($next eq $$self{curr_size}-1) {
                print "警告！超出\n";
                $$self{curr_size}--;
            }
            else
            {
                print "在第$next 个后面添加\n";
                my $next_node = $$self{head}->{next};
                for (my $i = 0; $i < $next-1; $i++) 
                {
                    $next_node = $next_node->{next};
                    # print "now is $next_node->{data}\n";
                    
                }
                my %new_node = &node($coef,$expon,$next_node->{next});
                $next_node->{next} = \%new_node;
            }
        }
        else
        {
            print "输入错误，请输入在第*个后面添加！\n";
        }
    }
    
    
}
sub print_link {
    my $head = shift;
    my $next = $$head{head}->{next};
    my $index = $$head{curr_size};
    print "index = $index\n";
    for (my $i = 0; $i < $index; $i++) 
    {
        if($next == $$head{head}->{next})
        {
           print "$next->{coef}x^$next->{expon}";
        }
        else
        {
            if ($next->{coef} =~ /\-[\d+]/) 
            {
                print "$next->{coef}x^$next->{expon}";
            }
            else
            {
               print "+$next->{coef}x^$next->{expon}";
            }
        }
        $next = $next->{next};
    }
    print "\n";
}
1;