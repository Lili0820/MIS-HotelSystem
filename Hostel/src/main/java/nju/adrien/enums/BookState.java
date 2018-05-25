package nju.adrien.enums;

/**
 * Created by CLL on 18/5/24.
 */
public enum BookState {
    NO_PAY("未支付"),
    PAID("已支付"),
    CANCEL("已取消"),
    CHECKED("已入住"),
    REMARKED("已评价");

    private String name;


    BookState(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
