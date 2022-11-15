<%-- 
    Document   : infoForo
    Created on : 9 nov. 2022, 19:41:51
    Author     : kim53
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="Conexion.BD"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

            int id = (int) (miSessiondelUsuario.getAttribute("id_usuario") == null ? 0 : miSessiondelUsuario.getAttribute("id_usuario"));
            int MAX_SIZE = 102440 * 10244000;
            String rootPath;
            DataInputStream in = null;
            FileOutputStream fileOut = null;
            String remoteAddr = request.getRemoteAddr();
            String serverName = request.getServerName();
            String realPath = "D:\\Copernicus\\Tuna_Tech\\web\\General\\Usu_img\\fotosForo\\";
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

            String texto = request.getParameter("textoPost");

            try {
                base.conectar();
                String datitos = "Select * from Estudiante where id_usuario = '" + id + "'";
                ResultSet rsDatosPer = base.consulta(datitos);

                while (rsDatosPer.next()) {
                    String nombre = rsDatosPer.getString(2);
                    String correo = rsDatosPer.getString(3);
                    String tipo = rsDatosPer.getString(6);
                    String grado = rsDatosPer.getString(7);
                    //String foto = rsDatosPer.getString(5);

                    // String strQry = "insert into imgUsu(id_usuario, imagen) values ( '" + id + " ' , ' " + saveFile + " ' ) ";
                    // ---------------------String str = "insert into Estudiante(foto_usuario) values ( '" + saveFile + " ' ) where id_usuario='" + id + "'";
                    //String strQry = "insert into imgUsu(id_usuario, imagen) values ( '" + id + " ' , ' " + saveFile + " ' ) ";
                    String dato = "insert into Post(autor_post, correo_usuario, pass_usuario, tipo_usuario)" + "values( '" + usuario + "','" + correo + "','" + pswd + "','" + tipoUsu + "' )";
                    base.insertar(dato);
// mmmmmmmmm   String str = "update Post set img_post='" + saveFile + "'where id_usuario='" + id + "'";

                    base.edita(str);
                    int resultadoEdita = base.edita(str);

                    if (resultadoEdita == 1) {
        %>
        <script>
            window.alert("La foto de perfil se actualizó correctamente");
        </script>

        <%
                }
            }catch (Exception XD) {

            }
            // request.getRequestDispatcher("ListaABCC.jsp").forward(request, response);
            //request.getRequestDispatcher("../../Alumno/jsp_A/Perfil_A.jsp").forward(request, response);


        %>


    </body>
</html>
