<%
    if (session.getAttribute("logueado") != "OK"){
        response.sendRedirect("login.jsp");
    }
%>
<%@page import="com.emergentes.modelo.blog"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    blog post = (blog) request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align = "center">
            <c:if test="${post.id == 0}">Nueva Entrada</c:if>
            <c:if test="${post.id != 0}">Editar Blog</c:if>
        </h1>
            <form action="MainControlador" method="post">
            <table>
                <input type="hidden" name="id" value="${post.id}">
                <tr>
                    <td>Fecha: </td>
                    <td><input type="date" name="fecha" value="${post.fecha}"></td>
                </tr>
                <tr>
                    <td>Titulo: </td>
                    <td><input type="text" name="titulo" autocomplete="off" value="${post.titulo}"></td>
                </tr>
                <tr>
                    <td>Contenido: </td>
                    <td><textarea name="contenido" rows="10" cols="50" placeholder="${post.contenido}"></textarea></td>
                </tr>
                <tr>
                    <td>Autor: </td>
                    <td><input type="text" name="autor" autocomplete="off" value="${post.autor}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>            
        </form>
    </body>
</html>
