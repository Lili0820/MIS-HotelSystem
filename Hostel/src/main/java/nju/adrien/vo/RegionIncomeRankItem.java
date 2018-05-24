package nju.adrien.vo;

/**
 * Created by CLL on 18/5/24.
 */
public class RegionIncomeRankItem {
    private int incomeTotal;
    private double upRate;
    private String region;

    public RegionIncomeRankItem(int incomeTotal, double upRate, String region) {
        this.incomeTotal = incomeTotal;
        this.upRate = upRate;
        this.region = region;
    }

    public int getIncomeTotal() {
        return incomeTotal;
    }

    public double getUpRate() {
        return upRate;
    }

    public String getRegion() {
        return region;
    }
}
