<%-- 
    Document   : ConfirmOrder
    Created on : 15/02/2024, 03:07:18 PM
    Author     : Hp EliteBook
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");

    int table = Integer.parseInt(request.getParameter("confirm"));
    String encodedTable = URLEncoder.encode(String.valueOf(table), "UTF-8");
    String redirectURL = "Order.jsp?table=" + encodedTable;
    if (mysql.insertOrder(table)) {
        if (mysql.deleteOrderTemp(table)) {
            if (mysql.editStateTable(table)) {
                response.sendRedirect("Waiter.jsp");
            }

        } else {
            out.println("<script>alert('No se elimino la orden del pedido temporal'); window.location.href='" + redirectURL + "';</script>");
        }

    } else {
        out.println("<script>alert('Error 4545'); window.location.href='" + redirectURL + "';</script>");
    }


%>


