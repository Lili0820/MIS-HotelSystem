package nju.adrien.service.impl;

import nju.adrien.enums.BookState;
import nju.adrien.enums.RoomType;
import nju.adrien.enums.SearchType;
import nju.adrien.model.Book;
import nju.adrien.model.HotelPlan;
import nju.adrien.repository.BookRepository;
import nju.adrien.repository.HotelPlanRepository;
import nju.adrien.service.BookService;
import nju.adrien.service.HotelAnalyseService;
import nju.adrien.service.HotelService;
import nju.adrien.util.DateHelper;
import nju.adrien.vo.add.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by CLL on 18/5/16.
 */
public class HotelAnalyseServiceImpl implements HotelAnalyseService {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    HotelService hotelService;
    @Autowired
    BookService bookService;
    @Autowired
    HotelPlanRepository hotelPlanRepository;
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");


    @Override
    public OrderStatisticInfo getBookStatisticInfo(String hId, SearchType type, Date date) {
        List<Book> bookList=null;
        List<String> dateList=new ArrayList<>();
        List<Integer> largeBookNums=new ArrayList<>();
        List<Integer> doubleBookNums=new ArrayList<>();
        List<Integer> suiteBookNums=new ArrayList<>();
        int totalNum=0;
        switch (type) {
            case DAY:
                dateList.add(simpleDateFormat.format(date));
                bookList = bookRepository.findByHotelDate(hId, date, date);
                break;
            case WEEK:
                //获取一周前的date
                for (Date i = DateHelper.getDateLastWeek(date); !i.after(date); i = DateHelper.getNextDate(i)) {
                    dateList.add(simpleDateFormat.format(i));
                    totalNum=getEveryDayOrderNum(totalNum,hId,i,largeBookNums,doubleBookNums,suiteBookNums);
                }
                break;
            case MONTH:
                //获得一个月前的日期
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);
                calendar.add(Calendar.MONTH, -1);
                for (Date i = DateHelper.getDateLastMonth(date); !i.after(date); i = DateHelper.getNextDate(i)) {
                    dateList.add(simpleDateFormat.format(i));
                    totalNum=getEveryDayOrderNum(totalNum,hId,i,largeBookNums,doubleBookNums,suiteBookNums);
                }
                List<Integer> largeTempList=new ArrayList<>();
                List<Integer> doubleTempList=new ArrayList<>();
                List<Integer> suiteTempList=new ArrayList<>();
                //每隔五天计算一下订单数
                final int GAP=5;
                for(int i=0;i<largeBookNums.size();i=i+GAP){
                    int largeTemp=0;
                    int doubleTemp=0;
                    int suiteTemp=0;
                    for(int j=i;j<i+GAP;j++){
                        largeTemp=largeTemp+largeBookNums.get(j);
                        doubleTemp=doubleTemp+doubleBookNums.get(j);
                        suiteTemp=suiteTemp+suiteBookNums.get(j);
                    }
                    largeTempList.add(largeTemp);
                    doubleTempList.add(doubleTemp);
                    suiteTempList.add(suiteTemp);
                }
                largeBookNums=largeTempList;
                doubleBookNums=doubleTempList;
                suiteBookNums=suiteTempList;
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
            switch (RoomType.valueOf(book.getRoomtype())) {
                case LARGE:
                    largeNum++;
                    if (book.getState().equals(BookState.CANCEL.toString())) {
                        largeCancel++;
                    }
                    break;
                case DOUBLE:
                    doubleNum++;
                    if (book.getState().equals(BookState.CANCEL.toString())) {
                        doubleCancel++;
                    }
                    break;
                case SUITE:
                    suiteNum++;
                    if (book.getState().equals(BookState.CANCEL.toString())) {
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
    public IncomeStatisticInfo getIncomeStatisticInfo(String hId,SearchType type, Date date) {
        int incomeTotal=0;
        List<String> dateList=new ArrayList<>();
        List<Integer> largeIncome=new ArrayList<>();
        List<Integer> doubleIncome=new ArrayList<>();
        List<Integer> suiteIncome=new ArrayList<>();
        switch (type){

            case MONTH:
                //获得一个月前的日期
                for (Date i =DateHelper.getDateLastMonth(date); !i.after(date); i = DateHelper.getNextDate(i)) {
                    dateList.add(simpleDateFormat.format(i));
                    incomeTotal=getEveryDayIncome(incomeTotal,hId,i,largeIncome,doubleIncome,suiteIncome);
                }
                break;
            case WEEK:
                //获取一周前的date
                for (Date i = DateHelper.getDateLastWeek(date); !i.after(date); i = DateHelper.getNextDate(i)) {
                    dateList.add(simpleDateFormat.format(i));
                    incomeTotal=getEveryDayIncome(incomeTotal,hId,i,largeIncome,doubleIncome,suiteIncome);
                }
                break;
            case DAY:
                dateList.add(simpleDateFormat.format(date));
                break;
        }
        List<List<Integer>> incomes=new ArrayList<>();
        incomes.add(largeIncome);
        incomes.add(doubleIncome);
        incomes.add(suiteIncome);

        IncomeStatisticInfo incomeStatisticInfo=new IncomeStatisticInfo(dateList,incomeTotal,incomes);
        return incomeStatisticInfo;
    }

    private int getEveryDayIncome(int totalIncome,String hId,Date date,List<Integer> largeIncomeList,List<Integer> doubleIncomeList,List<Integer> suiteIncomeList){
        List<Book> bookList = bookRepository.findByHotelDate(hId, date);
        int largeIncome=0;
        int doubleIncome=0;
        int suiteIncome=0;
        for (Book book : bookList) {
            totalIncome= (int) (totalIncome+Math.abs(book.getPay()));
            switch (RoomType.valueOf(book.getRoomtype())) {
                case LARGE:
                    largeIncome= (int) (largeIncome+Math.abs(book.getPay()));
                    break;
                case DOUBLE:
                    doubleIncome= (int) (doubleIncome+Math.abs(book.getPay()));
                    break;
                case SUITE:
                    suiteIncome= (int) (suiteIncome+Math.abs(book.getPay()));
                    break;
            }
        }
        return totalIncome;
    }

    @Override
    public CustomerStatisticInfo getCustomerStatisticInfo(String hId, SearchType type, Date date) {
        int customerNum=0;
        Date beginDate=date;
        switch (type){
            case MONTH:
                beginDate=DateHelper.getDateLastMonth(date);
                break;
            case WEEK:
                beginDate=DateHelper.getDateLastWeek(date);
                break;
            case DAY:
                beginDate=date;
                break;
        }
        List<String> vipIds=bookRepository.findBookVIPByHotelDate(hId,beginDate,date);
        customerNum=vipIds.size();
        int repeatNum=0;
        for (String vid:vipIds){
            if(bookRepository.findVIPBooksBeforeDate(vid,beginDate).size()>=2){
                repeatNum++;
            }
        }
        int add=customerNum-repeatNum;
        CustomerStatisticInfo customerStatisticInfo=new CustomerStatisticInfo(customerNum,add,repeatNum);
        customerStatisticInfo.setRfmAnalysisAverage(getRFMAnalysisAverage(hId));
        customerStatisticInfo.setRfmAnalysisItems(getRFMAnalysis(hId,customerStatisticInfo.getRfmAnalysisAverage()));
        return customerStatisticInfo;
    }

    private List<RFMAnalysisItem> getRFMAnalysis(String hId,RFMAnalysisAverage rfmAnalysisAverage){
        String[] strategys={"重要保持","重要发展","重要价值","重要挽留","一般重要"};
        String[] compare1={"<=","<=","<=",">","<=",">",">",">"};
        String[] compare2={">","<=","<=",">",">","<=",">","<="};
        String[] compare3={">","<=",">",">","<=",">","<=","<="};
        int[] vipNum=new int[8];
        int[] vipMoney=new int[8];
        List<String> vipIds=bookRepository.findBookVIPByHotel(hId);
        List<Book> vipBookList;
        int bookNum=0;
        int bookDay=0;
        int bookMoney=0;
        if (vipIds.size()>0) {
            for (String vid : vipIds) {
                vipBookList = bookRepository.findBookByHotelVIP(hId, vid);
                bookNum = bookNum + vipBookList.size();
                for (Book book:vipBookList){
                    bookMoney= (int) (bookMoney+Math.abs(book.getPay()));
                }
                if (vipBookList.size() > 0) {
                    bookDay = bookDay + DateHelper.getDayGap(vipBookList.get(vipBookList.size() - 1).getBooktime(),
                            new Date(System.currentTimeMillis()));
                }
                if(bookNum>rfmAnalysisAverage.getAverageOrderNum()&&bookDay<=rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()>rfmAnalysisAverage.getAveragePrice()){
                    vipNum[0]=vipNum[0]+1;
                    vipMoney[0]=vipMoney[0]+bookMoney;
                }
                else if(bookNum<=rfmAnalysisAverage.getAverageOrderNum()&&bookDay<=rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()<=rfmAnalysisAverage.getAveragePrice()){
                    vipNum[1]=vipNum[1]+1;
                    vipMoney[1]=vipMoney[1]+bookMoney;
                }
                else if(bookNum<=rfmAnalysisAverage.getAverageOrderNum()&&bookDay<=rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()>rfmAnalysisAverage.getAveragePrice()){
                    vipNum[2]=vipNum[2]+1;
                    vipMoney[2]=vipMoney[2]+bookMoney;
                }
                else if(bookNum>rfmAnalysisAverage.getAverageOrderNum()&&bookDay>rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()>rfmAnalysisAverage.getAveragePrice()){
                    vipNum[3]=vipNum[3]+1;
                    vipMoney[3]=vipMoney[3]+bookMoney;
                }
                else if(bookNum>rfmAnalysisAverage.getAverageOrderNum()&&bookDay<=rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()<=rfmAnalysisAverage.getAveragePrice()){
                    vipNum[4]=vipNum[4]+1;
                    vipMoney[4]=vipMoney[4]+bookMoney;
                }
                else if(bookNum<=rfmAnalysisAverage.getAverageOrderNum()&&bookDay>rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()>rfmAnalysisAverage.getAveragePrice()){
                    vipNum[5]=vipNum[5]+1;
                    vipMoney[5]=vipMoney[5]+bookMoney;
                }
                else if(bookNum>rfmAnalysisAverage.getAverageOrderNum()&&bookDay>rfmAnalysisAverage.getAverageDay()&&
                        bookMoney/vipBookList.size()<=rfmAnalysisAverage.getAveragePrice()){
                    vipNum[6]=vipNum[6]+1;
                    vipMoney[6]=vipMoney[6]+bookMoney;
                }
                else{
                    vipNum[7]=vipNum[7]+1;
                    vipMoney[7]=vipMoney[7]+bookMoney;
                }
            }
        }
        List<RFMAnalysisItem> rfmAnalysisItemList=new ArrayList<>();
        for(int i=0;i<strategys.length;i++){
            rfmAnalysisItemList.add(new RFMAnalysisItem(compare1[i]+rfmAnalysisAverage.getAverageDay(),
                    compare2[i]+rfmAnalysisAverage.getAverageOrderNum(),compare3[i]+rfmAnalysisAverage.getAveragePrice(),
                    vipNum[i],vipMoney[i],strategys[i]));
        }
        return rfmAnalysisItemList;
    }

    private RFMAnalysisAverage getRFMAnalysisAverage(String hId){
        List<Book> bookList=bookRepository.findByHotelId(hId);
        double averagePrice=0;
        for (Book book:bookList){
            averagePrice= averagePrice+Math.abs(book.getPay());
        }
        averagePrice=averagePrice/bookList.size();
        List<String> vipIds=bookRepository.findBookVIPByHotel(hId);
        int averageNum=0;
        int averageDay=0;
        List<Book> vipBookList;
        if (vipIds.size()>0) {
            for (String vid : vipIds) {
                vipBookList = bookRepository.findBookByHotelVIP(hId, vid);
                averageNum = averageNum + vipBookList.size();
                if (vipBookList.size() > 0) {
                    averageDay = averageDay + DateHelper.getDayGap(vipBookList.get(vipBookList.size() - 1).getBooktime(),
                            new Date(System.currentTimeMillis()));
                }
            }
            averageNum = averageNum / vipIds.size();
            averageDay = averageDay / vipIds.size();
        }
        return new RFMAnalysisAverage((int) averagePrice,averageNum,averageDay);
    }

    @Override
    public List<Double> getHotelRemarks(String hId, Date date) {
        final int MM_PER_DAY=60*60*24*1000;
        final int GAP=5;
        List<Book> bookList;
        List<Double> remarks=new ArrayList<>();
        for(Date i = DateHelper.getDateLastMonth(date); !i.after(date); i = DateHelper.getNextDate(i)){
            bookList=bookRepository.findByHotelDate(hId,i,new Date(i.getTime() + GAP*MM_PER_DAY));
            double point=5;
            for (Book book:bookList){
                point=(point+book.getPoint())/2.0;
            }
            remarks.add(point);
        }
        return remarks;
    }

    @Override
    public RoomStatisticInfo getRoomStatisticInfo(String hId, SearchType type, Date date) {
        List<HotelPlan> plans = hotelService.getAvail(hId, date);
        List<Integer> occupyNums=new ArrayList<>();
        List<Integer> noOccupyNums=new ArrayList<>();
        int largeOccupy=0;
        int doubleOccupy=0;
        int suiteOccupy=0;
        int largeNoOccupy=0;
        int doubleNoOccupy=0;
        int suiteNoOccupy=0;
        List<Book> books=null;
        for (HotelPlan plan : plans) {
            books= bookService.getBooksByPlanid(plan.getPlanid());
            switch (RoomType.valueOf(plan.getType())){
                case LARGE:
                    largeOccupy=largeOccupy+books.size();
                    largeNoOccupy=largeNoOccupy+plan.getAvailable();
                    break;
                case DOUBLE:
                    doubleOccupy=doubleOccupy+books.size();
                    doubleNoOccupy=doubleNoOccupy+plan.getAvailable();
                    break;
                case SUITE:
                    suiteOccupy=suiteOccupy+books.size();
                    suiteNoOccupy=suiteNoOccupy+plan.getAvailable();
                    break;
            }
        }
        occupyNums.add(largeOccupy);
        occupyNums.add(doubleOccupy);
        occupyNums.add(suiteOccupy);
        noOccupyNums.add(largeNoOccupy);
        noOccupyNums.add(doubleNoOccupy);
        noOccupyNums.add(suiteNoOccupy);
        double averageRate=0;
        for (int i=0;i<occupyNums.size();i++){
            averageRate=Math.floor(10000*(averageRate+occupyNums.get(i)/(double)(occupyNums.get(i)+noOccupyNums.get(i)))/2.0)/100.0;
        }
        return new RoomStatisticInfo(simpleDateFormat.format(date),occupyNums,noOccupyNums,averageRate);
    }

}
