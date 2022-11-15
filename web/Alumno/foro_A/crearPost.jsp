<%-- 
    Document   : crearPost
    Created on : 13 nov. 2022, 16:14:19
    Author     : kim53
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css_A/menu_A.css" >
        <link rel="stylesheet" href="../../General/css/foro_estilitos.css" >
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        </style>
    </head>
    <body id="crearP">
        <div class="div_1">
            <div class="infoClase">
                <h1>Nombre de la clase</h1>
                <p>Numero de estudiantes</p>
                <p>Grado de la clase</p>
                <p></p>
            </div>


            <nav class="indice">
                <h1>Crear publicación</h1>
                <form name="crearPost" action="infoForo.jsp" method="post" > 
                    <table class="tablita" border="0">
                        <tr>
                            <td>
                                <textarea cols="75" rows="5" name="textoPost" id="textoPost" class="info textArea" placeholder="Escribe lo que quieras"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="fileImg" type="file" name="fileImg"  class="fileImg" accept="image/*" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input  style="margin-right:35px;" type="reset" class="botoncitos">
                                <input class="botoncitos" type="submit" id="btnPublicar" name="btnPublicar" value="Publicar">
                            </td>
                        </tr>
                    </table>
                </form>
            </nav>
        </div>

    </body>
</html>
