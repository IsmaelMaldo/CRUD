<%-- 
    Document   : modificar1
    Created on : 03-may-2017, 10:44:12
    Author     : ismael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  request.setCharacterEncoding("UTF-8");
  String usuarioMod = request.getParameter("usuario_mod");
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("contrasena");
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "1234");
  Statement s = conexion.createStatement();
  ResultSet consulta = s.executeQuery("SELECT * FROM usuarios WHERE usuario = \"" + usuarioMod + "\"");
  while (consulta.next()){
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Modificar Usuario</title>
  </head>
  <body>
    <form action="modificar2.jsp" method="POST">
      <input type="hidden" name="usuario" value="<%= usuario %>"/>
      <input type="hidden" name="contrasena" value="<%= pass %>"/>
      <input type="hidden" name="usuario_mod" value="<%= consulta.getString("usuario") %>"/>
      <div>
        <label from="usuario">Usuario</label>
        <input id="usuario" type="text" value="<%= consulta.getString("usuario") %>" disabled />
      </div>
      <div>
        <label from="pass">Contraseña</label>
        <input id="pass" type="password" name="pass_mod" value="<%= consulta.getString("pass") %>" />
      </div>
      <div>
        <label from="nombre">Nombre</label>
        <input id="nombre" type="text" name="nombre_mod" value="<%= consulta.getString("nombre") %>" />
      </div>
      <div>
        <label from="apellido1">Primer apellido</label>
        <input id="apellido1" type="text" name="apellido1_mod" value="<%= consulta.getString("apellido1") %>" />
      </div>
      <div>
        <label from="apellido2">Segundo apellido</label>
        <input id="apellido2" type="text" name="apellido2_mod" value="<%= consulta.getString("apellido2") %>" />
      </div>
      <div>
        <label from="admin">Rol</label>
        <%
          if (consulta.getString("administrador").equals("1")){
        %>
        <select id="admin"  name="admin_mod">
          <option value="1" selected>Administrador</option>
          <option value="0">Invitado</option>
        </select>
        <%
          } else {
        %>
        <select name="admin_mod">
          <option value="1">Administrador</option>
          <option value="0" selected>Invitado</option>
        </select>
        <label from="avatar">Avatar</label>
        <%
        }
          if (consulta.getString("avatar").equals("0.png")){
            %>
            <select name="avatar_mod" id="avatar">
              <option value="0.png" selected>Avatar por defecto</option>
              <option value="1.png">Nishikino Maki</option>
              <option value="2.png">Koizumi Hanayo</option>
              <option value="3.png">Hozhizora Rin</option>
              <option value="4.png">Eli Ayase</option>
            </select>
            <%
          } else if(consulta.getString("avatar").equals("1.png")){
            %>
            <select name="avatar_mod">
              <option value="0.png">Avatar por defecto</option>
              <option value="1.png" selected>Nishikino Maki</option>
              <option value="2.png">Koizumi Hanayo</option>
              <option value="3.png">Hozhizora Rin</option>
              <option value="4.png">Eli Ayase</option>
            </select>
            <%
          } else if(consulta.getString("avatar").equals("2.png")){
            %>
            <select name="avatar_mod">
              <option value="0.png">Avatar por defecto</option>
              <option value="1.png">Nishikino Maki</option>
              <option value="2.png"selected>Koizumi Hanayo</option>
              <option value="3.png">Hozhizora Rin</option>
              <option value="4.png">Eli Ayase</option>
            </select>
            <%
          } else if(consulta.getString("avatar").equals("3.png")){
            %>
            <select name="avatar_mod">
              <option value="0.png">Avatar por defecto</option>
              <option value="1.png">Nishikino Maki</option>
              <option value="2.png">Koizumi Hanayo</option>
              <option value="3.png" selected>Hozhizora Rin</option>
              <option value="4.png">Eli Ayase</option>
            </select>
            <%
          } else if(consulta.getString("avatar").equals("4.png")){
            %>
            <select name="avatar_mod">
              <option value="0.png">Avatar por defecto</option>
              <option value="1.png">Nishikino Maki</option>
              <option value="2.png">Koizumi Hanayo</option>
              <option value="3.png">Hozhizora Rin</option>
              <option value="4.png" selected>Eli Ayase</option>
            </select>
            <%
          }
    }
        %>
      </div>
      <input type="submit" value="Modificar"/>
    </form>
  </body>
</html>
