<%-- 
    Document   : DeleteUser
    Created on : 22/01/2024, 03:48:14 PM
    Author     : Hp EliteBook
--%>

<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");
    int codeUser = Integer.parseInt(request.getParameter("deleteUser"));
    // Validar el codigo de la computadora
    if (mysql.deleteUser(codeUser)) {
        
        
        response.sendRedirect("User.jsp"); // Página despues de eliminar computadora
    } else {
        // fallo
        out.println("<script>alert('Este objeto no se puede eliminar'); window.location.href='User.jsp';</script>");
    }
%>