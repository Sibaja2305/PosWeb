/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Hp EliteBook
 */
public class User {
    private int id_user;
    private String user;
    private String password;
    private int range;

    public User() {
    }

    public User(String user, String password, int range) {
        this.user = user;
        this.password = password;
        this.range = range;
    }

    public User(int id_user, String user, String password, int range) {
        this.id_user = id_user;
        this.user = user;
        this.password = password;
        this.range = range;
    }
    

    /**
     * @return the id_user
     */
    public int getId_user() {
        return id_user;
    }

    /**
     * @param id_user the id_user to set
     */
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the range
     */
    public int getRange() {
        return range;
    }

    /**
     * @param range the range to set
     */
    public void setRange(int range) {
        this.range = range;
    }

    @Override
    public String toString() {
        return "User{" + "id_user=" + id_user + ", user=" + user + ", password=" + password + ", range=" + range + '}';
    }
    
}
