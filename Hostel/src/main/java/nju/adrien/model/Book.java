package nju.adrien.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

/**
 * Created by JiachenWang on 2017/3/7.
 */
@Entity
@Table(name = "book", schema = "hostel")
public class Book {
    private String bookid;
    private String vid;
    private String planid;
    private int checkin;
    private double pay;
    private String names;
    private String state;
    private int point;
    private Date booktime;
    private Date updatetime;
    private String roomtype;
    private String hid;

    @Id
    @Column(name = "bookid")
    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    @Column(name = "vid")
    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    @Column(name = "planid")
    public String getPlanid() {
        return planid;
    }

    public void setPlanid(String planid) {
        this.planid = planid;
    }

    @Column(name = "checkin")
    public int getCheckin() {
        return checkin;
    }

    public void setCheckin(int checkin) {
        this.checkin = checkin;
    }

    @Column(name = "pay")
    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    @Column(name = "names")
    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    @Column(name="state")
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    @Column(name="point")
    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
    @Column(name="booktime")
    public Date getBooktime() {
        return booktime;
    }

    public void setBooktime(Date booktime) {
        this.booktime = booktime;
    }

    @Column(name="updatetime")
    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    @Column(name="roomtype")
    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }
    @Column(name = "hid")
    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid='" + bookid + '\'' +
                ", vid='" + vid + '\'' +
                ", planid='" + planid + '\'' +
                ", checkin=" + checkin +
                ", pay=" + pay +
                ", names='" + names + '\'' +
                ", state='" + state + '\'' +
                ", point=" + point +
                ", booktime=" + booktime +
                ", updatetime=" + updatetime +
                ", roomtype='" + roomtype + '\'' +
                ", hid='" + hid + '\'' +
                '}';
    }
}
