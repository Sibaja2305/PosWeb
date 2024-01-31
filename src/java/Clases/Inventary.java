/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Hp EliteBook
 */
public class Inventary {
    private int id_Product;
    private String name;
    private int rations;
    private double price;
     private int category;

    public Inventary() {
    }

    public Inventary(int id_Product, String name, int rations, double price, int category) {
        this.id_Product = id_Product;
        this.name = name;
        this.rations = rations;
        this.price = price;
        this.category = category;
    }

    public Inventary(int id_Product, String name, double price, int category) {
        this.id_Product = id_Product;
        this.name = name;
        this.price = price;
        this.category = category;
    }

    /**
     * @return the id_Product
     */
    public int getId_Product() {
        return id_Product;
    }

    /**
     * @param id_Product the id_Product to set
     */
    public void setId_Product(int id_Product) {
        this.id_Product = id_Product;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the rations
     */
    public int getRations() {
        return rations;
    }

    /**
     * @param rations the rations to set
     */
    public void setRations(int rations) {
        this.rations = rations;
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
        return "Inventary{" + "id_Product=" + id_Product + ", name=" + name + 
                ", rations=" + rations + ", price=" + price + ", category=" 
                + category + '}';
    }
    
     
   
    
    
}
