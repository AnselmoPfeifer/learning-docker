vcl 4.0;

import directors;

backend tomcat1 {
  .host = "tomcat1";
  .port = "8080";
  .probe = {
                .url = "/";
                .interval = 10s;
                .timeout = 1s;
                .window = 5;
                .threshold = 3;
  }
}

backend tomcat2 {
  .host = "tomcat2";
  .port = "8080";
  .probe = {
                .url = "/";
                .interval = 5s;
                .timeout = 1 s;
                .window = 5;
                .threshold = 3;
  }
}

backend tomcat3 {
  .host = "tomcat3";
  .port = "8080";
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