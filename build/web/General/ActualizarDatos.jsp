<%@page import="Conexion.BD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyInfo</title>
        <link rel="stylesheet" href="../Css_A/login.css" ><!--  -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Mulish&display=swap');
        </style>
        <link rel="shorcut icon" href="../../Imagenes/logos/logo_AN.png">
    </head>

    <%
        //Datos de formulario de registro
        String docente = request.getParameter("TxtUsuD");
        String correo_docen = request.getParameter("TxtMailD");
        String pass_docen = request.getParameter("TxtPassD");

        //Datos del formulario para crear clase
        String nom_clase = request.getParameter("TxtClase");
        String gradoClase = request.getParameter("SelectGrado");

        if (!docente.equals("") && !correo_docen.equals("") && !pass_docen.equals("")) {
            BD base = new BD();
            try {
                base.conectar();
                String strQry = "insert into Docen(nom_docen, correo_docen, pass_docen)" + "values( '" + docente + "','" + correo_docen + "','" + pass_docen + "' )";
                //out.print(strQry);
                int resultadoInsert = base.insertar(strQry);
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
            response.sendRedirect("Login.jsp");
        }
    %>

    <script src="">

    </script>

    <body>
        <h1> </h1>
    </body>
</html>
