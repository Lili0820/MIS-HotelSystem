package nju.adrien.vo.add;

import nju.adrien.model.Book;

import java.util.List;

/**
 * Created by CLL on 18/5/18.
 */
public class OrderStatisticInfo {
    //订单量
    //订单交易成功率
    //房型分类统计
    private Integer orderTotal;
    private List<List<Integer>> orderNums;//大床房 标准间 套房
    private List<String> dates;
    private List<Double> successRates;
    private List<Double> roomSuccessRates1;//大床房
    private List<Double> roomSuccessRates2;//标准间
    private List<Double> roomSuccessRates3;//套房
    private List<Integer> cancelTime;//一日、三日、七日
    private List<Integer> cancelRoom;//大床房 标准间 套房
    private List<Book> books;

    public Integer getOrderTotal() {
        return orderTotal;
    }

    public List<List<Integer>> getOrderNums() {
        return orderNums;
    }

    public List<String> getDates() {
        return dates;
    }

    public List<Double> getSuccessRates() {
        return successRates;
    }

    public List<Double> getRoomSuccessRates1() {
        return roomSuccessRates1;
    }

    public List<Double> getRoomSuccessRates2() {
        return roomSuccessRates2;
    }

    public List<Double> getRoomSuccessRates3() {
        return roomSuccessRates3;
    }

    public List<Integer> getCancelTime() {
        return cancelTime;
    }

    public List<Integer> getCancelRoom() {
        return cancelRoom;
    }

    public List<Book> getBooks() {
        return books;
    }
}
