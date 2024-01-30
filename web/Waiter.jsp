<%-- 
    Document   : Admin
    Created on : 15/01/2024, 07:29:38 PM
    Author     : Hp EliteBook
--%>

<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="estilo.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
    <style>
        .botones{
            display: flex;
            flex-wrap: wrap;
            margin-left: 50px;

        }
        .boton{

            width: 250px;
            height: 200px;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class ="s">

                <div class="menu container">

                    <div class="logoContainer">
                        <img style="width: 50px;" src="image/businessman.png" alt=""/>
                        <a href="Waiter.jsp" class="logo" >Mesero</a> 
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
        <div class="botones">
            <%
                ConnectionMysql mysql = new ConnectionMysql("pos");
                int mesas = mysql.getCantMesas();
                String dirJSP;
                String srcImage;
                for (int i = 0; i < mesas; i++) {
                    if (mysql.getTableStatus(i + 1) == 1) {
                        dirJSP = "Order.jsp";
                        srcImage = "image/businessman.png";
                    } else {
                        dirJSP = "ViewOrder.jsp";
                        srcImage = "image/4848455_chairs_dining_dinner_furniture_household_icon.png";
                    }

            %>
            <div  style="margin: 30px; text-align: center">
                <label>mesa <%=i + 1%></label>
                <form action="action" method="POST">
                    <button class="boton" type="submit" name="mesa" value="Mesa <%= i + 1%>">
                        <img src="<%=srcImage%>" alt=""/>
                    </button>
                       

                </form>

            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
