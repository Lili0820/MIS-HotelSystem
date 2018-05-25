package nju.adrien.enums;

/**
 * Created by CLL on 18/5/24.
 */
public enum RoomType {
    LARGE("大床房"),
    DOUBLE("标准间"),
    SUITE("套房");

    private String name;


    RoomType(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
