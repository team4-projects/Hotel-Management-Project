/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.*;

/**
 *
 * @author ASUS
 */
public class JDBCUtil {

    public static Connection getConnection() {
        Connection c = null;

        try {
            // Đăng ký SQL SEVER Driver với DriverManager

            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());

            // Các thông số
            String url = "jdbc:sqlserver://LAPTOP-I119IQF7\\SQLEXPRESS;databaseName=testht;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
            String username = "sa";
            String password = "123";

            // Tạo kết nối
            c = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return c;
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        JDBCUtil j = new JDBCUtil();
        if(j.getConnection() != null){
            System.out.println("Ket noi thanh cong");
        }
    }
}
