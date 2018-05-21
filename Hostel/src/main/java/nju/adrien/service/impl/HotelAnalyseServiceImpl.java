package nju.adrien.service.impl;

import nju.adrien.model.Book;
import nju.adrien.repository.BookRepository;
import nju.adrien.repository.HotelPlanRepository;
import nju.adrien.service.HotelAnalyseService;
import nju.adrien.vo.add.IncomeStatisticInfo;
import nju.adrien.vo.add.OrderStatisticInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/**
 * Created by CLL on 18/5/16.
 */
public class HotelAnalyseServiceImpl implements HotelAnalyseService {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    HotelPlanRepository hotelPlanRepository;
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public OrderStatisticInfo getBookStatisticInfo(String hId,String type, Date date) {
        List<Book> bookList=null;
        List<String> dateList=new ArrayList<>();
        List<Integer> largeBookNums=new ArrayList<>();
        List<Integer> doubleBookNums=new ArrayList<>();
        List<Integer> suiteBookNums=new ArrayList<>();
        int totalNum=0;
        switch (type) {
            case "day":
                dateList.add(simpleDateFormat.format(date));
                bookList = bookRepository.findByHotelDate(hId, date, date);
                break;
            case "week":
                for (Date i = new Date(date.getTime() - 6 * 60 * 60 * 24*1000); !i.after(date); i = new Date(i.getTime() + 60 * 60 * 24*1000)) {
                    dateList.add(simpleDateFormat.format(i));
                    totalNum=getEveryDayOrderNum(totalNum,hId,i,largeBookNums,doubleBookNums,suiteBookNums);
                }
                break;
            case "month":
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);
                calendar.add(Calendar.MONTH, -1);
                for (Date i = new Date(calendar.getTime().getTime()); !i.after(date); i = new Date(i.getTime() + 60 * 60 * 24*1000)) {
                    dateList.add(simpleDateFormat.format(i));
                    totalNum=getEveryDayOrderNum(totalNum,hId,i,largeBookNums,doubleBookNums,suiteBookNums);
                }
                break;
            default:
                return null;
        }


        List<List<Integer>> bookNums=new ArrayList<>();
        bookNums.add(largeBookNums);
        bookNums.add(doubleBookNums);
        bookNums.add(suiteBookNums);
        OrderStatisticInfo orderStatisticInfo=new OrderStatisticInfo(totalNum,bookNums,dateList,bookList);

        return orderStatisticInfo;
    }

    private int getEveryDayOrderNum(int totalNum,String hId,Date date,List<Integer> largeBookNums,List<Integer> doubleBookNums,List<Integer> suiteBookNums){
        List<Book> bookList = bookRepository.findByHotelDate(hId, date);
        int largeNum = 0;
        int doubleNum = 0;
        int suiteNum = 0;
        int largeCancel = 0;
        int doubleCancel = 0;
        int suiteCancel = 0;
        for (Book book : bookList) {
            totalNum++;
            switch (book.getRoomtype()) {
                case "大床房":
                    largeNum++;
                    if (book.getState().equals("已取消")) {
                        largeCancel++;
                    }
                    break;
                case "标准间":
                    doubleNum++;
                    if (book.getState().equals("已取消")) {
                        doubleCancel++;
                    }
                    break;
                case "套房":
                    suiteNum++;
                    if (book.getState().equals("已取消")) {
                        suiteCancel++;
                    }
                    break;
            }
        }
        largeBookNums.add(largeNum);
        doubleBookNums.add(doubleNum);
        suiteBookNums.add(suiteNum);
        return totalNum;
    }

    @Override
    public IncomeStatisticInfo getIncomeStatisticInfo(String hId,String type, Date date) {
        return null;
    }

    @Override
    public List<Map<String, Double>> getPerRoomIncome() {
        return null;
    }

    @Override
    public List<Map<String, Double>> getRoomSpaceRates() {
        return null;
    }

    @Override
    public List<Double> getFrequentCustomerRate() {
        return null;
    }

    @Override
    public List<Double> getRegionPrices() {
        return null;
    }

    @Override
    public List<Double> getTypePrices() {
        return null;
    }
}
