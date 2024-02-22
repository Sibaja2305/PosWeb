/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataBasemysql;

/**
 *
 * @author Hp EliteBook
 */
import Clases.Inventary;
import Clases.Order;
import Clases.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionMysql {

    // Establecer la conexión
    String bd = "world";
    String url = "jdbc:mysql://localhost:3306/";
    String usuario = "root";
    String contraseña = "Supercell07*";
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx;

    public ConnectionMysql(String bd) {
        this.bd = bd;
        cx = conectar();
    }

    /**
     * This method establishes the connection to the database.
     *
     * @return returns an instance of the Connection class that represents the
     * established connection.
     */
    public Connection conectar() {
        try {
            Class.forName(driver);
            try {
                cx = DriverManager.getConnection(url + bd, usuario, contraseña);
                System.out.println("ingreso " + bd);
            } catch (SQLException ex) {

                Logger.getLogger(ConnectionMysql.class.getName()).log(Level.SEVERE, null, ex);

            }
        } catch (ClassNotFoundException ex) {
            System.out.println("no ingreso " + bd);
            Logger.getLogger(ConnectionMysql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cx;
        

    }

    public boolean userValidation(String userName, String password, int range) throws SQLException {
        cx = conectar();
        Statement stmt = cx.createStatement();
        String consulta = "select * from usuario where Usuario ='" + userName.trim() + "' and Contraseña = '" + password.trim() + "' and Rango = " + range + ";";
        System.out.println(consulta);
        ResultSet rs = stmt.executeQuery(consulta);

        try {
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } finally {
            try {
                rs.close();
            } catch (SQLException ignore) {
                System.out.println("Exeption on login: " + ignore.getMessage());
            }
        }

    }

    public ArrayList<User> getUsers() throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM usuario;");
        ArrayList<User> users = new ArrayList<>();
        try {
            while (rs.next()) {
                int idUser = Integer.parseInt(rs.getString("ID_Usuario"));
                String reader = rs.getString("Usuario");
                String password = rs.getString("Contraseña");
                int range = Integer.parseInt(rs.getString("Rango"));

                User user = new User(idUser, reader, password, range);

                users.add(user);

            }
            return users;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }

    public boolean deleteUser(int code) {
        try {

            String query = "delete from usuario where ID_Usuario = ?";
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setInt(1, code);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }

    public boolean insertUser(String userName, String password, int range) {

        try {

            // the mysql insert statement
            String query = " insert into usuario (Usuario, Contraseña, Rango)"
                    + " values (?, ?, ? )";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setString(1, userName);
            preparedStmt.setString(2, password);
            preparedStmt.setInt(3, range);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

        return false;
    }

    public int getCantMesas() throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM cantidadmesas;");
        int cantMesas = 0;
        try {
            while (rs.next()) {
                cantMesas = Integer.parseInt(rs.getString("cant_mesas"));
                System.out.println("retorna cantidad de mesas =" + cantMesas);
            }
            return cantMesas;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "es este");
            return 0;
        } finally {
            rs.close();

        }
    }

    public boolean checkStatus() throws SQLException {
        cx = conectar();
        Statement stmt = cx.createStatement();

        String consulta = "select * from estadomesa where estado = 2;";
        System.out.println(consulta);
        ResultSet rs = stmt.executeQuery(consulta);

        try {
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } finally {
            try {
                rs.close();
            } catch (SQLException ignore) {
                System.out.println("Exeption on login: " + ignore.getMessage());
            }
        }

    }

    public void deleteTablesStatus(int diferencia) {
        try {

            String query = "DELETE FROM estadomesa ORDER BY num_mesa DESC LIMIT " + diferencia + ";";
            System.out.println(query);
            PreparedStatement preparedStmt = cx.prepareStatement(query);

            // execute the preparedstatement
            preparedStmt.execute();

        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());

        }
    }

    public void editCantMesas(int cantidad) {

        try {

            String query = "UPDATE cantidadmesas "
                    + "     SET cant_mesas = ?"
                    + "     WHERE id_cantMesas = 1;";

            PreparedStatement preparedStmt = cx.prepareStatement(query);

            preparedStmt.setInt(1, cantidad);

            // execute the preparedstatement
            preparedStmt.executeUpdate();

            cx.close();

        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());

        }
    }

    public void insertTables(int cantidad) {
        try {
            int ultimaMesa = getCantMesas();
            for (int i = 0; i < cantidad; i++) {
                ultimaMesa = ultimaMesa + 1;

                // the mysql insert statement
                String query = " insert into estadomesa (num_mesa, estado)"
                        + " values (?, ? )";

                // create the mysql insert preparedstatement
                PreparedStatement preparedStmt = cx.prepareStatement(query);

                preparedStmt.setInt(1, ultimaMesa);
                preparedStmt.setInt(2, 1);

                // execute the preparedstatement
                preparedStmt.execute();
            }

        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

    }

    public int getTableStatus(int table) throws SQLException {
        cx = conectar();
        Statement stmt = cx.createStatement();

        String consulta = "select * from estadomesa where num_mesa = " + table + ";";
        System.out.println(consulta);
        ResultSet rs = stmt.executeQuery(consulta);

        try {
            while (rs.next()) {                
                 System.out.println("antes de estado");
                int estado = Integer.parseInt(rs.getString("estado"));
                System.out.println("estado= "+estado);
               return estado;
            }
           
            
        } finally {
            try {
                rs.close();
            } catch (SQLException ignore) {
                System.out.println("Exeption on login: " + ignore.getMessage());
            }
        }
        return 0;
       
    }
    public ArrayList<Inventary> getFood() throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM inventario Where categoria = 1;");
        ArrayList<Inventary> inventaries = new ArrayList<>();
        try {
            while (rs.next()) {

                int id = Integer.parseInt(rs.getString("id_Producto"));
                String nombre = rs.getString("nombre");
                double price = Double.parseDouble(rs.getString("precio"));
                int category = Integer.parseInt(rs.getString("categoria"));

                Inventary inventary = new Inventary(id, nombre, price, category);

                inventaries.add(inventary);

            }
            return inventaries;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
           

        }
    }
    public ArrayList<Inventary> getDrink() throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM inventario Where categoria = 2;");
        ArrayList<Inventary> inventaries = new ArrayList<>();
        try {
            while (rs.next()) {

                int id = Integer.parseInt(rs.getString("id_Producto"));
                String nombre = rs.getString("nombre");
                double price = Double.parseDouble(rs.getString("precio"));
                int category = Integer.parseInt(rs.getString("categoria"));

                Inventary inventary = new Inventary(id, nombre, price, category);

                inventaries.add(inventary);

            }
            return inventaries;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }
     public boolean orderExist(int code, int table) throws SQLException {
        cx = conectar();
        Statement stmt = cx.createStatement();
        String consulta = "select * from pedido_temp where id_Producto ='" + code + "' and num_mesa = " + table + ";";
        System.out.println(consulta);
        ResultSet rs = stmt.executeQuery(consulta);

        try {
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } finally {
        }

    }
     public boolean insertOrder(int table, int idProduct, String name, int quantity, double price, String comment, int category ) {

        try {

            // the mysql insert statement
            String query = " insert into pedido_temp (num_mesa, id_producto, nombre, cantidad, precio, comentario, categoria)"
                    + " values (?, ?, ?, ?, ?, ?, ? )";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setInt(1, table);
            preparedStmt.setInt(2, idProduct);
            preparedStmt.setString(3, name);
            preparedStmt.setInt(4, quantity);
            preparedStmt.setDouble(5, price);
            preparedStmt.setString(6, comment);
            preparedStmt.setInt(7, category);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

        return false;
    }
     public ArrayList<Order> getOrder(int table) throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM pedido_temp WHERE num_mesa = '" + table + "';");
        ArrayList<Order> orders = new ArrayList<>();
        try {
            while (rs.next()) {
                int idOrder = Integer.parseInt(rs.getString("id_pedido"));
                int numTable = Integer.parseInt(rs.getString("num_mesa"));
                int idProduct = Integer.parseInt(rs.getString("id_producto"));
                 String name = rs.getString("nombre");
                int quantity = Integer.parseInt(rs.getString("cantidad"));
                double price = Double.parseDouble(rs.getString("precio"));
                String comment = rs.getString("comentario");
                
                int category = Integer.parseInt(rs.getString("categoria"));

                Order order = new Order(idOrder, numTable, idProduct, name, quantity, price, comment, category);

                orders.add(order);

            }
            return orders;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }
       public boolean deleteOrder(String idOrder) {
        try {

            String query = "delete from pedido_temp where id_pedido = ?";
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setString(1, idOrder);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }
       public boolean insertOrder(int table) {

        try {

            // the mysql insert statement
            String query = " insert into pedido (id_pedido, num_mesa, id_producto, nombre, cantidad, precio, comentario, categoria, estado) "
                    + "SELECT id_pedido, num_mesa, id_producto, nombre, cantidad, precio, comentario, categoria, 1 FROM pedido_temp WHERE num_mesa = "+table+";";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            

            // execute the preparedstatement
            preparedStmt.execute();

          
            return true;
        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

        return false;
    }
        public boolean deleteOrderTemp(int table) {
        try {

            String query = "delete from pedido_temp where num_mesa = ?";
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setInt(1, table);

            // execute the preparedstatement
            preparedStmt.execute();

           
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }
        public boolean editStateTable(int table) {

        try {

            String query = "UPDATE estadomesa "
                    + "     SET estado = 2"
                    + "     WHERE num_mesa = ?;";

            PreparedStatement preparedStmt = cx.prepareStatement(query);

            preparedStmt.setInt(1, table);

            // execute the preparedstatement
            preparedStmt.executeUpdate();

            cx.close();
         return true;
        } catch (Exception e) {
            
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;

        }
       
        
    }
        public ArrayList<Order> getViewOrder(int table) throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM pedido WHERE num_mesa = '" + table + "';");
        ArrayList<Order> orders = new ArrayList<>();
        try {
            while (rs.next()) {
                int idOrder = Integer.parseInt(rs.getString("id_pedido"));
                int idProduct = Integer.parseInt(rs.getString("id_producto"));
                 String name = rs.getString("nombre");
                int quantity = Integer.parseInt(rs.getString("cantidad"));
                double price = Double.parseDouble(rs.getString("precio"));
                String comment = rs.getString("comentario");
                int status = Integer.parseInt(rs.getString("estado"));
               

                Order order = new Order(idOrder, idProduct, name, quantity, price, comment, status);

                orders.add(order);

            }
            return orders;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }
        public ArrayList<Order> getOrderChef(int table) throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM pedido WHERE num_mesa = '" + table + "' and categoria = 1;");
        ArrayList<Order> orders = new ArrayList<>();
        try {
            while (rs.next()) {
                int idOrder = Integer.parseInt(rs.getString("id_pedido"));
                int idProduct = Integer.parseInt(rs.getString("id_producto"));
                 String name = rs.getString("nombre");
                int quantity = Integer.parseInt(rs.getString("cantidad"));
                double price = Double.parseDouble(rs.getString("precio"));
                String comment = rs.getString("comentario");
                int status = Integer.parseInt(rs.getString("estado"));
               

                Order order = new Order(idOrder, idProduct, name, quantity, price, comment, status);

                orders.add(order);

            }
            return orders;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }
        public boolean editStateOrder(int order, int newStatus) {

        try {

            String query = "UPDATE pedido "
                    + "     SET estado = "+ newStatus
                    + "     WHERE id_pedido = ?;";

            PreparedStatement preparedStmt = cx.prepareStatement(query);

            preparedStmt.setInt(1, order);

            // execute the preparedstatement
            preparedStmt.executeUpdate();

            cx.close();
         return true;
        } catch (Exception e) {
            
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;

        }
       
        
    }
}
