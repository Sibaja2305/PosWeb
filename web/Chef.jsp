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
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="estilo.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        .cuerpo{

            display: flex;
            flex-wrap: wrap;
            min-height: 100vh;

        }
        td {
            text-align: center; /* Centra horizontalmente el contenido */
            vertical-align: middle; /* Centra verticalmente el contenido */
            padding: 10px; /* Ajuste de espaciado */
        }
        .boton{
            margin: 15px;
            width: 50%;
            height: 50px;
        }
        .check{
            border: none;
            align-items: center;
        }
        .botton-container{
            text-align: center;

            width: 100%;
        }
        .lateral-var{

            height: 100%;
            width: 20%;
            background-color: #379af0;
        }
        .table-container{

            align-content:  center;
            width: 75%;
            margin-top: 40px;
            margin-left: 20px;
        }
        table{
            width: 100%;
        }
        table tb{
            margin: 20px;
        }

    </style>
    <script>
        window.onload = function () {
            var cuerpoHeight = document.querySelector('.cuerpo').clientHeight;
            document.querySelector('.lateral-var').style.height = cuerpoHeight + 'px';
        }
    </script>
    <body >

        <header>
            <div class ="s">

                <div class="menu container">

                    <div class="logoContainer">
                        <img style="width: 50px;" src="image/chef.png" alt=""/>
                        <a href="Chef.jsp" class="logo" >Chef</a> 
                    </div>

                    <input type="checkbox" id="menu">
                    <label for="menu"> 

                        <img src="image/134216_menu_lines_hamburger_icon.png" class="logo" alt="imagen boton menu"/>
                    </label>
                    <nav class="navbar">
                        <ul>

                            <li> <button id="logout">Cerrar Sesion</button></li>
                        </ul>

                    </nav>
                </div>

            </div>
        </header>
        <div class="cuerpo">
            <h1></h1>
            <div class="lateral-var">
                <div  class="botton-container">
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
                        String cc = "blue";
                        for (int i = 0; i < mesas; i++) {
                            ArrayList<Order> viewChefTemp = mysql.getOrderChef(i + 1);
                            if (viewChefTemp.isEmpty()) {
                                cc = "#d3d0c2";
                            } else {
                                cc = "#37f076";
                            }
                            viewChefTemp.clear();
                    %>
                    <div>

                        <form action="Chef.jsp" method="POST">

                            <button style="background-color: <%=cc%> ; border: none"  class="boton" type="submit" name="table" value="<%= i + 1%>">
                                mesa <%=i + 1%>
                            </button>


                        </form>

                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="table-container">

                <div class="row">
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
                                        String urlCheckbox = "";
                                        if (viewChef.get(i).getStatus() == 1) {
                                            urlCheckbox = "image/check.png";
                                        } else {
                                            urlCheckbox = "image/equis2.png";
                                        }

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
                                            <input hidden="true" type="text" name="status" value="<%= viewChef.get(i).getStatus()%>">
                                            <input hidden="true" type="text" name="table" value="<%= table%>">
                                             <input hidden="true" type="text" name="nameJSP" value="Chef">
                                            <button class="check" type="submit" name="editStatus" value="">
                                                <img src="<%=urlCheckbox%>" alt=""/>
                                            </button>


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
