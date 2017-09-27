<%-- 
    Document   : MakeDirectory
    Created on : 26/09/2017, 5:06:04 PM
    Author     : James
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Directory</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else {
                String folderName = request.getParameter("folderName");
                JschSftpConnect connection = new JschSftpConnect("127.0.0.1", "tester", "password");
                // when sftp server allows, change to directory, username and password of the current user
                connection.makeDirectory(folderName);
                connection.closeConnection();
                response.sendRedirect("ViewFiles.jsp");
            }
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <p>Creating Directory...</p>
    </body>
</html>
