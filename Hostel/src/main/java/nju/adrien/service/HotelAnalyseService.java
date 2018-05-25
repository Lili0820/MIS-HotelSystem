package nju.adrien.service;

import nju.adrien.enums.SearchType;
import nju.adrien.vo.add.CustomerStatisticInfo;
import nju.adrien.vo.add.IncomeStatisticInfo;
import nju.adrien.vo.add.OrderStatisticInfo;
import nju.adrien.vo.add.RoomStatisticInfo;

import java.sql.Date;
import java.util.List;

/**
 * Created by CLL on 18/5/16.
 */
public interface HotelAnalyseService {
    /**
     * 获得订单的统计信息
     * @return
     */
    public OrderStatisticInfo getBookStatisticInfo(String hId, SearchType type, Date date);


    /**
     * 获得收益统计信息
     * @return
     */
    public IncomeStatisticInfo getIncomeStatisticInfo(String hId,SearchType type,Date date);

    /**
     * 顾客统计信息
     * @param hId
     * @param type
     * @param date
     * @return
     */
    public CustomerStatisticInfo getCustomerStatisticInfo(String hId, SearchType type, Date date);

    /**
     * 获得近一个月评分变化
     * @param hId
     * @return
     */
    public List<Double> getHotelRemarks(String hId, Date date);

    /**
     * 客房利用情况
     * @param hId
     * @param type
     * @param date
     * @return
     */
    public RoomStatisticInfo getRoomStatisticInfo(String hId,SearchType type,Date date);
}
