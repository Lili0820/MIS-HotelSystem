package nju.adrien.service;

import nju.adrien.enums.SearchType;
import nju.adrien.vo.add.HotelStatisticInfo;
import nju.adrien.vo.add.ManagerIncomeAnalysisInfo;
import nju.adrien.vo.add.ManagerVIPAnalysisInfo;

import java.sql.Date;

/**
 * Created by CLL on 18/5/16.
 */
public interface ManagerAnalyseService {
    /**
     * 网站区域收益分析
     * @return
     */
    public ManagerIncomeAnalysisInfo getIncomeStatistics(Date date, SearchType type);

    /**
     * 网站酒店分析
     * @return
     */
    public HotelStatisticInfo getHotelStatistics();

    /**
     * 网站会员分析
     * @return
     */
    public ManagerVIPAnalysisInfo getVIPStatistics(String region);
}
