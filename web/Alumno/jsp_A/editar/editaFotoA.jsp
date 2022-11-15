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
        String strQry = "select * from Estudiante where id_usuario='" + id + "'";

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
        <link rel="stylesheet" href="../../css_A/editaDatos.css" >
        <style>@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');</style>
        <style>@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');</style>
        <link rel="shorcut icon" href="../../General/img/logos/Newlogo.png">
    </head>
    <body id="Principal">
        <form name="datosEdit" action="guardar_img.jsp" method="post" enctype="MULTIPART/FORM-DATA">
            <div id="cuadro4" style="background-color: white; color: black;">
                <table class="tablita" border="0" style="color: black;">
                    <tr>
                        <td><h1>Foto de perfil</h1></td>
                    </tr>
                    <tr>
                        <%
                            if (info.getString(5) == null) {
                        %>
                        <td><img src="../../../General/img/fotoUsu_0.png" width=130" height="120" alt="foto 0" class="imagenUsuCero blanco"/></td>

                        <%
                        } else {

                        %>
                        <td><img class="imagenUsuCero" src="../../../General/Usu_img/fotosPerfil/<%=foto%>" width=135" height="135"></td>

                        <%                }
                        %>
                    </tr>

                    <tr>
                        <td><input id="fileImg" type="file" name="fileImg"  class="fileImg" accept="image/*"></td>
                    </tr>
                   
                    <tr>
                    <center><td colspan='2'><input id="BtnEditar" name="BtnEditar" type="submit"  class="actu_b" value="Actualizar foto"/></td></center>
                    </tr>
                    <br><br> <br>
                </table>
            </div>
            <%            }
                } catch (Exception ex) {
                    out.println(ex.getMessage());
                }
            %>
        </form>


    </body>
</html>
