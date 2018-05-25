package nju.adrien.enums;

/**
 * 地区
 * Created by CLL on 18/5/16.
 */
public enum Region {
    GULOU("鼓楼"),
    JIANYAN("建邺"),
    XUANWU("玄武"),
    QINHUAI("秦淮"),
    QIXIA("栖霞"),
    PUKOU("浦口"),
    JIANGNING("江宁");

    private String name;


    Region(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
