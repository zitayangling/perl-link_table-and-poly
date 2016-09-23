use poly;
use strict;

my $one = poly->new(10);
print "请输出coef,expon:\n";
while (chomp(my $coef = <STDIN>) and chomp(my $expon = <STDIN>)) 
{
	$one->add_node($coef,$expon,undef);$one->print_link;
}

my $two = poly->new(10);
print "请输出coef,expon:\n";
while (chomp(my $coef = <STDIN>) and chomp(my $expon = <STDIN>)) 
{
	$two->add_node($coef,$expon,undef);$two->print_link;
}

my $one_index = $$one{curr_size};
my $two_index = $$two{curr_size};


my $three = poly->new(10);


#加入 计算后指数相等的项，和第一多项式的其他项
my $one_next = $$one{head}->{next};
my $one_expon = $one_next->{expon};
my $one_coef = $one_next->{coef};

for (my $i = 0; $i < $one_index; $i++) 
{	 
	my $one_same_expon = undef;
	my $two_next = $$two{head}->{next};
	my $two_expon = $two_next->{expon};
	my $two_coef = $two_next->{coef};

	for (my $j = 0; $j < $two_index; $j++) 
	{
		if ($one_expon eq $two_expon) 
		{	
			my $one_and_two = $one_coef + $two_coef;
			$three->add_node($one_and_two,$two_expon,undef);
			$one_same_expon = $two_expon;
		}
		$two_next = $two_next->{next};
		$two_expon = $two_next->{expon};
		$two_coef = $two_next->{coef};
		

	}
	if ($one_same_expon == undef) {
		$three->add_node($one_coef,$one_expon,undef);
	}
	$one_next = $one_next->{next};
	$one_expon = $one_next->{expon};
	$one_coef = $one_next->{coef};
	

}

#加入第二多项式的其他项
my $two_next = $$two{head}->{next};
my $two_expon = $two_next->{expon};
my $two_coef = $two_next->{coef};
for (my $i = 0; $i < $two_index; $i++) 
{	 
	my $two_same_expon = undef;
	my $one_next = $$one{head}->{next};
	my $one_expon = $one_next->{expon};
	my $one_coef = $one_next->{coef};

	for (my $j = 0; $j < $one_index; $j++) 
	{
		if ($one_expon eq $two_expon) 
		{	
			$two_same_expon = $two_expon;
		}
		$one_next = $one_next->{next};
		$one_expon = $one_next->{expon};
		$one_coef = $one_next->{coef};
	}
	if ($two_same_expon == undef) {
		$three->add_node($two_coef,$two_expon,undef);
	}
	$two_next = $two_next->{next};
	$two_expon = $two_next->{expon};
	$two_coef = $two_next->{coef};

}

	
$three->print_link;
