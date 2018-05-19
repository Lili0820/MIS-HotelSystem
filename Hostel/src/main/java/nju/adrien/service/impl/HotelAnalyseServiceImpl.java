package nju.adrien.service.impl;

import nju.adrien.service.HotelAnalyseService;
import nju.adrien.vo.add.OrderStatisticInfo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by CLL on 18/5/16.
 */
public class HotelAnalyseServiceImpl implements HotelAnalyseService {


    @Override
    public OrderStatisticInfo getWeekBookInfo(Date date) {
        return null;
    }

    @Override
    public OrderStatisticInfo getMonthBookInfo(Date date) {
        return null;
    }

    @Override
    public OrderStatisticInfo getDayBookInfo(Date date) {
        return null;
    }

    @Override
    public List<Map<String, Double>> getPerRoomIncome() {
        return null;
    }

    @Override
    public List<Map<String, Double>> getRoomSpaceRates() {
        return null;
    }

    @Override
    public List<Double> getFrequentCustomerRate() {
        return null;
    }

    @Override
    public List<Double> getRegionPrices() {
        return null;
    }

    @Override
    public List<Double> getTypePrices() {
        return null;
    }
}
