<%-- 
    Document   : SelectOrder
    Created on : 05/02/2024, 07:26:03 PM
    Author     : Hp EliteBook
--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");
    int idProduct = Integer.parseInt(request.getParameter("select"));
    int table = Integer.parseInt(request.getParameter("table"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    String comment = request.getParameter("comment");
    String name = request.getParameter("name");
    int category = Integer.parseInt(request.getParameter("category"));
    double price = Double.parseDouble(request.getParameter("price"));
    price = price * quantity;

    String encodedTable = URLEncoder.encode(String.valueOf(table), "UTF-8");
    String redirectURL = "Order.jsp?table=" + encodedTable;

    System.out.println("id selecionado = " + idProduct);
    System.out.println("mesa selecionado = " + table);
    System.out.println("cantidad " + quantity);
    System.out.println("comentario" + comment);

    if (mysql.orderExist(idProduct, table)) {

        if (mysql.insertOrder(table, idProduct, name, quantity, price, comment, category)) {
            response.sendRedirect("Order.jsp?table=" + table);
        } else {
            out.println("<script>alert('No fue posible añadir este elemento a la orden'); window.location.href='" + redirectURL + "';</script>");
        }
    } else {

        out.println("<script>alert('Este elemento ya esta en la orden'); window.location.href='" + redirectURL + "';</script>");
    }


%>
