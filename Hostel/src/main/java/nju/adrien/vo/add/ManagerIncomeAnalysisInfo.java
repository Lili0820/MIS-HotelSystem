package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/25.
 */
public class ManagerIncomeAnalysisInfo {
    private List<String> dates;
    private int incomeTotal;
    private List<Integer> incomeList;
    private List<RegionIncomeRankItem> regionIncomeRankItems;

    public ManagerIncomeAnalysisInfo(List<String> dates, int incomeTotal, List<Integer> incomeList, List<RegionIncomeRankItem> regionIncomeRankItems) {
        this.dates = dates;
        this.incomeTotal = incomeTotal;
        this.incomeList = incomeList;
        this.regionIncomeRankItems = regionIncomeRankItems;
    }

    public List<Integer> getIncomeList() {
        return incomeList;
    }

    public List<String> getDates() {
        return dates;
    }

    public int getIncomeTotal() {
        return incomeTotal;
    }

    public List<RegionIncomeRankItem> getRegionIncomeRankItems() {
        return regionIncomeRankItems;
    }
}
