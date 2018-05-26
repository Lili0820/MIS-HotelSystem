package nju.adrien.controller;

import nju.adrien.vo.add.RFMAnalysisItem;
import nju.adrien.vo.add.RegionIncomeRankItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by CLL on 18/5/24.
 */
@Controller
public class ManagerStatisticController {
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    @RequestMapping(value = "admin/manager/statistics/income",method = RequestMethod.GET)
    public ModelAndView incomePage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("/admin/managerstatistic/income_statistic");

        modelAndView.addObject("nowDate","2018-6-28");

        String[] dateArray={"'2018-6-22'","'2018-6-23'","'2018-6-24'","'2018-6-25'","'2018-6-26'","'2018-6-27'","'2018-6-28'"};
        List<String> dates= Arrays.asList(dateArray);
        modelAndView.addObject("type","week");

        modelAndView.addObject("dates",dates);

        int incomeTotal=0;
        List<Integer> incomeList=new ArrayList<>();
        for (int i = 0; i < dates.size(); i++) {
            incomeList.add((int) (Math.random()*100000));
            incomeTotal=incomeTotal+incomeList.get(i);
        }
        modelAndView.addObject("incomeList",incomeList);
        modelAndView.addObject("incomeTotal",incomeTotal);

        List<RegionIncomeRankItem> rankItems=new ArrayList<>();
        String[] regions={"鼓楼区", "玄武区", "秦淮区", "栖霞区", "江宁区", "浦口区", "建邺区"};
        for(int i=0;i<7;i++){
            rankItems.add(new RegionIncomeRankItem(incomeList.get(i),Math.floor(Math.random()*10000)/100.0,regions[i]));
        }
        rankItems.sort(new Comparator<RegionIncomeRankItem>() {
            @Override
            public int compare(RegionIncomeRankItem o1, RegionIncomeRankItem o2) {
                return o2.getIncomeTotal()-o1.getIncomeTotal();
            }
        });
        modelAndView.addObject("rankItems",rankItems);
        return modelAndView;
    }

    @RequestMapping(value = "admin/manager/statistics/income/find",method = RequestMethod.GET)
    public ModelAndView getIncomeStatistic(HttpSession session,String type,String date){
        ModelAndView modelAndView=new ModelAndView("/admin/managerstatistic/income_statistic");

        modelAndView.addObject("nowDate",date);
        modelAndView.addObject("type",type);

        if(type.equals("week")) {
            List<String> dates = new ArrayList<>();
            try {
                for (java.util.Date i = new java.util.Date(simpleDateFormat.parse(date).getTime() - 6 * 24 * 60 * 60 * 1000); !i.after(simpleDateFormat.parse(date)); i = new java.util.Date(i.getTime() + 24 * 60 * 60 * 1000)) {
                    dates.add("'" + simpleDateFormat.format(i) + "'");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates", dates);
        }
        else if(type.equals("month")){
            List<String> dates=new ArrayList<>();
            try {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(simpleDateFormat.parse(date));
                calendar.add(Calendar.MONTH, -1);
                for(java.util.Date i=calendar.getTime();!i.after(simpleDateFormat.parse(date));i=new java.util.Date(i.getTime()+5*24*60*60*1000)){
                    dates.add("'"+simpleDateFormat.format(i)+"'");
                }

            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates",dates);
        }

        int incomeTotal=0;
        List<Integer> incomeList=new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            incomeList.add((int) (Math.random()*100000));
            incomeTotal=incomeTotal+incomeList.get(i);
        }
        modelAndView.addObject("incomeList",incomeList);
        modelAndView.addObject("incomeTotal",incomeTotal);

        List<RegionIncomeRankItem> rankItems=new ArrayList<>();
        String[] regions={"鼓楼区", "玄武区", "秦淮区", "栖霞区", "江宁区", "浦口区", "建邺区"};
        for(int i=0;i<7;i++){
            rankItems.add(new RegionIncomeRankItem(incomeList.get(i),Math.floor(Math.random()*10000)/100.0,regions[i]));
        }
        rankItems.sort(new Comparator<RegionIncomeRankItem>() {
            @Override
            public int compare(RegionIncomeRankItem o1, RegionIncomeRankItem o2) {
                return o2.getIncomeTotal()-o1.getIncomeTotal();
            }
        });
        modelAndView.addObject("rankItems",rankItems);
        return modelAndView;
    }

    @RequestMapping(value = "admin/manager/statistics/vip",method = RequestMethod.GET)
    public ModelAndView vipPage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("/admin/managerstatistic/vip_statistic");
        modelAndView.addObject("region","1");
        List<RFMAnalysisItem> rfmAnalysisItems=new ArrayList<>();
        int averagePrice= (int) Math.floor((int)(Math.random()*10)*100*Math.random());
        //以系统平均值为标准
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30",">2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要保持"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要发展"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要价值"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<30",">2","<"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般重要"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般客户"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"无价值"));
        modelAndView.addObject("rfm",rfmAnalysisItems);
        List<Integer> vipNums=new ArrayList<>();
        for(int i=0;i<7;i++) {
            vipNums.add((int) (Math.random() * 50));
        }
        modelAndView.addObject("vipNums",vipNums);
        return modelAndView;
    }
    @RequestMapping(value = "admin/manager/statistics/vip/find",method = RequestMethod.GET)
    public ModelAndView getVipStatistic(HttpSession session,String region){
        ModelAndView modelAndView=new ModelAndView("/admin/managerstatistic/vip_statistic");
        modelAndView.addObject("region",region);
        List<RFMAnalysisItem> rfmAnalysisItems=new ArrayList<>();
        int averagePrice= (int) Math.floor((int)(Math.random()*10)*100*Math.random());
        //以系统平均值为标准
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30",">2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要保持"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要发展"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要价值"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"重要挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<30",">2","<"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般重要"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2",">"+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般客户"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"一般挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2","<="+averagePrice,(int)(Math.random()*20000),(int)(Math.random()*50),"无价值"));
        modelAndView.addObject("rfm",rfmAnalysisItems);
        List<Integer> vipNums=new ArrayList<>();
        for(int i=0;i<7;i++) {
            vipNums.add((int) (Math.random() * 50));
        }
        modelAndView.addObject("vipNums",vipNums);
        return modelAndView;
    }


    @RequestMapping(value = "admin/manager/statistics/hotel",method = RequestMethod.GET)
    public ModelAndView hotelPage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("/admin/managerstatistic/hotel_statistic");
        List<List<Integer>> priceList=new ArrayList<>();
        List<Integer> temp=null;
        for(int i=0;i<5;i++){
            temp=new ArrayList<>();
            for (int j=0;j<7;j++){
                temp.add((int) (Math.random()*20));
            }
            priceList.add(temp);
        }
        modelAndView.addObject("priceList",priceList);
        List<Integer> regionNum=new ArrayList<>();
        for(int j=0;j<7;j++){
            regionNum.add(priceList.get(0).get(j)+priceList.get(1).get(j)+priceList.get(2).get(j)+priceList.get(3).get(j)+priceList.get(4).get(j));
        }
        modelAndView.addObject("regionNum",regionNum);
        List<List<Integer>> levelList=new ArrayList<>();
        for(int i=0;i<3;i++){
            temp=new ArrayList<>();
            for (int j=0;j<7;j++){
                if(i==1){
                    temp.add((int) (Math.random()*(regionNum.get(j)-levelList.get(0).get(j))));
                }
                else if(i==2){
                    temp.add(regionNum.get(j)-levelList.get(1).get(j)-levelList.get(0).get(j));
                }
                else {
                    temp.add((int) (Math.random() * regionNum.get(j)));
                }
            }
            levelList.add(temp);
        }
        modelAndView.addObject("levelList",levelList);
        return modelAndView;
    }
}
