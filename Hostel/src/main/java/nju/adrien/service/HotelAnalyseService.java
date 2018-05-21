package nju.adrien.service;

import nju.adrien.vo.add.IncomeStatisticInfo;
import nju.adrien.vo.add.OrderStatisticInfo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by CLL on 18/5/16.
 */
public interface HotelAnalyseService {
    /**
     * 获得订单的统计信息
     * @return
     */
    public OrderStatisticInfo getBookStatisticInfo(String hId,String type, Date date);


    /**
     * 获得收益统计信息
     * @return
     */
    public IncomeStatisticInfo getIncomeStatisticInfo(String hId,String type,Date date);

    /**
     * 获得近一周不同类型客房的净收入（表格）
     * @return
     */
    public List<Map<String,Double>> getPerRoomIncome();

    /**
     * 获得近一周不同类型客房的闲置率
     * @return
     */
    public List<Map<String,Double>> getRoomSpaceRates();

    /**
     * 近一年每个月的顾客回头率变化（折线图）
     * @return
     */
    public List<Double> getFrequentCustomerRate();

    /**
     * 同区域的酒店价格分布（散点图）  平均值放最后
     * @return
     */
    public List<Double> getRegionPrices();

    /**
     * 同房型的价格分布（柱状图  区间0-200 200-300  300-500  500－1000 1000+）  平均值放最后
     * @return
     */
    public List<Double> getTypePrices();
}
