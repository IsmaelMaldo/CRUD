<%-- 
    Document   : modificar2
    Created on : 03-may-2017, 11:40:45
    Author     : ismael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  request.setCharacterEncoding("UTF-8");
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("contrasena");
  String usuarioMod = request.getParameter("usuario_mod");
  String passMod = request.getParameter("pass_mod");
  String nombreMod = request.getParameter("nombre_mod");
  String apellido1Mod = request.getParameter("apellido1_mod");
  String apellido2Mod = request.getParameter("apellido2_mod");
  String adminMod = request.getParameter("admin_mod");
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "1234");
  Statement s = conexion.createStatement();
  s.execute("UPDATE usuarios SET pass=\"" + passMod + "\", nombre=\"" + nombreMod + "\", apellido1=\"" + apellido1Mod + "\", apellido2=\"" + apellido2Mod + "\", administrador=\"" + adminMod + "\" WHERE usuario=\"" + usuarioMod + "\"");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="refresh" content="3;URL=mostrar_usuarios.jsp?usuario=<%= usuario %>&contrasena=<%= pass %>"> 
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Usuario modificado</title>
  </head>
  <body>
    <div class="info">
      <p>El usuario ha sido modificado</p>
      <p>Redirigiendo a la página principal</p>
    </div>
  </body>
</html>
