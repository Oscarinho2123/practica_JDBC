<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style type="text/css">
        body {text-align: center}
    </style>
    <body>
    <center>
        <table >
            <thead>
                <tr>
                    <th>LOGIN</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    
                </tr>
                <tr>
                    <td>
                        <form action ="LoginControlador" method="post">
                            <label>Usuario: </label>
                            <input type="text" name="usuario" autocomplete="off">
                            <br><br>
                            <label>Clave: </label>
                            <input type="password" name="password">
                            <br><br>
                            <input type="submit" value="Ingresar">
                            
                           
                        </form>
                    </td>
            </tbody>
        </table>
    </center>
    </body>
</html>
