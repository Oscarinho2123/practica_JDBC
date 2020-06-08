<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.blog"%>
<%@page import="java.util.List"%>
<%
    List<blog> lista = (List<blog>) request.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p align="right">
            <label>Usuario: ${sessionScope.usuario}</label>
            <span>&nbsp;&nbsp;&nbsp;</span>
            <a href="LoginControlador?action=logout">Salir</a>
        </p>

        <h1>
            <center>Blog de salud</center>
        </h1>
        <a href="MainControlador?op=nuevo">Nueva Entrada</a>
        <c:forEach var="item" items="${lista}">
            <p>${item.fecha}</p>
            <b><p>${item.titulo}</p></b>
            <p>${item.contenido}</p>
            <p>Autor: ${item.autor}
                <a href="MainControlador?op=editar&id=${item.id}" style="position:absolute; right: 100px">Editar</a>
                <a href="MainControlador?op=eliminar&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar?'))" style="position:absolute; right: 30px"> Eliminar</a>
            
            </p>
            <hr>
        </c:forEach>
    </body>
</html>
