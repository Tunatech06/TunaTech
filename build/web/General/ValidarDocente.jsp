<%@page import="Conexion.Digest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<%
    String docente = request.getParameter("email");
    String pass_docen = request.getParameter("password");
    String pswd = Digest.bytesToHex(Digest.createSha1(pass_docen));

    if (docente == null) {
        docente = "0";
    } else {
        if (docente.equals("")) {
            docente = "0";
        }
    }
    if (pass_docen == null) {
        pass_docen = "0";
    } else {
        if (pass_docen.equals("")) {
            pass_docen = "0";
        }
    }
    if (!docente.equals("0") && !pass_docen.equals("0")) {
        BD bd = new BD();
        bd.conectar();
        int num = 0;
        String strQry = "Select * from Docente where correo_docen='" + docente + "'and pass_docen = '" + pswd + "'";

        ResultSet DatosUsu = bd.consulta(strQry);
        if (DatosUsu.next()) {
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int idDocen = DatosUsu.getInt("id_docen");
            String nombreDocen = DatosUsu.getString("nom_docen");
            miSessiondelUsuario.setAttribute("id_docen", idDocen);
            miSessiondelUsuario.setAttribute("Nombre del docente: ", nombreDocen);
            
            response.sendRedirect("../Docente/jsp_D/Menu_D.jsp");
        } else {

        }
    } else {
        response.sendRedirect("Registro.html");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario desconocido</title>
        <link rel="stylesheet" href="css/registro.css" >
    </head>
    <body>
        <div class="div2">
            <center>
                <h1>Este usuario no existe</h1>
                <h3><a href="Login.jsp">Regresar al inicio de sesión</a></h3>
            </center>
        </div>
    </body>
    <footer>
        <div class="footer1">
            <p>
                Copernicus System
            </p>
        </div>
        <div class="footer2">
            <p>Equipo 6 Tuna tech</p>
            <p>Integrantes</p>
            <p>Aguilera García Christopher Emmanuel
            <p>Cisneros Mendoza Gerardo Uriel</p>
            <p>García López Arturo</p>
            <p> Reyes Barquera Yazmin</p>

        </div>
    </footer>
</html>