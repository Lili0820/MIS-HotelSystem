package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/25.
 */
public class HotelStatisticInfo {
    private List<String> regions;
    private List<Integer> hotelNums;//每个区域的酒店数
    private List<List<Integer>> levelList;//酒店星级分布
    private List<List<Integer>> priceList;//酒店价格分布

    public HotelStatisticInfo(List<String> regions, List<Integer> hotelNums, List<List<Integer>> levelList, List<List<Integer>> priceList) {
        this.regions = regions;
        this.hotelNums = hotelNums;
        this.levelList = levelList;
        this.priceList = priceList;
    }

    public List<String> getRegions() {
        return regions;
    }

    public void setRegions(List<String> regions) {
        this.regions = regions;
    }

    public List<Integer> getHotelNums() {
        return hotelNums;
    }

    public void setHotelNums(List<Integer> hotelNums) {
        this.hotelNums = hotelNums;
    }

    public List<List<Integer>> getLevelList() {
        return levelList;
    }

    public void setLevelList(List<List<Integer>> levelList) {
        this.levelList = levelList;
    }

    public List<List<Integer>> getPriceList() {
        return priceList;
    }

    public void setPriceList(List<List<Integer>> priceList) {
        this.priceList = priceList;
    }
}
