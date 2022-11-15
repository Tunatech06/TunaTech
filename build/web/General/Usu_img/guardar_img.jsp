<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.BD"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

    int id = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
    int MAX_SIZE = 102440 * 10244000;
    String rootPath;
    DataInputStream in = null;
    FileOutputStream fileOut = null;
    String remoteAddr = request.getRemoteAddr();
    String serverName = request.getServerName();
    String realPath = "D:\\Copernicus\\Tuna_Tech\\web\\General\\Usu_img\\fotosPerfil\\";
    rootPath = realPath;
    String contentType = request.getContentType();
    String saveFile = "";

    try {
        if (contentType.indexOf("multipart/form-data") >= 0) {
            in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            if (formDataLength > MAX_SIZE) {
                out.println("<p> El archivo de carga máxima no puede exceder " + MAX_SIZE + "</p>");
                return;
            }
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }
            String file = new String(dataBytes, "UTF-8");
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());

            String fileName = rootPath + saveFile;
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;

            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

            File fileDir = new File(rootPath);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            fileOut = new FileOutputStream(fileName);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.close();

        } else {
            String content = request.getContentType();
            out.println("<p> El tipo de dato cargado no es multipart / form-data </p>");
        }
    } catch (Exception ex) {
        throw new ServletException(ex.getMessage());
    }

    BD base = new BD();

    String nombre = request.getParameter("txtN");
    String pass1 = request.getParameter("TxtPass");
    String pass2 = request.getParameter("txtPass2");

    try {
        // String strQry = "insert into imgUsu(id_usuario, imagen) values ( '" + id + " ' , ' " + saveFile + " ' ) ";
        //String str = "insert into Usuario(foto_usu) values ( '" +  saveFile + " ' ) where Id_usu='" + id + "'";
        //String strQry = "insert into imgUsu(id_usuario, imagen) values ( '" + id + " ' , ' " + saveFile + " ' ) ";
        //String strQry = "update imgUsu set imagen='" + saveFile + "'where id_usuario='" + id + "'";

        base.conectar();
        //String str = "update Usuario set nombre='" + nombre + "',pass='" + pass2 +  "'where id_usuario='" + id + "'";
        //base.edita(str);

        //String strQ = "update Usuario set foto_usu='" + saveFile + "'," + " pass='" + pass2 + "'," + "nombre='" + nombre + "'where id_usuario='" + id + "'";
        String strQ = "update Usuario set nombre='" + nombre + "'," + " pass='" + pass2 + "'," + "foto_usu='" + saveFile + "'where id_usuario='" + id + "'";
        base.edita(strQ);
        int resultadoEdita = base.edita(strQ);
        out.println("Instrucción en SQL a realizar " + strQ);
        out.println("Resultado de la modificación "
                + resultadoEdita);

        String dato = "Select imagen from imgUsu where id_usuario = '" + id + "'";
        ResultSet result = base.consulta(dato);

        if (result.equals("null")) {
            String strQry = "insert into imgUsu(id_usuario, imagen) values ( '" + id + " ' , ' " + saveFile + " ' ) ";
            base.edita(strQry);
        } else {
            String strQry = "update imgUsu set imagen='" + saveFile + "'where id_usuario='" + id + "'";
            base.edita(strQry);
        }

    } catch (Exception XD) {

    }
    // request.getRequestDispatcher("ListaABCC.jsp").forward(request, response);
    //request.getRequestDispatcher("../../Alumno/jsp_A/Perfil_A.jsp").forward(request, response);


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" session="true">
        <title>Datos Actualizados</title>
        <link rel="stylesheet" href="../css/guardarImg.css" >
        <style>@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');</style>
        <style>@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');</style>
        <link rel="shorcut icon" href="../../../../General/img/logos/Newlogo.png">
    </head>


    <div class="window-notice" id="window-notice">
        <div class="content">
            <div class="content-text">
                <p>Tus datos se actualizaron correctamente</p>
                <p><a href="../../Alumno/jsp_A/Perfil_A.jsp">Ir a mi perfil</a></p>
            </div>
            <div class="content-buttons"><a href="../../Alumno/jsp_A/Menu_A.jsp" id="close-button">Ir a menú principal</a></div>
        </div>
    </div>



    <%   // response.sendRedirect("../../Alumno/jsp_A/Perfil_A.jsp");
%>


</body>
</html>
