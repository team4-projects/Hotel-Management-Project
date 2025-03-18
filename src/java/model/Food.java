/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Food {
    private int idFood ; 
    private float price ; 
    private String nameFood ;
    private String description ; 

    public Food(int idFood, float price, String nameFood, String description) {
        this.idFood = idFood;
        this.price = price;
        this.nameFood = nameFood;
        this.description = description;
    }

    public Food() {
    }

    
    
    public int getIdFood() {
        return idFood;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNameFood() {
        return nameFood;
    }

    public void setNameFood(String nameFood) {
        this.nameFood = nameFood;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Food{" + "idFood=" + idFood + ", price=" + price + ", nameFood=" + nameFood + ", description=" + description + '}';
    }
    
    
}