<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <%      
        //Datos del formulario para crear clase
        String nom_clase = request.getParameter("TxtClase");
        String gradoClase = request.getParameter("SelectGrado");

        if (!nom_clase.equals("") && !gradoClase.equals("")) {
            BD clasesita = new BD();
            try {
                    clasesita.conectar();
                    String infoClass = "insert into Clases(nom_clase, grado)" + "values( '" + nom_clase + "','" + gradoClase + "' )";
                    //out.print(strQry);
                    int resultadoInsert = clasesita.insertar(infoClass);
                } catch (Exception ex) {
                    out.print(ex.getMessage());
                }
                //response.sendRedirect("Clasesita.jsp"); 
                response.sendRedirect("../html_D/CrearClaseForm.html"); 
        }
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
