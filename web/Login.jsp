<%-- 
    Document   : Login
    Created on : 10 ene. 2024, 15:41:09
    Author     : yorda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Página JSP</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
 
   <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        .barra-lateral {
             flex: 1;
            background-image: linear-gradient(to right,#2F51F7, #41EFF9);
            padding: 20px;
        }

        .contenido-principal {
           background-color: #ffffff;
            width: 75%;
            height: 100%;
        }
        .Title {
            text-align: center;
            color:#FF9900;
            font-family: initial;
            font-style: italic; 
            font-weight: bold;
           font-size: 70px;
        }
        .subtitle {
            font-weight: bold;
            font-size: 40px;
        }
        .labels {
            font-family: Arial;
            font-size: 24px;
        }
  
    </style>
</head>
<body>
 
    <div class="contenido-principal">
        <br>
        <div>
            <h1 class="Title">SIBAJA'S RESTAURANT</h1>
        </div>
         <div style="display: flex">
         <div style="margin-left: 30px; width: 70%">
             <div>
           <h2 class="subtitle">Iniciar Sesión</h2>
           <br> <br>
        </div>
             <form method="post" action="LoginValidation.jsp">
                <div class="form-group">
                    <label class="labels">Usuario:</label>
                    <input type="text" class="form-control" name="user" placeholder="Ingrese el usuario" required Style ="width: 75%; outline: none; border: none; border-bottom: solid #51585e" >
                </div>
             
                <div class="form-group">
                    <label class="labels">Contraseña:</label>
                    <input type="password"  class="form-control" name="password" placeholder="Ingrese la contraseña" required Style =" width: 75%; outline: none; border: none; border-bottom: solid #51585e">
                </div>
             <div style="float: left">
                 <button type="submit" class="btn btn-primary">Iniciar sesión</button>
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
             
            
             
                </div>
         <div style="float: right; margin-top: 107px">
                 <img src="image/Sibaja Chef.png" alt="Imagen principal"/>
             </div>
    </div>

    </div>

    <div class="barra-lateral">
        <div style="margin-left: 16%">
        <img src="image/logo.png" alt="Imagen de Logo"/>
    </div>
        </div>
    
</body>
