<%-- 
    Document   : Chef
    Created on : 15/01/2024, 07:45:15 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>

        <div style="width: 30%">
            <%
                int table;
                try {

                    table = Integer.parseInt(request.getParameter("table"));

                } catch (Exception e) {
                    table = 0;
                    System.out.println(e);
                }
                ConnectionMysql mysql = new ConnectionMysql("pos");
                ArrayList<Order> viewChef = mysql.getOrderChef(table);

                int mesas = mysql.getCantMesas();

                for (int i = 0; i < mesas; i++) {


            %>
            <div >
                <label>mesa <%=i + 1%></label>
                <form action="Chef.jsp" method="POST">

                    <button style="width: 20%; height: 20px" class="boton" type="submit" name="table" value="<%= i + 1%>">

                    </button>


                </form>

            </div>
            <%
                }
            %>
        </div>
        <div>
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
                                    <th>Estado</th>
                                    <th>Boton</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < viewChef.size(); i++) {
                                        String stringStatus = viewChef.get(i).getStatus() + "";
                                        System.out.println(viewChef.get(i).getNumTable());

                                %>
                                <tr>
                                    <td hidden="true"><%=viewChef.get(i).getIdOrder()%></td>
                                    <td hidden="true"><%=viewChef.get(i).getIdProduct()%></td>
                                    <td><%=viewChef.get(i).getNombre()%></td>
                                    <td><%=viewChef.get(i).getQuantity()%></td>
                                    <td><%=viewChef.get(i).getPrice()%></td>
                                    <td><%=viewChef.get(i).getComment()%></td>
                                    <td><%=stringStatus.equalsIgnoreCase("1")
                                            ? "No listo"
                                            : "Listo"%></td>
                                    <td> 
                                        <form action="OrderReady.jsp">
                                            <input hidden="true" type="text" name="order" value="<%= viewChef.get(i).getIdOrder()%>">
                                            <input hidden="true" type="text" name="status" value="<%= viewChef.get(i).getStatus()  %>">
                                            <input hidden="true" type="text" name="table" value="<%= table%>">
                                            <input class="btn-danger" type="submit" value="editar estado">
                                        </form>
                                    </td>
                                </tr>

                                <%}%>
                            </tbody>
                        </table>   

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
