<%-- 
    Document   : confirmacion
    Created on : 07-may-2017, 14:16:29
    Author     : ismael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String usuarioBaja = request.getParameter("usuario_baja");
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("contrasena");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>JSP Page</title>
  </head>
  <body>
    <div class="info">
      <p>¿Está seguro que desea borrar el usuario <%= usuarioBaja %>?</p>
      <form action="borrar.jsp" method="POST">
        <input type="hidden" name="usuario_baja" value="<%= usuarioBaja %>" />
        <input type="hidden" name="usuario" value="<%= usuario %>" />
        <input type="hidden" name="contrasena" value="<%= pass %>" />
        <input type="submit" value="Confirmar" />
      </form>
    </div>
  </body>
</html>
