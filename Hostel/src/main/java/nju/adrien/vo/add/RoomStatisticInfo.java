package nju.adrien.vo.add;

import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
public class RoomStatisticInfo {
    String date;
    List<Integer> occupys;//大床房 标准间 套房
    List<Integer> noOccupys;//大床房 标准间 套房
    double averageRate;

    public RoomStatisticInfo(String date, List<Integer> occupys, List<Integer> noOccupys, double averageRate) {
        this.date = date;
        this.occupys = occupys;
        this.noOccupys = noOccupys;
        this.averageRate = averageRate;
    }
}
