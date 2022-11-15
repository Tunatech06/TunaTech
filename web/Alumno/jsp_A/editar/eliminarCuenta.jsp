<%-- 
    Document   : eliminarCuenta
    Created on : 13 nov. 2022, 11:29:52
    Author     : kim53
--%>

<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id_usu = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
            BD bd = new BD();
            try {
                bd.conectar();
                String strQryPer = "delete from Estudiante where id_usuario = '" + id_usu + "'";
                int resultadoBorra = bd.borrar(strQryPer);

                response.sendRedirect("../../../General/Login.jsp");
            } catch (Exception XD) {
            }
        %>
    </body>
</html>
