
|<%-- 
    Document   : DeleteOrder
    Created on : 15/02/2024, 02:52:55 PM
    Author     : Hp EliteBook
--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%
    
    ConnectionMysql mysql = new ConnectionMysql("pos");
     System.out.println("orderReady");
    int idOrder = Integer.parseInt(request.getParameter("order"));
    int table = Integer.parseInt(request.getParameter("table"));
    int status = Integer.parseInt(request.getParameter("status"));
    int cambio;
    if (status == 1) {
         cambio = 2;
        }else{
        cambio = 1;
    }
   System.out.println("mesa en oorder ready = "+ table);
   System.out.println("estado"+status);
   System.out.println("order"+ idOrder);
String encodedTable = URLEncoder.encode(String.valueOf(table), "UTF-8");
    String redirectURL = "Chef.jsp?table=" + encodedTable;
    // Validar el codigo de la computadora
    if (mysql.editStateOrder(idOrder, cambio)) {
        System.out.println("entro al if");
        
         response.sendRedirect("Chef.jsp?table=" + table);
    } else {
        // fallo
        out.println("<script>alert('No se edito el estado'); window.location.href='" + redirectURL + "';</script>");
    }
%>