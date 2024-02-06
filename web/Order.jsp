<%-- 
    Document   : pedido
    Created on : 30/01/2024, 05:43:13 PM
    Author     : user
--%>

<%@page import="Clases.Inventary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Pedido</title>
        <style>

            .c{
                
               display: flex;
               flex-wrap: wrap;
               
               

            }
            /* Estilo para cada columna */
            .column {
                width: 45%;
                align-items: center;
                margin: 20px;
            }

            /* Ajustes opcionales para mejorar la presentación */
            .tabla {
                border-collapse: collapse;
                width: 100%;
                
            }

            table, th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            .boton {
                margin-top: 20px;

                color: #fff;
                background-color: blue;
                height: 40px;

            }
           

        </style>

        <script>
            var inicio = 0;

            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('aumentar').addEventListener('click', aumentar);
                document.getElementById('disminuir').addEventListener('click', disminuir);
            });

            function aumentar() {
                var cantidad = document.getElementById('cantidad');
                cantidad.value = ++inicio;
            }

            function disminuir() {
                var cantidad = document.getElementById('cantidad');
                if (inicio > 0) {
                    cantidad.value = --inicio;
                }
            }
        </script>

    </head>

    <body>
        <h1>Pedido</h1>

        <div class="c">
            <div class="column">
                <h2>Comidas</h2>
                <table class="tabla" id="miTabla" border="1">
                    <thead>
                        <tr>
                            <th hidden>id_producto</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th hidden>Categoría</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int table = Integer.parseInt(request.getParameter("mesa"));
                            System.out.println("table "+ table); 
                            ConnectionMysql mysql = new ConnectionMysql("pos");
                            ArrayList<Inventary> menu = mysql.getFood();
                            for (int i = 0; i < menu.size(); i++) {
                        
                            

                        %>
                        <tr>
                            <td hidden><%=menu.get(i).getId_Product()%></td>
                            <td><%=menu.get(i).getName()%></td>
                            <td><%=menu.get(i).getPrice()%></td>
                            <td hidden><%=menu.get(i).getCategory()%></td>
                            <td>
                                <form  action="SelectOrder.jsp" id="selected" method="post">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="select" 
                                        id="id" 
                                        value="<%=menu.get(i).getId_Product() 
                                        %>">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="table" 
                                        id="id" 
                                        value="<%=table%>">
                                    
                                    <input                                        
                                        
                                        type="submit"                                                                              
                                        value="Seleccionar" >
                                </form>
                            </td>

                        </tr>
                    </tbody>
                    <%}%>
                </table>

            </div>
            <div class="column">
                <h2>Bebidas</h2>
                <table class="tabla" id="miTabla" border="1">
                    <thead>
                        <tr>
                            <th hidden>id_producto</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th hidden>Categoría</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            ArrayList<Inventary> drink = mysql.getDrink();
                            for (int i = 0; i < drink.size(); i++) {


                        %>
                        <tr>
                            <td hidden><%=drink.get(i).getId_Product()%></td>
                            <td><%=drink.get(i).getName()%></td>
                            <td><%=drink.get(i).getPrice()%></td>
                            <td hidden><%=drink.get(i).getCategory()%></td>
                            <td>
                                <form  action="selectOrder.jsp" id="selected" method="post">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="select" 
                                        id="id" 
                                        value="<%=drink.get(i).getId_Product() 
                                        %>">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="table" 
                                        id="id" 
                                        value="<%=table%>">
                                    <input                                        
                                         
                                        type="submit"                                                                              
                                        value="Seleccionar" >
                                </form>
                            </td>

                        </tr>
                    </tbody>
                    <%}%>
                </table>

            </div>
        </div>

                <div style="margin-left: 20px;">
            <h2>Orden</h2>
            <form name="order" action="validationOrder.jsp" method="POST">

                <table style="width: 94%;" border="1">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Comentario</th>
                            <th hidden>Categoria</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td value="name" ></td>
                            <td value="quantity">
                                <button type="button" id='disminuir' onclick="disminuir()">-</button>
                                <input style="width: 25px;" type='text' id="cantidad" name="quantity" value="0">
                                <button type="button" id='aumentar' onclick="aumentar()">+</button>
                            </td>
                            <td value="price"></td>
                            <td>

                                <div style="text-align: center; max-width: 30px; ">
                                    <textarea name="comment" rows="1" cols="25" placeholder="escriba su comentario aqui"></textarea>
                                </div>
                            </td>
                            <td value="category" hidden></td>
                            <td>
                                <form  action="DeleteOrden.jsp" id="delete" method="post">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="Delete" 
                                        id="id" 
                                        value="">
                                    <button type="submit" style="background: none; border: none; padding: 0; margin-left: 20px; cursor: pointer;">
                                        <img src="image/x.png" alt="Eliminar"/>
                                    </button>
                                </form>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <input class="boton" type="submit" value="confirmar pedido" name="confirm" />
            </form>
        </div>






    </body>

</html>
