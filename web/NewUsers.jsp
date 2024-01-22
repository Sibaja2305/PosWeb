<%-- 
    Document   : NewUsers
    Created on : 22/01/2024, 04:08:08 PM
    Author     : Hp EliteBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="PosScript.js" type="text/javascript"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
    </head>
    <body>
        <form onsubmit="return validarFormulario()"  action= "UserValidation.jsp" method="post">
                <div class="form-group">
                    <label class="labels">Digite un Usuario:</label>
                    <input type="text" class="form-control" name="user" placeholder="Ingrese el usuario" required Style ="width: 75%; outline: none; border: none; border-bottom: solid #51585e" >
                </div>
             
                <div class="form-group">
                    <label class="labels">Digite una Contraseña:</label>
                    <input type="password" id="password" class="form-control" name="password" placeholder="Digite la Contraseña" required Style =" width: 75%; outline: none; border: none; border-bottom: solid #51585e">
                </div>
             <div class="form-group">
                    <label class="labels">Confirme la Contraseña:</label>
                    <input type="password" id="confirmPassword"  class="form-control" name="confirmPassword" placeholder="Digite la Contraseña" required Style =" width: 75%; outline: none; border: none; border-bottom: solid #51585e">
                </div>
             <div style="float: left">
                 <button type="submit" class="btn btn-primary">Guardar</button>
             </div>
                
                 
                <div Style ="display: inline-block; margin-left: 10px; width: 70%; ">
                    <select class="form-control" name="txtTypeEmploye" required Style ="width: 30%; margin-top: 0px">
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
