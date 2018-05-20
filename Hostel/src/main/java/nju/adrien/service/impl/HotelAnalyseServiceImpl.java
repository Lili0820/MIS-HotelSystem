package nju.adrien.service.impl;

import nju.adrien.model.Book;
import nju.adrien.repository.BookRepository;
import nju.adrien.repository.HotelPlanRepository;
import nju.adrien.service.HotelAnalyseService;
import nju.adrien.vo.add.IncomeStatisticInfo;
import nju.adrien.vo.add.OrderStatisticInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.util.ArrayList;
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

    @Override
    public OrderStatisticInfo getBookStatisticInfo(String hId,String type, Date date) {
        List<Book> bookList=null;
        List<Date> dateList=new ArrayList<>();
        switch (type){
            case "day":
                dateList.add(date);
                bookList=bookRepository.findByHotelDate(hId,date,date);
                break;
            case "week":
                for(Date i=new Date(date.getTime()-6*60*60*24);!i.after(date);i=new Date(i.getTime()+60*60*24)){
                    dateList.add(i);
                }
                bookList=bookRepository.findByHotelDate(hId,dateList.get(0),date);
                break;
            case "month":
                for(Date i=new Date(date.getTime()-30*60*60*24);!i.after(date);i=new Date(i.getTime()+60*60*24)){
                    dateList.add(i);
                }
                bookList=bookRepository.findByHotelDate(hId,dateList.get(0),date);
                break;
            default:
                return null;
        }
        int totalNum=0;
        int largeNum=0;
        int doubleNum=0;
        int suiteNum=0;
        int largeCancel=0;
        int doubleCancel=0;
        int suiteCancel=0;
        for(Book book:bookList){
            totalNum++;
            switch (book.getRoomtype()){
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
        return null;
    }

    @Override
    public IncomeStatisticInfo getIncomeStatisticInfo(String type, Date date) {
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
