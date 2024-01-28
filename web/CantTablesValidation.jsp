

<%@page import="dataBasemysql.ConnectionMysql"%>
<%
    ConnectionMysql mysql = new ConnectionMysql("pos");
    int cantidad = Integer.parseInt(request.getParameter("CantMesas").trim());
    int cantidadAnterior = mysql.getCantMesas();
    if (mysql.checkStatus()) {
        System.out.println("no se encontro ninguna mesa ocupada");
        if (cantidad < cantidadAnterior) {
        mysql.deleteTablesStatus(cantidadAnterior - cantidad);
        mysql.editCantMesas(cantidad);
        out.println("<script>alert('Se realizo el cambio, se eliminaron "+ (cantidadAnterior-cantidad) +" mesas'); window.location.href='Admin.jsp';</script>");
            // eliminar
        }
        if (cantidad > cantidadAnterior) {
        mysql.insertTables(cantidad - cantidadAnterior);
        mysql.editCantMesas(cantidad);
         out.println("<script>alert('Se realizo el cambio, se añadieron "+ (cantidad-cantidadAnterior) +" mesas'); window.location.href='Admin.jsp';</script>");
        // insertar
        
        }
        if (cantidad == cantidadAnterior) {
      out.println("<script>alert('Cantidad igual a la existente'); window.location.href='Mesas.jsp';</script>");
        }

    } else {
        out.println("<script>alert('Existen mesas ocupadas, deben estar todas las mesas disponibles para realizar cambios'); window.location.href='Mesas.jsp';</script>");
    }

%>