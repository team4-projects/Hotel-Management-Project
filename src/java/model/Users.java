/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Users {
    private int idUser ; 
    private String name ;
    private String passWord ; 
    private String email ; 
    private String phone ; 
    private int idRole ; 

    public Users() {
    }

    public Users(int idUser, String name, String passWord, String email, String phone, int idRole) {
        this.idUser = idUser;
        this.name = name;
        this.passWord = passWord;
        this.email = email;
        this.phone = phone;
        this.idRole = idRole;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    @Override
    public String toString() {
        return "Users{" + "idUser=" + idUser + ", name=" + name + ", passWord=" + passWord + ", email=" + email + ", phone=" + phone + ", idRole=" + idRole + '}';
    }
    
    
}