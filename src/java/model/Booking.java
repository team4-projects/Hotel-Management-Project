package model ;
import java.sql.*;

public class Booking {
    private int idBooking;
    private int idUser;
    private int idRoom;
    private Date checkInDate;
    private Date checkOutDate;

    public Booking(int idUser, int idRoom, Date checkInDate, Date checkOutDate) {
        this.idUser = idUser;
        this.idRoom = idRoom;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }

    public Booking(int idBooking, int idUser, int idRoom, Date checkInDate, Date checkOutDate) {
        this.idBooking = idBooking;
        this.idUser = idUser;
        this.idRoom = idRoom;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }
    
    

    public int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(int idRoom) {
        this.idRoom = idRoom;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    @Override
    public String toString() {
        return "Booking{" + "idBooking=" + idBooking + ", idUser=" + idUser + ", idRoom=" + idRoom + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + '}';
    }

    public Booking() {
    }

   
}
