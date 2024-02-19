<%-- 
    Document   : DeleteOrder
    Created on : 15/02/2024, 02:52:55 PM
    Author     : Hp EliteBook
--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%
    
    ConnectionMysql mysql = new ConnectionMysql("pos");
     
    String id = request.getParameter("deleteOrder");
    int table = Integer.parseInt(request.getParameter("table"));
   
String encodedTable = URLEncoder.encode(String.valueOf(table), "UTF-8");
    String redirectURL = "Order.jsp?table=" + encodedTable;
    // Validar el codigo de la computadora
    if (mysql.deleteOrder(id)) {
        
        
         response.sendRedirect("Order.jsp?table=" + table);
    } else {
        // fallo
        out.println("<script>alert('No se elimino la orden'); window.location.href='" + redirectURL + "';</script>");
    }
%>