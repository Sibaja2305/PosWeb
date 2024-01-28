<%-- 
    Document   : Admin
    Created on : 15/01/2024, 07:29:38 PM
    Author     : Hp EliteBook
--%>

<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% 
    ConnectionMysql mysql = new ConnectionMysql("pos");
    int cantidad = mysql.getCantMesas();
    %>
    <link href="estilo.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
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
        <h1>Mesas</h1>
      <form method="post" action="CantTablesValidation.jsp">
          
                <div class="form-group">
                    <label class="labels">Cantidad de Mesas:</label>
                    <input type="text" class="form-control" name="CantMesas" placeholder="<%=cantidad%>" required Style ="width: 75%; outline: none; border: none; border-bottom: solid #51585e" >
                </div>
             
                
             <div style="float: left">
                 <button type="submit" class="btn btn-primary">Guardar</button>
             </div>
         
            </form>
    </body>
</html>
