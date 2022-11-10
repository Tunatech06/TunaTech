<%@page import="Conexion.BD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

    int idPersona = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
    if (idPersona < 1) {
        response.sendRedirect("../jsp/Menu.jsp");
    }
    try {
        String nombre = "";
        String correo = "";
        String grado = "";
        String tipo = "";
        String foto = "";

        BD basesita = new BD();
        basesita.conectar();

        String datitos = "Select * from Usuario where id_usuario = '" + idPersona + "'";
        String info2 = "Select * from imgUsu where id_usuario = '" + idPersona + "'";
        ResultSet rsDatosPer = basesita.consulta(datitos);

        while (rsDatosPer.next()) {
            nombre = rsDatosPer.getString(2);
            correo = rsDatosPer.getString(3);
            tipo = rsDatosPer.getString(6);
            grado = rsDatosPer.getString(7);
            foto = rsDatosPer.getString(5);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu cuenta</title>
        <link rel="stylesheet" href="../css_A/perfil.css" >
        <link rel="stylesheet" href="../css_A/menu_A.css" >
        <style>@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');</style>
        <style>@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');</style>
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
    </head>
    <body id="principal">
    <center>
        <header>
            <a href="Menu_A.jsp" ><img src="../../General/img/logos/Newlogo.png" alt="logo" class="logo"></a>
            <nav class="nav_A">
                <center>
                    <ul>
                        <li> <a href="#" class="link" ><img src="../../General/img/Iconos_menu/clases.png" class="imgmenu"> Clase</a></li>
                        <li><a href="../../General/Actividades/Lecciones/Nivel2/Lecciones.html" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu"> Lecciones</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/comentarios.png" class="imgmenu">Chat</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/libros_1.png" class="imgmenu"> Ejercicios</a></li>
                        <li><a href="#" class="link" > <img src="../../General/img/Iconos_menu/puntuaciones.png" class="imgmenu"> Puntuaciones</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/mapaStar.png" class="imgmenu">Mapa</a></li> 
                        <li class="opciones"><a class="link" ><img src="../../General/img/Iconos_menu/desplegar.png" class="imgmenu usu"></a>
                            <ul>
                                <li class="link"><img src="../../General/img/Iconos_menu/correo.png" class="imgmenu"><%=correo%></li>
                                <li><a href="Menu_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/home.png" class="imgmenu">   Inicio</a></li> 
                                <li><a href="Perfil_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/usuario.png" class="imgmenu usu">Perfil</a></li> <br>
                                <li><a href="../../General/cerrarSesion.jsp" class="link" ><img src="../../General/img/Iconos_menu/salir.png" class="imgmenu"> Cerrar sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </center>
            </nav>
        </header>
    </center>

    <nav class="menu_perfil">

    </nav>
    <div class="dos">
        <div id="cuadro1">
            <br>
            <p><h1>Tu cuenta</h1></p>
            <p>  <%=nombre%></p>
            <img src="../../General/img/fulano1.png" alt="imagenFulano" class="imgPerfil">
        </div>

        <div id="cuadro2">
            <p>Foto de perfil</p>
            <%
                if (rsDatosPer.getString(5) == null) {
            %>
            <img src="../../General/img/fotoUsu_0.png" width=130" height="120" alt="foto 0" class="imagenUsuCero"/>

            <%
            } else {

            %>
            <img class="imagenUsuCero" src="../../General/Usu_img/fotosPerfil/<%=foto%>" width=130" height="130">

            <%
                }
            %>

            <p><a href="Editar_datos_A.jsp" class="editarBtn">Agregar foto de perfil</a></p>

        </div>


        <div id="cuadro3">
            <p>Nombre: <%=nombre%></p>
            <p>Correo electrónico: <%=correo%></p>
            <p>Tipo de usuario:  <%=tipo%></p>


        </div>

    </div>


    <%            }
            rsDatosPer.close();
            basesita.cierraConexion();

        } catch (Exception ex) {
            out.print(ex.getMessage());
        }
        //}


    %>
</body>
</html>
