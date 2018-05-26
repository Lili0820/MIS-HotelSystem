package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/25.
 */
public class ManagerVIPAnalysisInfo {
    private List<String> regions;
    private List<Integer> customerNums;
    private List<RFMAnalysisItem> rfmAnalysisItems;
    private RFMAnalysisAverage rfmAnalysisAverage;

    public ManagerVIPAnalysisInfo() {
    }

    public List<String> getRegions() {
        return regions;
    }

    public void setRegions(List<String> regions) {
        this.regions = regions;
    }

    public List<Integer> getCustomerNums() {
        return customerNums;
    }

    public void setCustomerNums(List<Integer> customerNums) {
        this.customerNums = customerNums;
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
}
