/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class User_Food {
    private int idUser_Food;
    private int idUser ; 
    private int idFood ;
    private int quantity;
    private double sumPrice ;

    public User_Food(int idUser_Food, int idUser, int idFood, int quantity, double sumPrice) {
        this.idUser_Food = idUser_Food;
        this.idUser = idUser;
        this.idFood = idFood;
        this.quantity = quantity;
        this.sumPrice = sumPrice;
    }

    public User_Food() {
    }

    
    
    public int getIdUser_Food() {
        return idUser_Food;
    }

    public void setIdUser_Food(int idUser_Food) {
        this.idUser_Food = idUser_Food;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdFood() {
        return idFood;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(double sumPrice) {
        this.sumPrice = sumPrice;
    }

    @Override
    public String toString() {
        return "User_Food{" + "idUser_Food=" + idUser_Food + ", idUser=" + idUser + ", idFood=" + idFood + ", quantity=" + quantity + ", sumPrice=" + sumPrice + '}';
    }

    
    
    
}