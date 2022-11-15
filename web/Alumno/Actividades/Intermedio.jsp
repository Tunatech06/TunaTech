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
    BD basesita = new BD();
    basesita.conectar();
    String datitos = "Select * from Usuario where id_usuario = '" + idPersona + "'";
    ResultSet rsDatosPer = basesita.consulta(datitos);

    if (rsDatosPer.next()) {
        nombre = rsDatosPer.getString(2);
        correo = rsDatosPer.getString(3);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nivel Intermedio</title>
        <link rel="stylesheet" href="../../Alumno/css_A/menu_A.css" >
        <link rel="stylesheet" href="estilos.css" >
        <link rel="shorcut icon" href="../../../General/img/logos/Newlogo.png">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        </style>
    </head>
    <body>
    <center>
        <header>
            <a href="Menu_A.jsp" ><img src="../../General/img/logos/Newlogo.png" alt="logo" class="logo"></a>
            <nav class="nav_A">
                <center>
                    <ul>
                        <li> <a href="#" class="link" ><img src="../../General/img/Iconos_menu/clases.png" class="imgmenu"> Clase</a></li>
                        <li><a href="../../General/Actividades/Lecciones/Nivel2/Lecciones.html" class="link" ><img src="../../General/img/Iconos_menu/lecciones.png" class="imgmenu"> Lecciones <img src="../../General/img/Iconos_menu/desplegar.png" class="imgmenu usu"></a>
                            <ul>
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/temario.png" class="imgmenu">Temario</a> </li>
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu"> Nivel Básico</a></li> 
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu usu">Nivel Intermedio</a></li> <br>
                                <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/apuntes.png" class="imgmenu">Nivel Avanzado</a></li>
                                <li><a href="MaterialApoyoA.jsp" class="link" ><img src="../../General/img/Iconos_menu/libros_1.png" class="imgmenu">Material de apoyo</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/comentarios.png" class="imgmenu">Chat</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/ejercicios.png" class="imgmenu"> Ejercicios</a></li>
                        <li><a href="#" class="link" > <img src="../../General/img/Iconos_menu/puntuaciones.png" class="imgmenu"> Puntuaciones</a></li>
                        <li><a href="#" class="link" ><img src="../../General/img/Iconos_menu/coheteM.png" class="imgmenu">Mapa</a></li> 
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

    <nav class="navbar">
        <div class="contenedor">
            <a href="#">Inicio</a>
            <a href="#">Servicios</a>
            <a href="#">Precios</a>
            <a href="#">Compañía</a>
            <a href="#">Soporte</a>
        </div>
    </nav>
    <div class="contenedor-imagen">
        <a href="#">
            <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80" alt="">
        </a>
    </div>

    <main id="blog">
        <div class="contenedor">
            <aside>
                <h3 class="titulo">Temas</h3>
                <nav class="indice">
                    <a href="#">Articulo #1</a>
                    <a href="#">Articulo #2</a>
                    <a href="#">Articulo #3</a>
                    <a href="#">Articulo #4</a>
                </nav>
            </aside>
            <div class="contenido">
                <div class="post">
                    <h1 class="titulo">Artículo #1</h1>
                    <p class="fecha">Publicado el 4 de Marzo de 2021</p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod scelerisque erat tincidunt hendrerit. Cras lobortis id diam sit amet consectetur. Suspendisse non pulvinar justo, ac commodo velit. Quisque maximus dolor ac magna molestie, sit amet commodo velit congue. Maecenas non dolor ut elit malesuada congue. Phasellus euismod nisi pharetra ante rutrum dignissim. Ut eget tortor ut sapien egestas sollicitudin. Aenean pulvinar varius augue, ac euismod tortor faucibus at. In commodo sodales turpis nec vehicula. Mauris luctus, risus non iaculis porttitor, felis eros sagittis enim, sed ultricies lacus magna quis urna.
                    </p>
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
            <img src="https://images.unsplash.com/photo-1497215728101-856f4ea42174?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" alt="">
        </div>
        <nav class="navbar">
            <div class="contenedor">
                <a href="#">Inicio</a>
                <a href="#">Servicios</a>
                <a href="#">Precios</a>
                <a href="#">Compañía</a>
                <a href="#">Soporte</a>
            </div>
        </nav>
    </footer>
</body>
</html>
