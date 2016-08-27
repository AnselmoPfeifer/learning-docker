<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href=<c:url value="resources/css/materialize.min.css"/> rel="stylesheet">
    <link href=<c:url value="resources/css/style.css"/> rel="stylesheet">
    <link href=<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons" /> rel="stylesheet">


    <title>Cluster test</title>
</head>
<body class="container">
    <div class="card-panel teal lighten-2 center teal-text text-lighten-5">
            <a href="index.jsp">
                <i class="large material-icons">skip_previous</i>
            </a>
            <a href="get.jsp">
                <i class="large material-icons">replay_5</i>
            </a>

            <h4>
                Received Attribute:: <h5 class="red-text text-accent-4"> <%= session.getAttribute("sessionAtribute") %></h5>
             </h4>
            <h4>
                Session ID: <h5 class="red-text text-accent-4"><%= request.getSession().getId() %></h5>
            </h4>
    </div>

</body>
</html>