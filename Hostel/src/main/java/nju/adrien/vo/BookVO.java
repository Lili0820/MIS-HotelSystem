package nju.adrien.vo;

import nju.adrien.model.Book;

import java.sql.Date;

public class BookVO {

    private String bookid;
    private String planid;
    private String vid;
    private String hid;
    private String hname;
    private String names;
    private Date date;//入住时间
    private String type;
    private double price;
    private int checkin;
    private String state;
    private Date booktime;//下单时间
    private Date updatetime;//最后操作时间
    private int point;

    public BookVO() {
    }

    public BookVO(String bookid, Date date, String type, double price, String state) {
        this.bookid = bookid;
        this.date = date;
        this.type = type;
        this.price = price;
        this.state = state;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getPlanid() {
        return planid;
    }

    public void setPlanid(String planid) {
        this.planid = planid;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCheckin() {
        return checkin;
    }

    public void setCheckin(int checkin) {
        this.checkin = checkin;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getBooktime() {
        return booktime;
    }

    public void setBooktime(Date booktime) {
        this.booktime = booktime;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    /**
     * 没有设置bookid
     *
     * @return
     */
    public Book toBook() {
        Book book = new Book();
        book.setVid(vid);
        book.setPlanid(planid);
        book.setCheckin(0);
        book.setPay(price);
        book.setNames(names);
        book.setHid(hid);
        return book;
    }

    @Override
    public String toString() {
        return "BookVO{" +
                "bookid='" + bookid + '\'' +
                ", planid='" + planid + '\'' +
                ", vid='" + vid + '\'' +
                ", hid='" + hid + '\'' +
                ", hname='" + hname + '\'' +
                ", names='" + names + '\'' +
                ", type='" + type + '\'' +
                ", date=" + date +
                ", price=" + price +
                ", checkin=" + checkin +
                ", state='" + state + '\'' +
                ", booktime=" + booktime +
                ", updatetime=" + updatetime +
                ", point=" + point +
                '}';
    }
}
