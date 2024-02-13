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
            .c {
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
            function aumentar(rowId) {
                var cantidad = document.getElementById('cantidad_' + rowId);
                cantidad.value = parseInt(cantidad.value) + 1;
            }

            function disminuir(rowId) {
                var cantidad = document.getElementById('cantidad_' + rowId);
                if (parseInt(cantidad.value) > 0) {
                    cantidad.value = parseInt(cantidad.value) - 1;
                }
            }

            function aumentarDrink(rowId) {
                var cantidadDrink = document.getElementById('cantidadDrink_' + rowId);
                cantidadDrink.value = parseInt(cantidadDrink.value) + 1;
            }

            function disminuirDrink(rowId) {
                var cantidadDrink = document.getElementById('cantidadDrink_' + rowId);
                if (parseInt(cantidadDrink.value) > 0) {
                    cantidadDrink.value = parseInt(cantidadDrink.value) - 1;
                }
            }

            function captureData(rowId) {
                var comment = document.querySelector('#miTabla tbody tr:nth-child(' + (parseInt(rowId) + 1) + ') textarea[name="comment"]').value;
                var quantity = document.getElementById('cantidad_' + rowId).value;

                // Actualiza los valores de los campos ocultos con el comentario y la cantidad
                document.getElementById('comment_' + rowId).value = comment;
                document.getElementById('quantity_' + rowId).value = quantity;

                // Envía el formulario
                document.getElementById('form_' + rowId).submit();
            }

            function captureDataDrink(rowId) {
                var comment = document.querySelector('#miTablaDrink tbody tr:nth-child(' + (parseInt(rowId) + 1) + ') textarea[name="commentDrink"]').value;
                var quantity = document.getElementById('cantidadDrink_' + rowId).value;

                // Actualiza los valores de los campos ocultos con el comentario y la cantidad
                document.getElementById('commentDrink_' + rowId).value = comment;
                document.getElementById('quantityDrink_' + rowId).value = quantity;

                // Envía el formulario
                document.getElementById('formDrink_' + rowId).submit();
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
                            <th>Cantidad</th>
                            <th>Comentario</th>
                            <th hidden>Categoría</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int table = Integer.parseInt(request.getParameter("table"));
                            System.out.println("table " + table);
                            ConnectionMysql mysql = new ConnectionMysql("pos");
                            ArrayList<Inventary> menu = mysql.getFood();
                            for (int i = 0; i < menu.size(); i++) {%>
                        <tr>
                            <td hidden><%= menu.get(i).getId_Product()%></td>
                            <td><%= menu.get(i).getName()%></td>
                            <td><%= menu.get(i).getPrice()%></td>
                            <td>
                                <button type="button" id='disminuir' onclick="disminuir(<%= i%>)">-</button>
                                <input style="width: 40px;" type='text' id="cantidad_<%= i%>" name="quantity" value="0">
                                <button type="button" id='aumentar' onclick="aumentar(<%= i%>)">+</button>
                            </td>
                            <td>
                                <div style="text-align: center; max-width: 30px; ">
                                    <textarea name="comment" rows="1" cols="15" placeholder="escriba su comentario aquí"></textarea>
                                </div>
                            </td>
                            <td hidden><%= menu.get(i).getCategory()%></td>
                            <td>
                                <form action="SelectOrder.jsp" method="post" id="form_<%=i%>">
                                    <input type="hidden" name="comment" id="comment_<%= i%>" value="">
                                    <input type="hidden" name="quantity" id="quantity_<%= i%>" value="">
                                    <input type="hidden" name="select" value="<%= menu.get(i).getId_Product()%>">
                                    <input type="hidden" name="name" value="<%= menu.get(i).getName()%>">
                                    <input type="hidden" name="category" value="<%= menu.get(i).getCategory()%>">
                                    <input type="hidden" name="price" value="<%= menu.get(i).getPrice()%>">
                                    <input type="hidden" name="table" value="<%= table%>">
                                    <input type="button" onclick="captureData('<%=i%>')" value="Seleccionar">
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Aquí puedes hacer lo mismo para las bebidas -->
            <div class="column">
                <h2>Comidas</h2>
                <table class="tabla" id="miTablaDrink" border="1">
                    <thead>
                        <tr>
                            <th hidden>id_producto</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Comentario</th>
                            <th hidden>Categoría</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% ArrayList<Inventary> drink = mysql.getDrink();
                            for (int i = 0; i < drink.size(); i++) {%>
                        <tr>
                            <td hidden><%= drink.get(i).getId_Product()%></td>
                            <td><%= drink.get(i).getName()%></td>
                            <td><%= drink.get(i).getPrice()%></td>
                            <td>
                                <button type="button" id='disminuirDrink' onclick="disminuirDrink(<%= i%>)">-</button>
                                <input style="width: 40px;" type='text' id="cantidadDrink_<%= i%>" name="quantity" value="0">
                                <button type="button" id='aumentarDrink' onclick="aumentarDrink(<%= i%>)">+</button>
                            </td>
                            <td>
                                <div style="text-align: center; max-width: 30px; ">
                                    <textarea name="commentDrink" rows="1" cols="15" placeholder="escriba su comentario aquí"></textarea>
                                </div>
                            </td>
                            <td hidden><%= drink.get(i).getCategory()%></td>
                            <td>
                                <form action="SelectOrder.jsp" method="post" id="formDrink_<%= i%>">
                                    <input type="hidden" name="comment" id="commentDrink_<%= i%>" value="">
                                    <input type="hidden" name="quantity" id="quantityDrink_<%= i%>" value="">
                                    <input type="hidden" name="select" value="<%= drink.get(i).getId_Product()%>">
                                    <input type="hidden" name="name" value="<%= drink.get(i).getName()%>">
                                    <input type="hidden" name="category" value="<%= drink.get(i).getCategory()%>">
                                    <input type="hidden" name="price" value="<%= drink.get(i).getPrice()%>">
                                    <input type="hidden" name="table" value="<%= table%>">
                                    <input type="button" onclick="captureDataDrink('<%= i%>')" value="Seleccionar">
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
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

                            </td>
                            <td value="price"></td>
                            <td>


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
</body>
</html>
