package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
public class IncomeStatisticInfo {
    private List<String> dates;
    private int incomeTotal;
    private List<List<Integer>> incomes;
    private List<GoalInfo> goalInfoList;
    private List<Integer> incomeSources;//线上 线下 订单  手续费

    public IncomeStatisticInfo(List<String> dates, int incomeTotal, List<List<Integer>> incomes) {
        this.dates = dates;
        this.incomeTotal = incomeTotal;
        this.incomes = incomes;
    }

    public List<String> getDates() {
        return dates;
    }

    public void setDates(List<String> dates) {
        this.dates = dates;
    }

    public int getIncomeTotal() {
        return incomeTotal;
    }

    public void setIncomeTotal(int incomeTotal) {
        this.incomeTotal = incomeTotal;
    }

    public List<List<Integer>> getIncomes() {
        return incomes;
    }

    public void setIncomes(List<List<Integer>> incomes) {
        this.incomes = incomes;
    }

    public List<GoalInfo> getGoalInfoList() {
        return goalInfoList;
    }

    public void setGoalInfoList(List<GoalInfo> goalInfoList) {
        this.goalInfoList = goalInfoList;
    }

    public List<Integer> getIncomeSources() {
        return incomeSources;
    }

    public void setIncomeSources(List<Integer> incomeSources) {
        this.incomeSources = incomeSources;
    }
}
