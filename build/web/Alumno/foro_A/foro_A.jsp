<%-- 
    Document   : foro
    Created on : 9 nov. 2022, 19:41:29
    Author     : kim53
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

    int idPersona = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
    if (idPersona < 1) {
        response.sendRedirect("../jsp/Menu.jsp");
    }
    String nombre = "";
    String correo = "";
    String foto = "";
    String tipo = "";

    BD basesita = new BD();
    basesita.conectar();
    String datitos = "Select * from Estudiante where id_usuario = '" + idPersona + "'";
    ResultSet rsDatosPer = basesita.consulta(datitos);

    if (rsDatosPer.next()) {
        nombre = rsDatosPer.getString(2);
        correo = rsDatosPer.getString(3);
        foto = rsDatosPer.getString(5);
        tipo = rsDatosPer.getString(6);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foro</title>
        <link rel="stylesheet" href="../css_A/menu_A.css" >
        <link rel="stylesheet" href="../../General/css/foro_estilitos.css" >
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        </style>
    </head>
    <body id="foro1">
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
                                <li><a href="../jsp_A/Menu_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/home.png" class="imgmenu">   Inicio</a></li> 
                                <li><a href="../jsp_A/Perfil_A.jsp" class="link" ><img src="../../General/img/Iconos_menu/usuario.png" class="imgmenu usu">Perfil</a></li> <br>
                                <li><a href="../../General/cerrarSesion.jsp" class="link" ><img src="../../General/img/Iconos_menu/salir.png" class="imgmenu"> Cerrar sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </center>
            </nav>
        </header>
    </center>

    <div class="contenedor-imagen">
        <iframe src='https://my.spline.design/tierracopy-ea1e961ca616e388da500eb45a986bfb/' frameborder='0' width='100%' height='1500'></iframe>
    </div>

    <main id="blog">

        <div class="contenedor">
            <aside>
                <iframe id="FRAME" src="crearPost.jsp" width="420" height="420" style="border:none; z-index: 100; " scrolling="no" ></iframe>
            </aside>

            <div class="contenido">

                <div class="post">
                    <div class="infoPost">
                        <%
                            if (rsDatosPer.getString(5) == null) {
                        %>
                        <div class="headerPost">
                            <table>
                                <tr>
                                    <td><img src="../../General/img/fotoUsu_0.png" width=30" height="20" alt="foto 0" class="imagenUsuCero"/></td>
                                    <td>
                                        <h1 class="titulo"><%=nombre%></h1>
                                        <p> <h3><%=tipo%></h3></p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="headerPost">
                            <h3><%=tipo%></h3>
                        </div>

                        <%
                        } else {

                        %>
                        <div class="headerPost">
                            <table>
                                <tr>
                                    <td><img class="imagenUsuCero" src="../../General/Usu_img/fotosPerfil/<%=foto%>" width=130" height="130"></td>
                                    <td><h1 class="titulo"><%=nombre%></h1></td>
                                </tr>
                            </table>
                        </div>
                        <div class="headerPost">
                            <h3><%=tipo%></h3>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="textoPost">
                        <p>
                            Hola mundo
                        </p>
                    </div>

                    <form name="form" action="ValidarUsu.jsp" method="post" > 
                        <p><input class="postInput" type="text" id="TxtComent" name="comentario" placeholder="Escribe un comentario">
                            <input class="enviarComent" type="submit" id="btnLogin" name="btnLogin" value="Comentar">
                        </p>
                    </form>
                </div>
                <div class="post">
                    <h1 class="titulo">Artículo #2</h1>
                    <p class="fecha">Publicado el 4 de Marzo de 2021</p>
                    <p>
                        Ut sit amet vehicula lectus, nec vestibulum purus. Nulla a nibh magna. Pellentesque commodo commodo sapien eu sagittis. Aenean luctus mauris sit amet quam ornare, eu ultricies nunc auctor. Nulla volutpat purus eu venenatis facilisis. Nulla risus nisl, rhoncus vitae pulvinar nec, viverra eu odio. Duis nisi quam, gravida sed imperdiet sed, viverra fermentum turpis. Cras non iaculis augue, nec scelerisque nibh. Sed auctor dolor mi, sit amet placerat tellus sagittis eu. Curabitur nec luctus dolor. Ut congue rutrum vehicula. Ut viverra tincidunt nunc, vitae cursus nulla scelerisque aliquam.
                    </p>
                </div>
                <div class="post">
                    <h1 class="titulo">Artículo #3</h1>
                    <p class="fecha">Publicado el 4 de Marzo de 2021</p>
                    <p>
                        Aliquam congue nibh in urna porta blandit. Mauris nec mi elit. Duis ligula quam, suscipit nec hendrerit ac, efficitur pulvinar tortor. Quisque venenatis leo ac hendrerit molestie. Quisque malesuada, enim ut feugiat finibus, sem mi faucibus enim, vel rhoncus ante justo in nibh. Duis sit amet ipsum tempus, pellentesque ex sed, mollis erat. Sed metus nibh, tincidunt vel laoreet eget, bibendum at est.
                    </p>
                </div>
                <div class="post">
                    <h1 class="titulo">Artículo #4</h1>
                    <p class="fecha">Publicado el 4 de Marzo de 2021</p>
                    <p>
                        Nullam ullamcorper tincidunt laoreet. Donec sapien sapien, egestas id justo et, tincidunt accumsan ipsum. Etiam molestie lectus a consectetur condimentum. Donec malesuada at sapien eu viverra. Integer rutrum libero vitae est semper malesuada. Quisque convallis enim et erat aliquam, a facilisis nunc posuere. Nulla ultrices, turpis in pulvinar feugiat, dolor enim interdum mauris, vitae egestas purus orci vel nibh. Aliquam eleifend est ac eleifend dictum. Nunc condimentum tincidunt placerat. Praesent varius ornare quam vitae placerat. Donec justo sapien, pretium vitae vestibulum at, molestie eu ipsum. Proin non turpis eget risus egestas ornare in nec tortor. Sed commodo lectus vitae tortor blandit, id auctor mauris tempus. Aliquam erat volutpat.
                    </p>
                </div>		
            </div>
        </div>
    </main>

    <footer>
        <div class="contenedor-imagen">

        </div>
    </footer>

</body>
</html>
