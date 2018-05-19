package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
public class IncomeStatisticInfo {
    List<String> dates;
    int incomeTotal;
    List<List<Integer>> incomes;
    List<GoalInfo> goalInfoList;
    List<Integer> incomeSources;//线上 线下 订单  手续费
}
