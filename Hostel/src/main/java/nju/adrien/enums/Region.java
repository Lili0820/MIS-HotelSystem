package nju.adrien.enums;

/**
 * 地区
 * Created by CLL on 18/5/16.
 */
public enum Region {
    GULOU("鼓楼区"),
    XUANWU("玄武区"),
    QINHUAI("秦淮区"),
    QIXIA("栖霞区"),
    JIANGNING("江宁区"),
    PUKOU("浦口区"),
    JIANYAN("建邺区");


    private String name;


    Region(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
