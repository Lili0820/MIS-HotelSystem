package nju.adrien.controller;

import nju.adrien.service.HotelService;
import nju.adrien.vo.BookVO;
import nju.adrien.vo.StatisticVO;
import nju.adrien.vo.add.GoalInfo;
import nju.adrien.vo.add.RFMAnalysisItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

/**
 * Created by CLL on 18/5/19.
 */
@Controller
public class HotelStatisticController {
    @Autowired
    private HotelService hotelService;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/admin/statistics/order",method = RequestMethod.GET)
    public ModelAndView orderPage(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/order_statistic");
        String hid = (String) session.getAttribute("hid");
        modelAndView.addObject("nowDate","2018-6-21");
        int orderTotal=334;
        String[] dateArray={"'2018-5-10'","'2018-5-17'","'2018-5-24'","'2018-5-31'","'2018-6-7'","'2018-6-14'","'2018-6-21'"};;
        List<String> dates= Arrays.asList(dateArray);

        modelAndView.addObject("type","month");

        modelAndView.addObject("orderNum",orderTotal);

        modelAndView.addObject("dates",dates);

        List<Integer> cancelTime=new ArrayList<>();
        cancelTime.add((int) (Math.random() * 20));
        cancelTime.add((int) (Math.random() * 20));
        cancelTime.add((int) (Math.random() * 20));
        int sum=cancelTime.get(0)+cancelTime.get(1)+cancelTime.get(2);//保证取消总数相同
        modelAndView.addObject("cancelTime",cancelTime);

        List<Integer> cancelRoom=new ArrayList<>();
        cancelRoom.add((int) (Math.random() * sum));
        cancelRoom.add((int) (sum*0.34));
        cancelRoom.add((sum-cancelRoom.get(0)-cancelRoom.get(1)));
        modelAndView.addObject("cancelRoom",cancelRoom);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/statistics/order/find",method = RequestMethod.GET)
    public ModelAndView getOrderStatistics(HttpSession session,String type,String date){
        System.out.println(type+" "+date);

        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/order_statistic");
        modelAndView.addObject("type",type);
        modelAndView.addObject("nowDate",date);
        if(type.equals("week")){
            List<String> dates=new ArrayList<>();
            try {
                for(java.util.Date i=new java.util.Date(simpleDateFormat.parse(date).getTime()-6*24*60*60*1000);!i.after(simpleDateFormat.parse(date));i=new java.util.Date(i.getTime()+24*60*60*1000)){
                    dates.add("'"+simpleDateFormat.format(i)+"'");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates",dates);

            int orderTotal=0;
            List<Integer> orderNumWeekLarge=new ArrayList<>();
            for(int i=0;i<7;i++) {
                orderNumWeekLarge.add((int) (Math.random() * 10));
                orderTotal=orderTotal+orderNumWeekLarge.get(i);
            }
            List<Integer> orderNumWeekDouble=new ArrayList<>();
            for(int i=0;i<7;i++) {
                orderNumWeekDouble.add((int) (Math.random() * 10));
                orderTotal=orderTotal+orderNumWeekDouble.get(i);
            }
            List<Integer> orderNumWeekSuite=new ArrayList<>();
            for(int i=0;i<7;i++) {
                orderNumWeekSuite.add((int) (Math.random() * 10));
                orderTotal=orderTotal+orderNumWeekSuite.get(i);
            }
            modelAndView.addObject("orderNumWeekLarge",orderNumWeekLarge);
            modelAndView.addObject("orderNumWeekDouble",orderNumWeekDouble);
            modelAndView.addObject("orderNumWeekSuite",orderNumWeekSuite);
            modelAndView.addObject("orderNum",orderTotal);

            List<Integer> cancelTime=new ArrayList<>();
            cancelTime.add((int) (Math.random() * 10));
            cancelTime.add((int) (Math.random() * 10));
            cancelTime.add((int) (Math.random() * 10));
            int sum=cancelTime.get(0)+cancelTime.get(1)+cancelTime.get(2);
            modelAndView.addObject("cancelTime",cancelTime);

            List<Integer> cancelRoom=new ArrayList<>();
            cancelRoom.add((int) (Math.random() * sum));
            cancelRoom.add((int) (sum*0.34));
            cancelRoom.add((sum-cancelRoom.get(0)-cancelRoom.get(1)));
            modelAndView.addObject("cancelRoom",cancelRoom);
        }
        else if(type.equals("month")){
            int orderTotal= (int) (Math.random()*300);
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

            modelAndView.addObject("orderNum",orderTotal);

            modelAndView.addObject("dates",dates);

            List<Integer> cancelTime=new ArrayList<>();
            cancelTime.add((int) (Math.random() * 20));
            cancelTime.add((int) (Math.random() * 20));
            cancelTime.add((int) (Math.random() * 20));
            int sum=cancelTime.get(0)+cancelTime.get(1)+cancelTime.get(2);//保证取消总数相同
            modelAndView.addObject("cancelTime",cancelTime);

            List<Integer> cancelRoom=new ArrayList<>();
            cancelRoom.add((int) (Math.random() * sum));
            cancelRoom.add((int) (sum*0.34));
            cancelRoom.add((sum-cancelRoom.get(0)-cancelRoom.get(1)));
            modelAndView.addObject("cancelRoom",cancelRoom);
        }
        else if(type.equals("day")){
            //TODO
            List<BookVO> bookList=new ArrayList<>();
            try {
                bookList.add(new BookVO("1",new Date(simpleDateFormat.parse(date).getTime()),"大床房",588,"未入住"));
                bookList.add(new BookVO("3",new Date(simpleDateFormat.parse(date).getTime()),"标准间",388,"已入住"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("orders",bookList);


            List<Integer> cancelTime=new ArrayList<>();
            cancelTime.add((int) (Math.random() * 5));
            cancelTime.add((int) (Math.random() * 5));
            cancelTime.add((int) (Math.random() * 5));
            int sum=cancelTime.get(0)+cancelTime.get(1)+cancelTime.get(2);
            modelAndView.addObject("cancelTime",cancelTime);

            List<Integer> cancelRoom=new ArrayList<>();
            cancelRoom.add((int) (Math.random() * sum));
            cancelRoom.add((int) (sum*0.34));
            cancelRoom.add((sum-cancelRoom.get(0)-cancelRoom.get(1)));
            modelAndView.addObject("cancelRoom",cancelRoom);
        }
        return modelAndView;
    }

    @RequestMapping(value="/admin/statistics/income",method = RequestMethod.GET)
    public ModelAndView incomePage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("admin/hotelstatistic/income_statistic");
        String hid = (String) session.getAttribute("hid");

        modelAndView.addObject("nowDate","2018-6-21");

        String[] dateArray={"'2018-5-10'","'2018-5-17'","'2018-5-24'","'2018-5-31'","'2018-6-7'","'2018-6-14'","'2018-6-21'"};
        List<String> dates= Arrays.asList(dateArray);
        modelAndView.addObject("type","week");

        modelAndView.addObject("dates",dates);

        int incomeTotal=0;
        List<Integer> incomeWeekLarge = new ArrayList<>();
        List<Integer> incomeWeekDouble = new ArrayList<>();
        List<Integer> incomeWeekSuite = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            incomeWeekLarge.add((int) (Math.random() * 15000));
            incomeTotal = incomeTotal + incomeWeekLarge.get(i);
            incomeWeekDouble.add((int) (Math.random() * 15000));
            incomeTotal = incomeTotal + incomeWeekDouble.get(i);
            incomeWeekSuite.add((int) (Math.random() * 15000));
            incomeTotal = incomeTotal + incomeWeekSuite.get(i);
        }
        modelAndView.addObject("incomeWeekLarge",incomeWeekLarge);
        modelAndView.addObject("incomeWeekDouble",incomeWeekDouble);
        modelAndView.addObject("incomeWeekSuite",incomeWeekSuite);
        modelAndView.addObject("incomeTotal",incomeTotal);

        List<GoalInfo> goals=new ArrayList<>();
        int goalTotal=0;
        int actualTotal=0;
        for(int i=0;i<dates.size();i++){
            int goal= (int) (Math.random()*15000);
            int actual= (int) (Math.random()*15000);
            goalTotal=goalTotal+goal;
            actualTotal=actualTotal+actual;
            goals.add(new GoalInfo(dates.get(i),goal,actual,Math.floor(actual*10000/(double)goal)/100.0));
        }
        goals.add(new GoalInfo("总计",goalTotal,actualTotal,Math.floor(actualTotal*10000/(double)goalTotal)/100.0));
        modelAndView.addObject("goals",goals);

        List<Integer> incomeSources=new ArrayList<>();
        incomeSources.add((int) (Math.random()*incomeTotal));
        incomeSources.add(incomeTotal-incomeSources.get(0));
        incomeSources.add((int) (Math.random()*incomeTotal));
        incomeSources.add(incomeTotal-incomeSources.get(2));
        modelAndView.addObject("incomeSource",incomeSources);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/statistics/income/find",method = RequestMethod.GET)
    public ModelAndView getIncomeStatistics(HttpSession session,String type,String date){
        ModelAndView modelAndView=new ModelAndView("admin/hotelstatistic/income_statistic");
        String hid = (String) session.getAttribute("hid");

        modelAndView.addObject("nowDate",date);

        modelAndView.addObject("type",type);

        int incomeTotal = 0;
        if(type.equals("week")) {
            List<String> dates=new ArrayList<>();
            try {
                for(java.util.Date i=new java.util.Date(simpleDateFormat.parse(date).getTime()-6*24*60*60*1000);!i.after(simpleDateFormat.parse(date));i=new java.util.Date(i.getTime()+24*60*60*1000)){
                    dates.add("'"+simpleDateFormat.format(i)+"'");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates",dates);

            List<Integer> incomeWeekLarge = new ArrayList<>();
            List<Integer> incomeWeekDouble = new ArrayList<>();
            List<Integer> incomeWeekSuite = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                incomeWeekLarge.add((int) (Math.random() * 15000));
                incomeTotal = incomeTotal + incomeWeekLarge.get(i);
                incomeWeekDouble.add((int) (Math.random() * 15000));
                incomeTotal = incomeTotal + incomeWeekDouble.get(i);
                incomeWeekSuite.add((int) (Math.random() * 15000));
                incomeTotal = incomeTotal + incomeWeekSuite.get(i);
            }
            modelAndView.addObject("incomeWeekLarge", incomeWeekLarge);
            modelAndView.addObject("incomeWeekDouble", incomeWeekDouble);
            modelAndView.addObject("incomeWeekSuite", incomeWeekSuite);
            modelAndView.addObject("incomeTotal", incomeTotal);

            List<GoalInfo> goals = new ArrayList<>();
            for (int i = 0; i < dates.size(); i++) {
                int goal = (int) (Math.random() * 15000);
                int actual = (int) (Math.random() * 15000);
                goals.add(new GoalInfo(dates.get(i), goal, actual, Math.floor(actual * 10000 / (double) goal) / 100.0));
            }
            modelAndView.addObject("goals", goals);
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

            incomeTotal=0;
            List<Integer> incomeMonthLarge = new ArrayList<>();
            List<Integer> incomeMonthDouble = new ArrayList<>();
            List<Integer> incomeMonthSuite = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                incomeMonthLarge.add((int) (Math.random() * 60000));
                incomeTotal = incomeTotal + incomeMonthLarge.get(i);
                incomeMonthDouble.add((int) (Math.random() *60000));
                incomeTotal = incomeTotal + incomeMonthDouble.get(i);
                incomeMonthSuite.add((int) (Math.random() * 60000));
                incomeTotal = incomeTotal + incomeMonthSuite.get(i);
            }
            modelAndView.addObject("incomeMonthLarge", incomeMonthLarge);
            modelAndView.addObject("incomeMonthDouble", incomeMonthDouble);
            modelAndView.addObject("incomeMonthSuite", incomeMonthSuite);
            modelAndView.addObject("incomeTotal", incomeTotal);

            List<GoalInfo> goals = new ArrayList<>();
            for (int i = 0; i < dates.size(); i++) {
                int goal = (int) (Math.random() * 60000);
                int actual = (int) (Math.random() * 60000);
                goals.add(new GoalInfo(dates.get(i), goal, actual, Math.floor(actual * 10000 / (double) goal) / 100.0));
            }
            modelAndView.addObject("goals", goals);

        }
        else if(type.equals("day")){
            incomeTotal= (int) (Math.random()*3000);
            modelAndView.addObject("incomeTotal", incomeTotal);
            //TODO
            modelAndView.addObject("orders",new ArrayList<>());
            List<GoalInfo> goals = new ArrayList<>();
            int goalIncome=(int) (Math.random()*3000);
            goals.add(new GoalInfo(date,goalIncome,incomeTotal,Math.floor(incomeTotal * 10000 / (double) goalIncome) / 100.0));
            modelAndView.addObject("goals", goals);
        }

        List<Integer> incomeSources=new ArrayList<>();
        incomeSources.add((int) (Math.random()*incomeTotal));
        incomeSources.add(incomeTotal-incomeSources.get(0));
        incomeSources.add((int) (Math.random()*incomeTotal));
        incomeSources.add(incomeTotal-incomeSources.get(2));
        modelAndView.addObject("incomeSource",incomeSources);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/statistics/customer",method = RequestMethod.GET)
    public ModelAndView customerPage(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/customer_statistic");
        modelAndView.addObject("type","month");
        modelAndView.addObject("nowDate","2018-6-21");
        int total=(int)(Math.random()*200);
        int repeat=(int)(Math.random()*total);
        modelAndView.addObject("add",(int)(Math.random()*total));
        modelAndView.addObject("total",total);
        modelAndView.addObject("repeat",repeat);
        modelAndView.addObject("rate",Math.floor(repeat * 10000 / (double) total) / 100.0);

        String[] dateArray={"'2018-5-10'","'2018-5-17'","'2018-5-24'","'2018-5-31'","'2018-6-7'","'2018-6-14'","'2018-6-21'"};
        List<String> dates= Arrays.asList(dateArray);
        modelAndView.addObject("dates",dates);

        List<Double> remarks=new ArrayList<>();
        Double[] marks={4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9};
        for(int i=0;i<dates.size();i++){
            remarks.add(marks[(int) (Math.random()*10)]);
        }
        modelAndView.addObject("remarks",remarks);

        List<RFMAnalysisItem> rfmAnalysisItems=new ArrayList<>();
        //以系统平均值为标准
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30",">2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要保持"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要发展"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要价值"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<30",">2","<300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般重要"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般客户"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"无价值"));
        modelAndView.addObject("rfm",rfmAnalysisItems);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/statistics/customer/find",method = RequestMethod.GET)
    public ModelAndView getCustomerStatistic(HttpSession session,String type,String date){
        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/customer_statistic");
        modelAndView.addObject("type",type);
        modelAndView.addObject("nowDate",date);
        int total=0;
        int repeat=0;
        List<String> dates=new ArrayList<>();
        if(type.equals("month")){
            total=(int)(Math.random()*200);
            repeat=(int)(Math.random()*total);
        }
        else if(type.equals("week")){
            total=(int)(Math.random()*80);
            repeat=(int)(Math.random()*total);
        }
        else if(type.equals("day")){
            total=(int)(Math.random()*10);
            repeat=(int)(Math.random()*total);
        }

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

        modelAndView.addObject("add",(int)(Math.random()*total));
        modelAndView.addObject("total",total);
        modelAndView.addObject("repeat",repeat);
        modelAndView.addObject("rate",Math.floor(repeat * 10000 / (double) total) / 100.0);

        modelAndView.addObject("dates",dates);

        List<Double> remarks=new ArrayList<>();
        Double[] marks={4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9};
        for(int i=0;i<dates.size();i++){
            remarks.add(marks[(int) (Math.random()*10)]);
        }
        modelAndView.addObject("remarks",remarks);

        List<RFMAnalysisItem> rfmAnalysisItems=new ArrayList<>();
        //以系统平均值为标准
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30",">2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要保持"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要发展"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30","<=2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要价值"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"重要挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem("<=30",">2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般重要"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2",">300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般客户"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30",">2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"一般挽留"));
        rfmAnalysisItems.add(new RFMAnalysisItem(">30","<=2","<=300",(int)(Math.random()*20000),(int)(Math.random()*50),"无价值"));
        modelAndView.addObject("rfm",rfmAnalysisItems);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/statistics/room",method = RequestMethod.GET)
    public ModelAndView roomPage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("admin/hotelstatistic/room_statistic");
        String hid = (String) session.getAttribute("hid");

        modelAndView.addObject("type","week");
        modelAndView.addObject("nowDate","2018-6-21");

        String[] dateArray={"'2018-5-10'","'2018-5-17'","'2018-5-24'","'2018-5-31'","'2018-6-7'","'2018-6-14'","'2018-6-21'"};
        List<String> dates=Arrays.asList(dateArray);
        modelAndView.addObject("dates",dates);

        int total= (int) (Math.random()*100);
        int occupyNum= (int) (total*Math.random());
        int noOccupyNum=total-occupyNum;
        modelAndView.addObject("average",Math.floor(10000*occupyNum/(double)total) / 100.0);

        List<Integer> occupys=new ArrayList<>();
        occupys.add((int) (occupyNum*Math.random()));
        occupys.add((int) ((occupyNum-occupys.get(0))*Math.random()));
        occupys.add(occupyNum-occupys.get(0)-occupys.get(1));
        modelAndView.addObject("occupys",occupys);

        List<Integer> noOccupys=new ArrayList<>();
        noOccupys.add((int) (noOccupyNum*Math.random()));
        noOccupys.add((int) ((noOccupyNum-noOccupys.get(0))*Math.random()));
        noOccupys.add(noOccupyNum-noOccupys.get(0)-noOccupys.get(1));
        modelAndView.addObject("noOccupys",noOccupys);

        return modelAndView;
    }

    @RequestMapping(value="/admin/statistics/room/find",method = RequestMethod.GET)
    public ModelAndView getRoomStatistic(HttpSession session,String type,String date){
        ModelAndView modelAndView=new ModelAndView("admin/hotelstatistic/room_statistic");
        String hid = (String) session.getAttribute("hid");

        modelAndView.addObject("type",type);
        modelAndView.addObject("nowDate",date);

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

        int total= (int) (Math.random()*100);
        int occupyNum= (int) (total*Math.random());
        int noOccupyNum=total-occupyNum;
        modelAndView.addObject("average",Math.floor(10000*occupyNum/(double)total) / 100.0);

        List<Integer> occupys=new ArrayList<>();
        occupys.add((int) (occupyNum*Math.random()));
        occupys.add((int) ((occupyNum-occupys.get(0))*Math.random()));
        occupys.add(occupyNum-occupys.get(0)-occupys.get(1));
        modelAndView.addObject("occupys",occupys);

        List<Integer> noOccupys=new ArrayList<>();
        noOccupys.add((int) (noOccupyNum*Math.random()));
        noOccupys.add((int) ((noOccupyNum-noOccupys.get(0))*Math.random()));
        noOccupys.add(noOccupyNum-noOccupys.get(0)-noOccupys.get(1));
        modelAndView.addObject("noOccupys",noOccupys);

        if(type.equals("day")) {
            List<StatisticVO> list = null;
            try {
                list = hotelService.getRoomStatistic(hid, new Date(simpleDateFormat.parse("2018-05-20").getTime()));
                System.out.println(hid+" "+list.size());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("list", list);
        }
        return modelAndView;
    }


    @RequestMapping(value="/admin/statistics/market",method = RequestMethod.GET)
    public ModelAndView marketPage(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/market_statistic");
        modelAndView.addObject("type","month");
        modelAndView.addObject("nowDate","2018-6-21");
        String[] dateArray={"'2018-5-10'","'2018-5-17'","'2018-5-24'","'2018-5-31'","'2018-6-7'","'2018-6-14'","'2018-6-21'"};
        List<String> dates= Arrays.asList(dateArray);
        modelAndView.addObject("dates",dates);

        modelAndView.addObject("averageRate",Math.floor(Math.random() * 10000) / 100.0);

        return modelAndView;
    }

    @RequestMapping(value="/admin/statistics/market/find",method = RequestMethod.GET)
    public ModelAndView getMarketStatistic(HttpSession session,String type,String date){
        ModelAndView modelAndView = new ModelAndView("admin/hotelstatistic/market_statistic");
        modelAndView.addObject("type",type);
        modelAndView.addObject("nowDate",date);

        if(type.equals("month")) {
            List<String> dates = new ArrayList<>();
            try {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(simpleDateFormat.parse(date));
                calendar.add(Calendar.MONTH, -1);
                for (java.util.Date i = calendar.getTime(); !i.after(simpleDateFormat.parse(date)); i = new java.util.Date(i.getTime() + 5 * 24 * 60 * 60 * 1000)) {
                    dates.add("'" + simpleDateFormat.format(i) + "'");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates", dates);
        }
        else if(type.equals("week")){
            List<String> dates=new ArrayList<>();
            try {
                for(java.util.Date i=new java.util.Date(simpleDateFormat.parse(date).getTime()-6*24*60*60*1000);!i.after(simpleDateFormat.parse(date));i=new java.util.Date(i.getTime()+24*60*60*1000)){
                    dates.add("'"+simpleDateFormat.format(i)+"'");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("dates",dates);

        }

        if(type.equals("day")){
            List<Double> rates=new ArrayList<>();
            double totalRate=0;
            for(int i=0;i<3;i++){
                rates.add(Math.floor(Math.random() * 5000) / 100.0);
                totalRate=totalRate+rates.get(i);
            }
            rates.add(Math.floor(totalRate/4*100)/100.0);
            modelAndView.addObject("rates",rates);

            modelAndView.addObject("averageRate",totalRate);
        }
        else {
            modelAndView.addObject("averageRate", Math.floor(Math.random() * 10000) / 100.0);
        }
        return modelAndView;
    }

}
