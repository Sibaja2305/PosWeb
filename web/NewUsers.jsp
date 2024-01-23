<%-- 
    Document   : NewUsers
    Created on : 22/01/2024, 04:08:08 PM
    Author     : Hp EliteBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="PosScript.js" type="text/javascript"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
    </head>
    <body>
        <form style="margin-left: 10px"onsubmit="return validarFormulario()"  action= "UserValidation.jsp" method="post">
            <div>
                <h1 class="Title">Ingresar nuevo usuario</h1>
            </div>
            <div class="form-group">
                <label class="labels" style="margin-bottom: 5px; margin-top: 10px">Digite un Usuario:</label>
                <input type="text" class="form-control" name="user" placeholder="Ingrese el usuario" required Style ="width: 40%" >
            </div>

            <div class="form-group">
                <label class="labels" style="margin-bottom: 5px; margin-top: 10px">Digite una Contraseña:</label>
                <input type="password" id="password" class="form-control" name="password" placeholder="Digite la Contraseña" required Style =" width: 40%">
            </div>
            <div class="form-group">
                <label class="labels" style="margin-bottom: 5px; margin-top: 10px">Confirme la Contraseña:</label>
                <input type="password" id="confirmPassword"  class="form-control" name="confirmPassword" placeholder="Confirme la Contraseña" required Style =" width: 40%">
            </div>
            <div style="float: left; margin-top: 25px">
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>


            <div Style ="display: inline-block; margin-left: 10px; width: 70%; margin-top: 25px ">
                <select class="form-control" name="txtTypeEmploye" required Style ="width: 22%; margin-top: 0px">
                    <option value="">Selecciona una opción</option>
                    <option value="1">Administrador</option>
                    <option value="2">Mesero</option>
                    <option value="3">Bartender</option>
                    <option value="4">Chef</option>
                </select>
            </div>


        </form>
    </body>
</html>
