package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
public class RoomStatisticInfo {
    private String date;
    private List<Integer> occupys;//大床房 标准间 套房
    private List<Integer> noOccupys;//大床房 标准间 套房
    private double averageRate;

    public RoomStatisticInfo(String date, List<Integer> occupys, List<Integer> noOccupys, double averageRate) {
        this.date = date;
        this.occupys = occupys;
        this.noOccupys = noOccupys;
        this.averageRate = averageRate;
    }
}
