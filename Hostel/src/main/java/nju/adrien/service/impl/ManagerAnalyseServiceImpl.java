package nju.adrien.service.impl;

import nju.adrien.enums.Region;
import nju.adrien.enums.SearchType;
import nju.adrien.model.Book;
import nju.adrien.model.Hotel;
import nju.adrien.repository.BookRepository;
import nju.adrien.repository.HotelRepository;
import nju.adrien.repository.VipInfoRepository;
import nju.adrien.service.ManagerAnalyseService;
import nju.adrien.util.DateHelper;
import nju.adrien.vo.add.HotelStatisticInfo;
import nju.adrien.vo.add.ManagerIncomeAnalysisInfo;
import nju.adrien.vo.add.ManagerVIPAnalysisInfo;
import nju.adrien.vo.add.RegionIncomeRankItem;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by CLL on 18/5/16.
 */
public class ManagerAnalyseServiceImpl implements ManagerAnalyseService {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    HotelRepository hotelRepository;
    @Autowired
    VipInfoRepository vipInfoRepository;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

    private static String[] REGIONS={"鼓楼区", "玄武区", "秦淮区", "栖霞区", "江宁区", "浦口区", "建邺区"};
    @Override
    public ManagerIncomeAnalysisInfo getIncomeStatistics(Date date, SearchType type) {
        List<String> dateList=new ArrayList<>();
        List<Book> bookList=new ArrayList<>();
        List<Integer> incomeList=new ArrayList<>();
        int incomeTotal=0;
        Date beginDate;
        switch (type) {
            case WEEK:
                beginDate=DateHelper.getDateLastWeek(date);
                //获取一周前的date
                for (Date i = DateHelper.getDateLastWeek(date); !i.after(date); i = DateHelper.getNextDate(i)) {
                    dateList.add(simpleDateFormat.format(i));
                    bookList=bookRepository.findBookByDate(i);
                }
                break;
            case MONTH:
                beginDate=DateHelper.getDateLastMonth(date);
                //获得一个月前的日期
                for (Date i = DateHelper.getDateLastMonth(date); !i.after(date); i = DateHelper.getDateAfterDay(i,5)) {
                    dateList.add(simpleDateFormat.format(i));
                    bookList=bookRepository.findBookByDate(i,DateHelper.getDateAfterDay(i,5));
                }
                break;
            default:
                return null;
        }
        int incomeDay=0;
        for(Book book:bookList){
            incomeDay= (int) (incomeDay+Math.abs(book.getPay()));
        }
        incomeList.add(incomeDay);
        incomeTotal=incomeTotal+incomeDay;

        ManagerIncomeAnalysisInfo managerIncomeAnalysisInfo=new ManagerIncomeAnalysisInfo(dateList,
                incomeTotal,incomeList,getIncomeRank(beginDate,date));
        return managerIncomeAnalysisInfo;
    }

    private List<RegionIncomeRankItem> getIncomeRank(Date beginDate,Date date){
        List<Book> bookList= bookRepository.findBookByDate(beginDate,date);

        int[] income=new int[REGIONS.length];
        for (Book book:bookList){
            switch (Region.valueOf(book.getHotelInfo().getLocation())){
                case GULOU:
                    income[0]= (int) (income[0]+Math.abs(book.getPay()));
                    break;
                case XUANWU:
                    income[1]= (int) (income[1]+Math.abs(book.getPay()));
                    break;
                case QINHUAI:
                    income[2]= (int) (income[2]+Math.abs(book.getPay()));
                    break;
                case QIXIA:
                    income[3]= (int) (income[3]+Math.abs(book.getPay()));
                    break;
                case JIANGNING:
                    income[4]= (int) (income[4]+Math.abs(book.getPay()));
                    break;
                case PUKOU:
                    income[5]= (int) (income[5]+Math.abs(book.getPay()));
                    break;
                case JIANYAN:
                    income[6]= (int) (income[6]+Math.abs(book.getPay()));
                    break;
            }
        }
        List<RegionIncomeRankItem> result=new ArrayList<>();
        for (int i=0;i<REGIONS.length;i++) {
            result.add(new RegionIncomeRankItem(income[i],Math.floor(Math.random()*10000)/100.0, REGIONS[i]));
        }
        return result;
    }

    @Override
    public HotelStatisticInfo getHotelStatistics() {
        int[] prices={0,200,300,500,1000,6000};
        List<Integer> hotelNums=new ArrayList<>();
        List<Hotel> hotelList;
        List<List<Integer>> levelList=new ArrayList<>();
        List<List<Integer>> priceList=new ArrayList<>();
        for(int i=0;i<REGIONS.length;i++){
            hotelList=hotelRepository.getHotelByRegion(REGIONS[i]);
            hotelNums.add(hotelList.size());
            Integer[] levelNum=new Integer[3];
            Integer[] priceNum=new Integer[prices.length];
            for (Hotel hotel:hotelList){
                if (hotel.getLevel()<=3){
                    levelNum[0]=levelNum[0]+1;
                }
                else if(hotel.getLevel()==4){
                    levelNum[1]=levelNum[1]+1;
                }
                else{
                    levelNum[2]=levelNum[2]+1;
                }
                levelList.add(Arrays.asList(levelNum));
                for (int j=0;j<prices.length-1;j++){
                    if (hotel.getHotelPlan().iterator().next().getPrice()>=prices[j]
                            &&hotel.getHotelPlan().iterator().next().getPrice()<prices[j+1]){
                        priceNum[j]=priceNum[j]+1;
                    }
                }
                priceList.add(Arrays.asList(priceNum));
            }

        }
        return new HotelStatisticInfo(Arrays.asList(REGIONS),hotelNums,levelList,priceList);
    }

    @Override
    public ManagerVIPAnalysisInfo getVIPStatistics(String region) {
        List<Integer> customerNums=new ArrayList<>();
        for (int i=0;i<REGIONS.length;i++){
            customerNums.add(vipInfoRepository.findVIPByRegion(region).size());
        }
        ManagerVIPAnalysisInfo managerVIPAnalysisInfo=new ManagerVIPAnalysisInfo();
        managerVIPAnalysisInfo.setRegions(Arrays.asList(REGIONS));
        managerVIPAnalysisInfo.setCustomerNums(customerNums);
        return managerVIPAnalysisInfo;
    }
}
