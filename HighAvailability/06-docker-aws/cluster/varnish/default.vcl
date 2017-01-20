vcl 4.0;

import directors;

backend tomcat1 {
  .host = "52.67.39.69";
  .port = "8081";
  .probe = {
                .url = "/";
                .interval = 5s;
                .timeout = 1 s;
                .window = 5;
                .threshold = 3;
  }
}

backend tomcat2 {
  .host = "127.0.0.1";
  .port = "8082";
  .probe = {
                .url = "/";
                .interval = 5s;
                .timeout = 1 s;
                .window = 5;
                .threshold = 3;
  }
}

backend tomcat3 {
  .host = "127.0.0.1";
  .port = "8083";
  .probe = {
                .url = "/";
                .interval = 5s;
                .timeout = 1 s;
                .window = 5;
                .threshold = 3;
  }
}
sub vcl_init {
    new bar = directors.round_robin();
    bar.add_backend(tomcat1);
    bar.add_backend(tomcat2);
    bar.add_backend(tomcat3);
}

sub vcl_recv {
    set req.backend_hint = bar.backend();
}