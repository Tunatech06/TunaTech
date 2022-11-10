<%@page import="Conexion.BD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

    int idPersona = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
    if (idPersona < 1) {
        response.sendRedirect("../jsp/Menu.jsp");
    }
    String nombre = "";
    BD basesita = new BD();
    basesita.conectar();
    String datitos = "Select * from Usuario where id_usuario = '" + idPersona + "'";
    ResultSet rsDatosPer = basesita.consulta(datitos);

    if (rsDatosPer.next()) {
        nombre = rsDatosPer.getString(2);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Copernicus System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../Alumno/css_A/menu_A.css" ><!--  -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        </style>
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
    </head>
    <body>
    <center>
        <header>
            <img src="../../General/img/logos/Newlogo.png" alt="logo" class="logo">
            <nav class="nav_A">
                <center>
                    <ul>
                        <a href="#" class="link" ><img src="../../General/img/Iconos_menu/usuario.png" class="imgmenu usu"> Perfil</a>
                        <a href="../../General/Actividades/Lecciones/Nivel2/Lecciones.html" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu"> Lecciones</a>
                         <a href="#" class="link" ><img src="../../General/img/Iconos_menu/comentarios.png" class="imgmenu">Chat</a>
                        <a href="#" class="link" ><img src="../../General/img/Iconos_menu/libros_1.png" class="imgmenu"> Ejercicios</a>
                        <a href="#" class="link" ><img src="../../General/img/Iconos_menu/mapaStar.png" class="imgmenu">Mapa</a>
                        <a href="../../General/cerrarSesion.jsp" class="link" ><img src="../../General/img/Iconos_menu/salir.png" class="imgmenu"> Cerrar sesión</a>
                    </ul>
                </center>
            </nav>
        </header>
    </center>

    <div class="tierra">
        <iframe src='https://my.spline.design/tierra-8cfeeeb49ed78ab4d314507d78c7754c/' frameborder='0' width='100%' height='730vh'></iframe>
    </div>
    <div class="Principal" id="Principal">
        <h1>Bienvenido  <%=nombre%> </h1>
    </div>
</body>
</html>

