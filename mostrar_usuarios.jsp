<%-- 
    Document   : mostrar_usuarios
    Created on : 02-may-2017, 9:24:57
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
  boolean admin = false;
  String nombre = "";
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Contentrow count-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Principal</title>
  </head>
  
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "1234");
      Statement s = conexion.createStatement();

      //Verificamos que el usuario y la contraseña son correctos
      ResultSet consulta = s.executeQuery("SELECT COUNT(*) FROM usuarios WHERE usuario = \"" + usuario + "\" AND pass = \"" + pass + "\"");
      consulta.next();
      if (consulta.getInt(1) != 0){
        
        consulta = s.executeQuery("SELECT * FROM usuarios WHERE usuario = \"" + usuario + "\" AND pass = \"" + pass + "\"");
        while (consulta.next()){
          nombre = consulta.getString("nombre");
          if (consulta.getString("administrador").equals("1")){
            admin = true;
          } else {
            admin = false;
          }
        }
        %>
        <h1>Usuarios del foro</h1>
        <%
        //Si el usuario es Administrador
        if (admin){
          %>
          <a href="alta.jsp?usuario=<%= usuario %>&contrasena=<%= pass %>">✚ Nuevo usuario</a>
          <div class="tabla">
            <table>
              <tr>
                <th>
                  Avatar
                </th>
                <th>
                  Usuario
                </th>
                <th>
                  Nombre
                </th>
                <th>
                  Primer apellido
                </th>
                <th>
                  Segundo apellido
                </th>
                <th>
                  Administrador
                </th>
                <th>
                  Fecha de alta
                </th>
                <th>
                  Acciones
                </th>
              </tr>
              <%
                consulta = s.executeQuery("SELECT * FROM usuarios");
                while (consulta.next()){
                  %>
                  <tr>
                    <td>
                      <img class="avatar" src="<%= consulta.getString("avatar") %>" />                      
                    </td>
                    <td>
                      <%= consulta.getString("usuario")%>
                    </td>
                    <td>
                    <%= consulta.getString("nombre")%>
                    </td>
                    <td>
                    <%= consulta.getString("apellido1")%>
                    </td>
                    <td>
                    <%= consulta.getString("apellido2")%>
                    </td>
                    <td>
                    <%
                      if (consulta.getString("administrador").equals("1")){
                        out.println("Sí");
                      } else {
                        out.println("No");
                      }
                    %>
                    </td>
                    <td>
                    <%= consulta.getString("fecha_alta")%>
                    </td>
                    <td>
                      <a href="confirmacion.jsp?usuario_baja=<%= consulta.getString("usuario") %>&usuario=<%= usuario %>&contrasena=<%= pass %>"><img src="papelera.svg" />Borrar</a>
                      <a href="modificar1.jsp?usuario_mod=<%= consulta.getString("usuario") %>&usuario=<%= usuario %>&contrasena=<%= pass %>"><img src="lapiz.svg" />Modificar</a>
                    </td>
                  </tr>
                  <%
                }
              %>
            </table>
          </div>
          <%
        //Si el usuario no es administrador
        } else {
          %>
          <div class="tabla">
            <table>
              <tr>
                <th>
                  Usuario
                </th>
                <th>
                  Nombre
                </th>
                <th>
                  Primer apellido
                </th>
                <th>
                  Segundo apellido
                </th>
                <th>
                  Administrador
                </th>
                <th>
                  Fecha de alta
                </th>
              </tr>
              <%
                consulta = s.executeQuery("SELECT * FROM usuarios");
                while (consulta.next()){
                  %>
                  <tr>
                    <td>
                      <%= consulta.getString("usuario")%>
                    </td>
                    <td>
                    <%= consulta.getString("nombre")%>
                    </td>
                    <td>
                    <%= consulta.getString("apellido1")%>
                    </td>
                    <td>
                    <%= consulta.getString("apellido2")%>
                    </td>
                    <td>
                    <%
                      if (consulta.getString("administrador").equals("1")){
                        out.println("Sí");
                      } else {
                        out.println("No");
                      }
                    %>
                    </td>
                    <td>
                    <%= consulta.getString("fecha_alta")%>
                    </td>
                  </tr>
                  <%
                }
              %>
            </table>
          </div>
          <%
        }
        
      } else {
    %>
    <body class="login">
      <form action="mostrar_usuarios.jsp" method="POST">
        <p>Contraseña o usuario incorrectos, por favor, inténtelo de nuevo</p>
        <input type="text" name="usuario" placeholder="Usuario" id="Usuario" />
        <input type="password" name="contrasena" placeholder="Contraseña" id="Contraseña" />
        <input type="submit" value="Entrar" />
    </form>
    </body>
    <% 
      }
    %>
</html>
