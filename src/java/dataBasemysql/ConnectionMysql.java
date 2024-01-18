/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataBasemysql;

/**
 *
 * @author Hp EliteBook
 */

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        String consulta = "select * from usuario where Usuario ='" + userName.trim() + "' and Contraseña = '" + password.trim() +"' and Rango = " + range + ";";
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
    
}
