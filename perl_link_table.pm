use strict;

package perl_link_table;
# print "请输入链表的head和长度：\n";
sub node {
    my ($data,$next) = @_;
    my %node = (
    data=>$data,
    next=>$next,
        );
    return %node;
}
sub new {
    my ($class,$size) = @_;
    $class = ref $class if ref $class;
    my %head = (
            data=>undef,
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
    my ($data,$next) = @_;
    $$self{curr_size}++;
    # my $name = "node$index";
    my %node = &node($data,$next);
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
                my %new_node = &node($data,$next_node->{next});
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
        print "node$i=$next->{data}\n";
        $next = $next->{next};
     }
}
# sub new {
#     my ($class,$size) = @_;
#     $class = ref $class if ref $class;
#     my $link_table = {
#                 head =>undef,
#                 max_size => $size,
#                 curr_size=>0,
#                 name=>undef,
#                };

#     bless ($link_table,$class);
#     $link_table;
# }

# sub add_to_last {
#     my $link_table= shift;
#     my $data = shift;
#     $$link_table{curr_size}++;
#     if($$link_table{curr_size} > $$link_table{max_size})
#     {
#         print "link_table is full!\n";
#     }

#     #if only have a head
#     if($$link_table{head} eq undef)
#     {
#         #创建节点，连接在头后面

#         $$link_table{head} = $data;
#         $$link_table{name} = $data;
#         $$link_table{$data} = undef;

        
#     }else
#     {

#         my $name = $$link_table{name};
#         $$link_table{$name} = $data;
#         $$link_table{name} = $data;
#         $$link_table{$data} = undef;

#     }
#     return;
# }
sub dalete_node {
    my $link_table = shift;
    my $data = shift;
    #删除head
    my $head = $$link_table{head};
    if($data eq $head) {
        $$link_table{head} = $$link_table{$data};
        $$link_table{curr_size}--;
    }
    #删除center
    for (my $i = 0; $i < 10; $i++) 
    {
        my $name = "head";
        my $next = $$link_table{$name};
        if($next eq $data)
        {
            $$link_table{$name} = $$link_table{$next};
            $$link_table{curr_size}--;
            last;
        }
        else
        {
            $name = $$link_table{$name};
            $next = $$link_table{$name};
        }
    }
    #删除last
    if($$link_table{$data} == undef)
    {
        my $name = "head";
        my $next = $$link_table{$name};
        for (my $i = 0; $i < 10; $i++) 
        {
            if($next eq $data)
            {
                $$link_table{$name} = undef;
                $$link_table{curr_size}--;
                last;
            }
            else
            {
                $name = $$link_table{$name};
                $next = $$link_table{$name};
            }
        }
    }
}
# sub print_link {
#     my $head = shift;
#     my $data = $$head{head};
#     my $index = $$head{curr_size};
#     print "index = $index\n";
#     for (my $i = 0; $i < $index; $i++) {
#          print "$data\n";
#         $data = $$head{$data};  
#      }
# }
 
1;