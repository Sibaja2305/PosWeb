<%-- 
    Document   : LoginValidation
    Created on : 15/01/2024, 07:09:53 PM
    Author     : Hp EliteBook
--%>

<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");
    String user = request.getParameter("user").trim();
    String password = request.getParameter("password").trim();
    int range = Integer.parseInt(request.getParameter("txtTypeEmploye").trim());
    // Validar el usuario y contraseña
    if (mysql.userValidation(user, password, range)) {
        // Inicio de sesión exitoso
        session.setAttribute("Usuario", user);
      
        
        switch (range) {
            case 1:
                response.sendRedirect("Admin.jsp"); // Página de inicio después de iniciar sesión 
                break;
            case 2:
                response.sendRedirect("Waiter.jsp"); // Página de inicio después de iniciar sesión
                break;
            case 3:
                response.sendRedirect("Chef.jsp"); // Página de inicio después de iniciar sesión
                break;
            case 4:
                response.sendRedirect("Bartender.jsp"); // Página de inicio después de iniciar sesión
                break;
        }
    } else {
        // Inicio de sesión fallido
        out.println("<script>alert('Usuario o contraseña incorrectos'); window.location.href='Login.jsp';</script>");
    }
%>