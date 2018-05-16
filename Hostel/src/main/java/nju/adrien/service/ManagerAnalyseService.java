package nju.adrien.service;

import java.util.List;

/**
 * Created by CLL on 18/5/16.
 */
public interface ManagerAnalyseService {
    /**
     * 不同区域酒店的平均收益变化(同一张图多条折线)
     * @return
     */
    public List<List<Double>>  getRegionAverageIncomes();

    /**
     * 不同星级酒店的平均收益变化
     * @return
     */
    public List<List<Double>>  getLevelAverageIncomes();

    /**
     * 每个区有几个酒店
     * @return
     */
    public List<Integer> getRegionHotelNum();

    /**
     * 每个区域酒店的平均订单交易成功率
     * @return
     */
    public List<Double> getRegionSuccessBookRates();
}
