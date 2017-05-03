<%-- 
    Document   : alta
    Created on : 03-may-2017, 8:58:02
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
  String usuarioAlta = request.getParameter("usuario_alta");
  String passAlta = request.getParameter("pass_alta");
  String nombreAlta = request.getParameter("nombre_alta");
  String apellido1Alta = request.getParameter("apellido1_alta");
  String apellido2Alta = request.getParameter("apellido2_alta");
  String adminAlta = request.getParameter("admin_alta");
  boolean exito = false;
  %>
  <%
  //Comprobación de que el formulario para alta se ha enviado con todos los datos
  if (usuarioAlta != null && passAlta != null && nombreAlta != null && apellido1Alta != null && apellido2Alta != null && adminAlta != null){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "1234");
    Statement s = conexion.createStatement();
    s.execute("INSERT INTO usuarios (usuario, pass, nombre, apellido1, apellido2, administrador) values (\"" + usuarioAlta + "\", \"" + passAlta + "\", \"" + nombreAlta + "\", \"" + apellido1Alta + "\", \"" + apellido2Alta + "\", \"" + adminAlta + "\")");
    exito = true;
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Nuevo usuario</title>
  </head>
  <body>
    <%
      if (exito) {
        out.println("<p>Usuario creado con éxito</p>");
      }
    %>
    <form action="alta.jsp" method="POST">
      <input type="hidden" name="usuario" value="<%= usuario %>"/>
      <input type="hidden" name="contrasena" value="<%= pass %>"/>
      <input type="text" name="usuario_alta" placeholder="Usuario"/>
      <input type="password" name="pass_alta" placeholder="Contraseña"/>
      <input type="text" name="nombre_alta" placeholder="Nombre"/>
      <input type="text" name="apellido1_alta" placeholder="Primer apellido"/>
      <input type="text" name="apellido2_alta" placeholder="Segundo apellido"/>
      <select name="admin_alta" id="admin">
        <option value="1" default>Administrador</option>
        <option value="0">Invitado</option>
      </select>
      <input type="submit" value="Dar de alta"/>
    </form>
    <a href="mostrar_usuarios.jsp?usuario=<%= usuario %>&contrasena=<%= pass %>">Volver a la vista de los usuarios</a>
  </body>
</html>
