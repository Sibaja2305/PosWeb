<%-- 
    Document   : Admin
    Created on : 15/01/2024, 07:29:38 PM
    Author     : Hp EliteBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class ="content">
                
                <div class="menu container">
                    
                     <div class="logoContainer">
                        <img style="width: 50px;" src="image/businessman.png" alt=""/>
                    <a href="1.jsp" class="logo" >Abministrador</a> 
                     </div>
                    
                    <input type="checkbox" id="menu">
                    <label for="menu"> 
                        <img src="image/134216_menu_lines_hamburger_icon.png" class="menu-icono" alt="imagen boton menu"/>
                    </label>
                    <nav class="navbar">
                        <ul>
                            <li><a href="Admin.jsp">Inicio</a></li>
                            <li><a href="Menu.jsp">Menu</a></li>
                            <li><a href="Inventory.jsp">Inventario</a></li>
                            <li><a href="Report.jsp">Reporte</a></li>
                            <li><a href="User.jsp">Usuario</a></li>
                        </ul>

                    </nav>
                </div>
                
            </div>
        </header>
        <h1>Reporte</h1>
    </body>
</html>
