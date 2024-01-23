<%-- 
    Document   : Admin
    Created on : 15/01/2024, 07:29:38 PM
    Author     : Hp EliteBook
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.User"%>
<%@page import="dataBasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class ="content">

                <div class="menu container">

                    <div class="logoContainer">
                        <img style="width: 50px;" src="image/businessman.png" alt="Imagen de ilustratiba"/>
                        <a href="1.jsp" class="logo" style="text-decoration: none" >Abministrador</a> 
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
                            <li> <button id="logout">Cerrar Sesion</button></li>
                        </ul>

                    </nav>
                </div>

            </div>
        </header>
        <h1>Usuario</h1>
        <a href="NewUsers.jsp"> <input style="margin-left: 10px; margin-bottom: 5px" type="submit" class="btn btn-success"value="nuevo" name="newUser" /> </a>
        <%

            ConnectionMysql mysql = new ConnectionMysql("pos");
            ArrayList<User> listUser = mysql.getUsers();
            ArrayList<User> listComputerSearch = new ArrayList();
            String looking = "";
            String codeSearch = "";
            looking = request.getParameter("buscando");
            codeSearch = request.getParameter("txtSearch");

            if (codeSearch != null) {

                //   listComputerSearch = mysql.getUsers(codeSearch);
            }

        %>
        <div>
            <table  class="table table-bordered">
                <thead>
                    <tr>

                        <th class="text-center">Usuario</th>
                        <th class="text-center" >Contraseña</th>
                        <th class="text-center">Rol</th>

                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < listUser.size(); i++) {

                    %>
                    <tr>
                        <td hidden="true"class="align-middle text-center"><%=listUser.get(i).getId_user()%></td>
                        <td class="align-middle text-center"><%=listUser.get(i).getUser()%></td>
                            <td class="align-middle text-center"><%=listUser.get(i).getPassword()%> </td>
                            <td class="align-middle text-center"><%=listUser.get(i).getRange()%></td>




                        <td class="text-center">
                            <form onsubmit="return confirmDelete()" action="DeleteUser.jsp" id="deleteForm" method="post">
                                <input 
                                    hidden="true"
                                    type="text" 
                                    name="deleteUser" 
                                    id="id" 
                                    value="<%=listUser.get(i).getId_user()%>">
                                <input                                        
                                    class="btn btn-danger btn-sm" 
                                    type="submit"                                                                              
                                    value="Eliminar" >
                            </form>



                        </td>


                    </tr>

                    <%}%>
                </tbody>
            </table>
        </div> 
    </body>
</html>
