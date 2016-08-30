# See the VCL chapters in the Users Guide at
# https://www.varnish-cache.org/docs/
# http://varnish-cache.org/trac/wiki/VCLExamples

vcl 4.0;

backend tomcat1 {
    .host = "tomcat1";
    .port = "8080";
    .connect_timeout = 16s;
    .first_byte_timeout = 96s;
    .between_bytes_timeout = 8s;
}

# define our second nginx server
backend tomcat2 {
    .host = "tomcat2";
    .port = "8080";
    .connect_timeout = 16s;
    .first_byte_timeout = 96s;
    .between_bytes_timeout = 8s;
}

backend tomcat3 {
    .host = "tomcat3";
    .port = "8080";
    .connect_timeout = 16s;
    .first_byte_timeout = 96s;
    .between_bytes_timeout = 8s;
}

# configure the load balancer
director nginx round-robin {
    { .backend = tomcat1; }
    { .backend = tomcat2; }
    { .backend = tomcat3; }
}

# When a request is made set the backend to the round-robin director named tomcat1
sub vcl_recv {
    set req.backend = tomcat1;
}

sub vcl_recv {

}

sub vcl_backend_response {

}

sub vcl_deliver {

}