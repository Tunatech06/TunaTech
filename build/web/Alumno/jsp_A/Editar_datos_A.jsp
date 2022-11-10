<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

    int id = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
    BD base = new BD();

    try {
        String nombre = "";
        String correo = "";
        String grado = "";
        String tipo = "";
        String foto = "";
        String pass = "";

        base.conectar();
        String strQry = "select * from Usuario where id_usuario='" + id + "'";

        ResultSet info = base.consulta(strQry);

        while (info.next()) {
            nombre = info.getString(2);
            correo = info.getString(3);
            tipo = info.getString(6);
            grado = info.getString(7);
            foto = info.getString(5);
            pass = info.getString(4);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar perfil</title>
        <link rel="stylesheet" href="../css_A/perfil.css" >
        <link rel="stylesheet" href="../css_A/menu_A.css" >
        <style>@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');</style>
        <style>@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');</style>
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
    </head>
    <body id="p2">
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



    <form name="datosEdit" action="../../General/Usu_img/guardar_img.jsp" method="post" enctype="MULTIPART/FORM-DATA">
        <nav class="menu">
            <p><h1>Foto de perfil</h1></p>
            <%
                if (info.getString(5) == null) {
            %>
            <img src="../../General/img/fotoUsu_0blanco.png" width=130" height="120" alt="foto 0" class="imagenUsuCero blanco"/>

            <%
            } else {

            %>
            <img class="imagenUsuCero" src="../../General/Usu_img/fotosPerfil/<%=foto%>" width=135" height="135">

            <%                }
            %>
            <input id="fileImg" type="file" name="fileImg"  class="fileImg" >
        </nav>
        <div class="formulario">
            <div id="cuadro4">
                <table class="tablita" border="0">
                    <h1>Editar datos</h1>
                    <tr>
                        <td>Nombre de usuario</td><td><input id="txtN" type="text" name="txtN"  class="actu" value="<%=nombre%>" ></td>
                    </tr>
                    <tr>
                        <td>Correo electrónico: </td><td><input id="TxtCorreo" type="text" name="TxtCorreo"  class="actu" value="<%=correo%>" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>Contraseña </td><td><input id="TxtPass" type="text" name="TxtPass"  class="actu" value="<%= info.getString(4)%>" readonly="readonly"></td>
                        <td>Nueva contraseña: </td><td><input id="txtPass2" type="password" name="txtPass2"  class="actu" value="" ></td>
                    </tr>
                    <tr>
                        <td>Grado de estudiante</td><td><input id="TxtCorreo" type="text" name="TxtCorreo"  class="actu" value="<%=grado%>" readonly="readonly"></td>
                    </tr>
                    <tr>
                    <center><td colspan='4'><input id="BtnEditar" name="BtnEditar" type="submit"  class="actu_b" value="Actualizar datos"/></td></center>
                    </tr>
                    <br><br> <br>
                    <tr>
                        <td><a  class="link_borrar" href="../jsp/eliminar_alumno.jsp">Borrar cuenta</a> </td>
                    </tr>
                </table>

            </div>
        </div>

        <%            }
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        %>
    </form>
</body>
</html>
