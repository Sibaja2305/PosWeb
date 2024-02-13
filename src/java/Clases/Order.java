/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author kevin solo yo trabajo
 */
public class Order {
    private int idOrder;
    private int numTable;
    private int idProduct;
    private String nombre;
    private int quantity;
    private double price;
    private String comment;
    private int category;

    public Order() {
    }

    public Order(int idOrder, int numTable, int idProduct, String nombre, int quantity, double price, String comment, int category) {
        this.idOrder = idOrder;
        this.numTable = numTable;
        this.idProduct = idProduct;
        this.nombre = nombre;
        this.quantity = quantity;
        this.price = price;
        this.comment = comment;
        this.category = category;
    }

    /**
     * @return the idOrder
     */
    public int getIdOrder() {
        return idOrder;
    }

    /**
     * @param idOrder the idOrder to set
     */
    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    /**
     * @return the numTable
     */
    public int getNumTable() {
        return numTable;
    }

    /**
     * @param numTable the numTable to set
     */
    public void setNumTable(int numTable) {
        this.numTable = numTable;
    }

    /**
     * @return the idProduct
     */
    public int getIdProduct() {
        return idProduct;
    }

    /**
     * @param idProduct the idProduct to set
     */
    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the category
     */
    public int getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(int category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Order{" + "idOrder=" + idOrder + ", numTable=" + numTable + ", idProduct=" + idProduct + ", nombre=" + nombre + ", quantity=" + quantity + ", price=" + price + ", comment=" + comment + ", category=" + category + '}';
    }
    
}
