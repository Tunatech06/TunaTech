<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear clase</title>
        <link rel="stylesheet" href="../css_D/form_docen.css" ><!--  -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Mulish&display=swap');
        </style>
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.js"></script>
        <script defer src="codigo.js"></script>
    </head>

    <body>
        <header>
            <table>
                <tr>
                    <td>
                        <img src="../../General/img/logos/Newlogo.png" alt="logoCS" class="imglogo"/>
                    </td>
                    <td>
                        <a href="../index.html" ><h1>Copernicus System</h1></a>
                    </td>
                </tr>
            </table>

        </header>

        <div class="cuadro">
            <p><h1>Clase</h1></p>
    </div>
    <div class="contenedorQR" id="contenedorQR" > </div>
    <button class="btn" id="btnDescargar"></button>

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
