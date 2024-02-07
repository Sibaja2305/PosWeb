<%-- 
    Document   : SelectOrder
    Created on : 05/02/2024, 07:26:03 PM
    Author     : Hp EliteBook
--%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");
    int idProduct = Integer.parseInt(request.getParameter("select"));
    int table = Integer.parseInt(request.getParameter("table"));
    int cantidad = Integer.parseInt(request.getParameter("quantity"));
    String comentario =request.getParameter("comment");
    
    System.out.println("id selecionado = " + idProduct);
    System.out.println("mesa selecionado = " + table);
    System.out.println("cantidad "+ cantidad);
    System.out.println("comentario"+ comentario);
    /*
     * if (mysql.orderExist(idProduct, table)) {
        
        if (mysql.orderExist(idProduct, table)) {
                
            }
        
        response.sendRedirect("User.jsp"); 
    } else {
        // fallo
        out.println("<script>alert('Este objeto no se puede eliminar'); window.location.href='User.jsp';</script>");
    }
    */
     
%>
