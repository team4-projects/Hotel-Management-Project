/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.JDBCUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User_Food;
import model.Users;

/**
 *
 * @author ASUS
 */
public class User_FoodDAO implements DaoInterface<User_Food> {

    @Override
    public int insert(User_Food t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO Customer_Food (idUser, idFood, quantity,sumPrice) "
                    + " VALUES (?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t.getIdUser());
            st.setInt(2, t.getIdFood());
            st.setInt(3, t.getQuantity());
            st.setDouble(4, t.getSumPrice());

            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int update(User_Food t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(User_Food t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "DELETE from Customer_Food "
                    + " WHERE idUser_Food=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t.getIdUser_Food());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public ArrayList<User_Food> selectAll() {
        ArrayList ketQua = new ArrayList();
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Customer_Food";
            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                int idUser_Food = rs.getInt("idUser_Food");
                int idUser = rs.getInt("idUser");
                int idFood = rs.getInt("idFood");
                int quantity = rs.getInt("quantity");
                double sumPrice = rs.getDouble("sumPrice");

                User_Food uf = new User_Food(idUser_Food, idUser, idFood, quantity, sumPrice);
                ketQua.add(uf);
            }

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public User_Food selectById(User_Food t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User_Food> selectByCondition(String condition) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        User_FoodDAO ufd = new User_FoodDAO();
        User_Food uf = new User_Food();
        uf.setIdUser(1);
        uf.setIdFood(1);
        uf.setQuantity(1);
        uf.setSumPrice(50000.3321f);
        System.out.println(ufd.insert(uf));
    }
}
