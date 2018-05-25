package nju.adrien.vo.add;

/**
 * Created by CLL on 18/5/25.
 */
public class RFMAnalysisAverage {
    int averagePrice;//平均价格
    int averageOrderNum;//平均订单数
    int averageDay;//平均几天前

    public RFMAnalysisAverage(int averagePrice, int averageOrderNum, int averageDay) {
        this.averagePrice = averagePrice;
        this.averageOrderNum = averageOrderNum;
        this.averageDay = averageDay;
    }

    public int getAveragePrice() {
        return averagePrice;
    }

    public int getAverageOrderNum() {
        return averageOrderNum;
    }

    public int getAverageDay() {
        return averageDay;
    }
}
