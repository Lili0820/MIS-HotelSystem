package nju.adrien.vo;

/**
 * Created by CLL on 18/5/24.
 */
public class RFMAnalysisItem {
    private String lastOrderTime;
    private String orderNum;
    private String perOrderPrice;
    private int totalMoney;
    private int customerNum;
    private String strategy;

    public RFMAnalysisItem(String lastOrderTime, String orderNum, String perOrderPrice, int totalMoney, int customerNum, String strategy) {
        this.lastOrderTime = lastOrderTime;
        this.orderNum = orderNum;
        this.perOrderPrice = perOrderPrice;
        this.totalMoney = totalMoney;
        this.customerNum = customerNum;
        this.strategy = strategy;
    }


    public String getLastOrderTime() {
        return lastOrderTime;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public String getPerOrderPrice() {
        return perOrderPrice;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public int getCustomerNum() {
        return customerNum;
    }

    public String getStrategy() {
        return strategy;
    }
}
