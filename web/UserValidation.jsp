<%-- 
    Document   : UserValidation
    Created on : 22/01/2024, 04:18:06 PM
    Author     : Hp EliteBook
--%>

<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
ConnectionMysql mysql = new ConnectionMysql("pos");

String usuario = request.getParameter("user");
String password = request.getParameter("confirmPassword");
int range = Integer.parseInt(request.getParameter("txtTypeEmploye"));

if (mysql.insertUser(usuario, password, range)) {
     response.sendRedirect("User.jsp"); 
    } else {
        // fallo
        out.println("<script>alert('Este Usuario no se ingreso correctamente'); window.location.href='NewUsers.jsp';</script>");
    }    
    
%>
