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

        String datitos = "Select * from Estudiante where id_usuario = '" + idPersona + "'";
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
                        <li> <a href="Clase_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/clases.png" class="imgmenu"> Clase</a></li>
                        <li><a href="../../General/Actividades/Lecciones/Nivel2/Lecciones.html" class="link" ><img src="../../General/img/Iconos_menu/lecciones.png" class="imgmenu"> Lecciones <img src="../../General/img/Iconos_menu/desplegar.png" class="imgmenu usu"></a>
                            <ul>
                                <li><a href="../../General/Actividades/Temario.jsp" class="link" ><img src="../../General/img/Iconos_menu/temario.png" class="imgmenu">Temario</a> </li>
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu"> Nivel Básico</a></li> 
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu usu">Nivel Intermedio</a></li> <br>
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu">Nivel Avanzado</a></li>
                                <li><a href="MaterialApoyoA.jsp" class="link" ><img src="../../General/img/Iconos_menu/libros_1.png" class="imgmenu">Material de apoyo</a></li>
                            </ul>
                        </li>
                        <li><a href="../foro_A/foro_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/comentarios.png" class="imgmenu">Foro</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/ejercicios.png" class="imgmenu"> Ejercicios</a></li>
                        <li><a href="#" class="link" > <img src="../../General/img/Iconos_menu/puntuaciones.png" class="imgmenu"> Puntuaciones</a></li>
                        <li><a href="Mapa.jsp" class="link" ><img src="../../General/img/Iconos_menu/coheteM.png" class="imgmenu">Mapa</a></li> 
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

            <p><a href="EditaDatos_A.jsp" class="editarBtn">Editar datos</a></p>


        </div>


        <div id="cuadro3">
            <table class="tablita2">
                <tr>
                    <td>Nombre de usuario: </td><td><%=nombre%></td>
                </tr>
                <tr>
                    <td>Correo electrónico: </td><td><%=correo%></td>
                </tr>
                <tr>
                    <td>Tipo de usuario</td><td><%=tipo%></td>
                </tr>
                <tr><br>
                <td><a  class="link_borrar" href="editar/eliminarConfirm.jsp">Borrar cuenta</a></td>
                <td></td>
                </tr>
            </table>

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
