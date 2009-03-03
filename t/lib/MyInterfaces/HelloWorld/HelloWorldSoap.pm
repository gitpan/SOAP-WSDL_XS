package MyInterfaces::HelloWorld::HelloWorldSoap;
use strict;
use warnings;
use Class::Std::Fast::Storable;
use Scalar::Util qw(blessed);
use base qw(SOAP::WSDL::Client::Base);

# only load if it hasn't been loaded before
require MyTypemaps::HelloWorld
    if not MyTypemaps::HelloWorld->can('get_class');

sub START {
    $_[0]->set_proxy('http://localhost:81/soap-wsdl-test/helloworld.pl') if not $_[2]->{proxy};
    $_[0]->set_class_resolver('MyTypemaps::HelloWorld')
        if not $_[2]->{class_resolver};
}

sub sayHello {
    my ($self, $body, $header) = @_;
    die "sayHello must be called as object method (\$self is <$self>)" if not blessed($self);
    return $self->SUPER::call({
        operation => 'sayHello',
        soap_action => 'urn:HelloWorld#sayHello',
        style => 'document',
        body => {
            
           'use' => 'literal',
            namespace => '',
            encodingStyle => '',
            parts => [qw( MyElements::sayHello )],
        },
        header => {
            
        },
        headerfault => {
            
        }
    }, $body, $header);
}



1;



__END__

=pod

=head1 NAME


MyInterfaces::HelloWorld::HelloWorldSoap - SOAP Interface for the HelloWorld Web Service

=head1 SYNOPSIS

 use MyInterfaces::HelloWorld::HelloWorldSoap;
 my $interface = MyInterfaces::HelloWorld::HelloWorldSoap->new();
 
 my $response;
 $response = $interface->sayHello();

 

=head1 DESCRIPTION

SOAP Interface for the HelloWorld web service
located at http://localhost:81/soap-wsdl-test/helloworld.pl.

=head1 SERVICE HelloWorld



=head2 Port HelloWorldSoap



=head1 METHODS

=head2 General methods

=head3 new

Constructor.

All arguments are forwarded to L<SOAP::WSDL::Client|SOAP::WSDL::Client>.

=head2 SOAP Service methods

Method synopsis is displayed with hash refs as parameters.

The commented class names in the method's parameters denote that objects
of the corresponding class can be passed instead of the marked hash ref.

You may pass any combination of objects, hash and list refs to these
methods, as long as you meet the structure.



=head3 sayHello



 $interface->sayHello(  {
    name =>  $some_value, # string
    givenName =>  $some_value, # string
  },,
 );
 


=head1 AUTHOR

Generated by SOAP::WSDL on Sat Dec  1 19:51:31 2007

=pod