<%-- 
    Document   : ViewOrder
    Created on : 19/02/2024, 01:15:19 PM
    Author     : Hp EliteBook
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Order"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <%
            int table = Integer.parseInt(request.getParameter("table"));
            ConnectionMysql mysql = new ConnectionMysql("pos");
            ArrayList<Order> view = mysql.getViewOrder(table);
        %>
        <title>Orden mesa <%=table%></title>
    </head>
    <body>
        <style>
    .button-container {
        display: flex;
        justify-content: space-between;
        margin: 50px auto; /* Agrega margen en la parte superior e inferior y centra horizontalmente */
        max-width: 600px; /* Opcional: ajusta el ancho máximo del contenedor */
    }
    .button-container form input[type="submit"] {
        width: 200px; 
        height: 100px;
    }
</style>
       
        <h2>Orden mesa <%=table%></h2>
        <div class="container">
            <div class="row" >
                <div class="col">
                    <table class="table table-bordered" border="1" >
                        <thead>
                            <tr>
                                <th hidden="true">id_orden</th>
                                <th hidden="true">Id_Producto</th>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Comentario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < view.size(); i++) {


                            %>
                            <tr>
                                <td hidden="true"><%=view.get(i).getIdOrder()%></td>
                                <td hidden="true"><%=view.get(i).getIdProduct()%></td>
                                <td><%=view.get(i).getNombre()%></td>
                                <td><%=view.get(i).getQuantity()%></td>
                                <td><%=view.get(i).getPrice()%></td>
                                <td><%=view.get(i).getComment()%></td>
                            </tr>

                            <%}%>
                        </tbody>
                    </table>   

                </div>
            </div>
        </div>
        <div class="button-container">
            <form action="CheckIn.jsp">
                <input hidden="true" type="submit" name="table" value="<%= table%>">
                <input type="submit" value="Finalizar Orden">
            </form>
            <form action="ModifyOrder.jsp">
                <input hidden="true" type="submit" name="table" value="<%= table%>">
                <input type="submit" value="Modificar Orden">
            </form>
        </div>    




    </body>
</html>
