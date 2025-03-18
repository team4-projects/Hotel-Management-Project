/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.JDBCUtil;
import java.sql.*;

import java.util.ArrayList;
import model.Booking;

/**
 *
 * @author ASUS
 */
public class BookingDAO implements DaoInterface<Booking> {

    @Override
    public int insert(Booking booking) {
        int result = 0;
        try {
            // Kết nối đến database
            Connection connection = JDBCUtil.getConnection();

            // Câu lệnh SQL để thêm mới Booking
            String sql = "INSERT INTO Booking (idUser, idRoom, checkInDate, checkOutDate) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Thiết lập giá trị cho các tham số
            statement.setInt(1, booking.getIdUser());
            statement.setInt(2, booking.getIdRoom());
            statement.setDate(3, booking.getCheckInDate());
            statement.setDate(4, booking.getCheckOutDate());

            // Thực thi lệnh và lấy kết quả
            result = statement.executeUpdate();

            // Đóng kết nối
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int update(Booking t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int deleteById(int idBooking) {
        int result = 0;
        try {
            // Kết nối DB
            Connection connection = JDBCUtil.getConnection();

            // Câu lệnh SQL xóa booking theo id
            String sql = "DELETE FROM Booking WHERE idBooking = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Set giá trị cho tham số
            statement.setInt(1, idBooking);

            // Thực thi và trả về kết quả
            result = statement.executeUpdate();

            // Đóng kết nối
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public ArrayList<Booking> selectAll() {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            // Kết nối đến DB
            Connection connection = JDBCUtil.getConnection();

            // Câu lệnh SQL để lấy tất cả booking
            String sql = "SELECT * FROM Booking";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Thực thi query
            ResultSet rs = statement.executeQuery();

            // Lặp qua từng dòng kết quả
            while (rs.next()) {
                int idBooking = rs.getInt("idBooking");
                int idUser = rs.getInt("idUser");
                int idRoom = rs.getInt("idRoom");
                Date checkInDate = rs.getDate("checkInDate");
                Date checkOutDate = rs.getDate("checkOutDate");

                // Tạo đối tượng Booking và thêm vào list
                Booking booking = new Booking(idBooking ,idUser, idRoom, checkInDate, checkOutDate);
                bookings.add(booking);
            }

            // Đóng kết nối
            rs.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    @Override
    public Booking selectById(Booking t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Booking> selectByCondition(String condition) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean isRoomAvailable(int roomId, Date checkIn, Date checkOut) {
        boolean available = true;
        try {
            Connection connection = JDBCUtil.getConnection();

            String sql = "SELECT * FROM Booking WHERE idRoom = ? AND (checkInDate < ? AND checkOutDate > ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, roomId);
            statement.setDate(2, checkOut);
            statement.setDate(3, checkIn);

            ResultSet resultSet = statement.executeQuery();

            // Nếu có kết quả nghĩa là đã trùng lịch
            if (resultSet.next()) {
                available = false;
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return available;
    }

    @Override
    public int delete(Booking t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
