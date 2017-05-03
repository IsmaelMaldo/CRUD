<%-- 
    Document   : borrar
    Created on : 03-may-2017, 10:02:59
    Author     : ismael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  request.setCharacterEncoding("UTF-8");
  String usuarioBaja = request.getParameter("usuario_baja");
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("contrasena");
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "1234");
  Statement s = conexion.createStatement();
  s.execute("DELETE FROM usuarios WHERE usuario = \"" + usuarioBaja + "\"");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <meta http-equiv="refresh" content="3;URL=mostrar_usuarios.jsp?usuario=<%= usuario %>&contrasena=<%= pass %>">
    <title>Borrar usuario</title>
  </head>
  <body>
    <div class="info">
      <p>El usuario <%= usuarioBaja %> ha sido borrado.</p>
      <p>Redirigiendo a la página principal</p>
    </div>
  </body>
</html>
