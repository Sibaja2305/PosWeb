<%-- 
    Document   : pedido
    Created on : 30/01/2024, 05:43:13 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Pedido</title>
        <style>
            /* Estilo para dividir la página en dos columnas */
            .c {
                display: flex;
            }

            /* Estilo para cada columna */
            .column {
                flex: 1;
                padding: 10px;
            }

            /* Ajustes opcionales para mejorar la presentación */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            table, th, td {
                border: 1px solid black;
                padding: 8px;
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
                <h2>Orden</h2>
                <form name="order" action="validationOrder.jsp" method="POST">

                    <table border="1">
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
                                <td value="name" >pollo</td>
                                <td value="quantit">
                                    <button type="button" id='disminuir' onclick="disminuir()">-</button>
                                    <input style="width: 25px;" type='text' id="cantidad" name="quantity" value="0">
                                    <button type="button" id='aumentar' onclick="aumentar()">+</button>
                                </td>
                                <td value="price">1200</td>
                                <td>

                                    <div style="text-align: center; max-width: 100px;">
                                        <textarea name="comment" rows="1" cols="25" placeholder="escriba su comentario aqui"></textarea>
                                    </div>
                                </td>
                                <td value="category" hidden>comida</td>
                            </tr>

                        </tbody>
                    </table>

                    <input class="boton" type="submit" value="confirmar pedido" name="confirm" />
                </form>
            </div>


            <div class="column">
                <h2>Menú</h2>
                <table id="miTabla" border="1">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <form  action="selectOrder.jsp" id="selected" method="post">
                                    <input 
                                        hidden="true"
                                        type="text" 
                                        name="select" 
                                        id="id" 
                                        value="">
                                    <input                                        
                                        class="btn-info" 
                                        type="submit"                                                                              
                                        value="Seleccionar" >
                                </form>
                            </td>

                        </tr>
                    </tbody>
                </table>

            </div>
        </div>


    </body>

</html>
