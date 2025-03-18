/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.JDBCUtil;
import java.util.ArrayList;
import model.Room;
import java.sql.*;
/**
 *
 * @author ASUS
 */
public class RoomDAO implements DaoInterface<Room> {

    @Override
    public int insert(Room t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(Room t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(Room t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Room> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Room selectByIdRoom(int idRoom) {
        Room result = null;
        try {
            // Kết nối đến DB
            Connection connection = JDBCUtil.getConnection();

            // Câu lệnh SQL tìm phòng theo id
            String sql = "SELECT * FROM Room WHERE idRoom = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, idRoom);

            // Thực thi query
            ResultSet rs = statement.executeQuery();

            // Lấy dữ liệu nếu có kết quả
            if (rs.next()) {
                int idRoom1 = rs.getInt("idRoom");
                String nameRoom = rs.getString("nameRoom");
                double price = rs.getDouble("price");

                // Tạo đối tượng Room từ dữ liệu
                result = new Room(idRoom1, price, nameRoom);
            }

            // Đóng kết nối
            rs.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public ArrayList<Room> selectByCondition(String condition) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Room selectById(Room t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
