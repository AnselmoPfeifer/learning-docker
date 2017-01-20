# Exemplo de cluster com armazenamento de sessao em database postgres
1 - Criar banco de dados e tabelas:
    export PGUSER=postgres
    PGUSER=postgres
    export 'PGPASSWORD=postgres'
    PGPASSWORD='postgres'
    
createdb --host localhost --port 5432 --owner postgres session

psql --host localhost --port 5432

CREATE TABLE tomcat_sessions
(
  session_id character varying(100) NOT NULL,
  valid_session character(1) NOT NULL,
  max_inactive integer NOT NULL,
  last_access bigint NOT NULL,
  app_name character varying(255),
  session_data bytea,
  CONSTRAINT tomcat_sessions_pkey PRIMARY KEY (session_id)
);

CREATE INDEX app_name_index
    ON tomcat_sessions
    USING btree
    (app_name);

2 - Adicionar postgresql-9.4.1211.jre6.jar em $CATALINA_HOME/lib
https://jdbc.postgresql.org/download/postgresql-9.4.1211.jre6.jar

3 - Configurar a Session Manager em $CATALINA_HOME/conf/context.conf

<Resource name="jdbc/sessions" auth="Container" type="javax.sql.DataSource"
     username="postgres"
     password="postgres"
     driverClassName="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/sessions"
     maxActive="20"
     maxIdle="10"
     validationQuery="select 1" />
     
<Manager className="org.apache.catalina.session.PersistentManager"
 distributable="true"  processExpiresFrequency="3" maxIdleBackup="1" >
 <Store className="org.apache.catalina.session.JDBCStore"
     dataSourceName="jdbc/sessions"
     sessionAppCol="app_name" sessionDataCol="session_data" sessionIdCol="session_id"
     sessionLastAccessedCol="last_access" sessionMaxInactiveCol="max_inactive"
     sessionTable="tomcat_sessions" sessionValidCol="valid_session" />
</Manager>
