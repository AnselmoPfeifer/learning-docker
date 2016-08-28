# See the VCL chapters in the Users Guide at
# https://www.varnish-cache.org/docs/
# http://varnish-cache.org/trac/wiki/VCLExamples

vcl 4.0;

backend default {
    .host = "loadbalancer";
    .port = "3000";
    .connect_timeout = 16s;
    .first_byte_timeout = 96s;
    .between_bytes_timeout = 8s;
}

sub vcl_recv {

}

sub vcl_backend_response {

}

sub vcl_deliver {

}
