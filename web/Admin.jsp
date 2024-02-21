<%-- 
    Document   : Admin
    Created on : 15/01/2024, 07:29:38 PM
    Author     : Hp EliteBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="estilo.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>

        .press {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin: 10px;

        }

        .press img {
            margin-bottom: 10px; /* Espacio entre la imagen y el texto */
        }
        .botton-container{
            display: flex;
            justify-content: center;
        }


    </style>
    <body>
        <header>
            <div class ="s">

                <div class="menu container">

                    <div class="logoContainer">
                        <img style="width: 50px;" src="image/businessman.png" alt=""/>
                        <a href="Admin.jsp" class="logo" >Administrador</a> 
                    </div>

                    <input type="checkbox" id="menu">
                    <label for="menu"> 

                        <img src="image/134216_menu_lines_hamburger_icon.png" class="logo" alt="imagen boton menu"/>
                    </label>
                    <nav class="navbar">
                        <ul>
                            <li><a href="Mesas.jsp">Mesas</a></li>
                            <li><a href="Menu.jsp">Menu</a></li>
                            <li><a href="Inventory.jsp">Inventario</a></li>
                            <li><a href="Report.jsp">Reporte</a></li>
                            <li><a href="User.jsp">Usuario</a></li>
                            <li> <button id="logout">Cerrar Sesion</button></li>
                        </ul>

                    </nav>
                </div>

            </div>
        </header>
        <h1>Inicio</h1>
        <div class="botton-container">
            <form action="Mesas.jsp" method="GET">
            <button class="press"> Mesas <img src="image/table2.png" alt=""/> </button>
            </form>
            <form action="Menu.jsp" method="GET">
            <button class="press"> Menu <img src="image/menu.png" alt="" /></button>
            </form>
            <form action="Inventory.jsp" method="GET">
            <button class="press"> Inventario <img src="image/inventory.png" alt=""/></button>
            </form>
            <form action="Report.jsp" method="GET">
            <button class="press"> Reporte <img src="image/report.png" alt="" /></button>
            </form>
            <form action="User.jsp" method="GET">
            <button class="press"> Usuario <img src="image/user.png" alt=""/></button
            </form>
        </div>

    </body>
</html>
