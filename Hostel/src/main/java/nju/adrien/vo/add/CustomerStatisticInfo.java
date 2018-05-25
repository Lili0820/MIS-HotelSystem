package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
public class CustomerStatisticInfo {
    int totalNum;
    int addNum;
    int repeatNum;
    List<RFMAnalysisItem> rfmAnalysisItems;
    RFMAnalysisAverage rfmAnalysisAverage;

    public CustomerStatisticInfo(int totalNum, int addNum, int repeatNum) {
        this.totalNum = totalNum;
        this.addNum = addNum;
        this.repeatNum = repeatNum;
    }

    public List<RFMAnalysisItem> getRfmAnalysisItems() {
        return rfmAnalysisItems;
    }

    public void setRfmAnalysisItems(List<RFMAnalysisItem> rfmAnalysisItems) {
        this.rfmAnalysisItems = rfmAnalysisItems;
    }

    public RFMAnalysisAverage getRfmAnalysisAverage() {
        return rfmAnalysisAverage;
    }

    public void setRfmAnalysisAverage(RFMAnalysisAverage rfmAnalysisAverage) {
        this.rfmAnalysisAverage = rfmAnalysisAverage;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public int getAddNum() {
        return addNum;
    }

    public int getRepeatNum() {
        return repeatNum;
    }
}
