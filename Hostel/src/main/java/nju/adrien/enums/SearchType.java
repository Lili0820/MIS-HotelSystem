package nju.adrien.enums;

/**
 * 查询范围
 * Created by CLL on 18/5/24.
 */
public enum SearchType {
    MONTH("month"),
    WEEK("week"),
    DAY("day");

    private String name;


    SearchType(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
