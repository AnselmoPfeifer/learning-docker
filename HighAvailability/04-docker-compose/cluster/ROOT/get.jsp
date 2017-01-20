<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.net.InetAddress" %>
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
<div class="row">
    <div class="card-panel teal lighten-2 center teal-text text-lighten-5 top">
        <a href="get.jsp">
            <i class="large material-icons">replay_5</i>
        </a>
        <a href="/">
            <i class="large material-icons">skip_next</i>
        </a>
    </div>
</div>
<div class="row">
    <table class="bordered striped highlight">
        <tbody>
        <tr>
            <td>Load Balancer: </td>
            <td><%= request.getRemoteAddr()  %>:<%= request.getServerPort()  %></td>
        </tr>

        <tr>
            <td>Container:</td>
            <td><%= request.getLocalName()  %> / <%= request.getLocalAddr()  %></td>
        </tr>
        <tr>
            <td>Received Attribute:</td>
            <td><%= session.getAttribute("sessionAtribute") %></td>
        </tr>
        <tr>
            <td>Session ID:</td>
            <td><%= request.getSession().getId() %></td>
        </tr>
        <tr>
            <td>Session Creation Date:</td>
            <td><%=new Date(request.getSession().getCreationTime())%></td>
        </tr>
        <tr>
            <td>Session Access Date:</td>
            <td><%=new Date(request.getSession().getLastAccessedTime())%></td>
        </tr>
        <tr>
            <td>Is it New Session:</td>
            <td><%=request.getSession().isNew() %></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>