/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class Room {
    private int idRoom ; 
    private double price ;
    private String nameRoom ; 


    public Room() {
    }

    public Room(int idRoom, double price, String nameRoom) {
        this.idRoom = idRoom;
        this.price = price;
        this.nameRoom = nameRoom;
    }

    @Override
    public String toString() {
        return "Room{" + "idRoom=" + idRoom + ", price=" + price + ", nameRoom=" + nameRoom + '}';
    }
    
    

    
    public int getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(int idRoom) {
        this.idRoom = idRoom;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public String getNameRoom() {
        return nameRoom;
    }

    public void setNameRoom(String nameRoom) {
        this.nameRoom = nameRoom;
    }

    
}