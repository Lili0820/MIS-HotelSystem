package nju.adrien.service.impl;

import nju.adrien.enums.BookState;
import nju.adrien.model.*;
import nju.adrien.repository.*;
import nju.adrien.service.BookService;
import nju.adrien.service.ProductService;
import nju.adrien.util.NumberFormater;
import nju.adrien.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.*;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private VipInfoRepository vipInfoRepository;
    @Autowired
    private VipLevelRepository vipLevelRepository;
    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private HotelInfoRepository hotelInfoRepository;
    @Autowired
    private HotelPlanRepository hotelPlanRepository;
    @Autowired
    private ProductService productService;

    @Override
    public List<BookVO> getBooksByCustomer(String vid) {
        List<Book> list = bookRepository.findByVid(vid);
        List<BookVO> vos = new ArrayList<>();
        for (Book book : list) {
            BookVO bookVO = new BookVO();
            HotelPlan plan = hotelPlanRepository.findOne(book.getPlanid());
            HotelInfo info = hotelInfoRepository.findOne(plan.getHid());

            bookVO.setBookid(book.getBookid());
            bookVO.setPlanid(book.getPlanid());
            bookVO.setVid(book.getVid());
            bookVO.setHid(plan.getHid());
            bookVO.setHname(info.getName());
            bookVO.setNames(book.getNames());
            bookVO.setDate(plan.getDate());
            bookVO.setType(plan.getType());
            bookVO.setPrice(book.getPay());
            bookVO.setCheckin(book.getCheckin());
            bookVO.setBooktime(book.getBooktime());
            bookVO.setUpdatetime(book.getUpdatetime());
            bookVO.setState(book.getState());
            bookVO.setPoint(book.getPoint());

            vos.add(bookVO);
        }
        return vos;
    }

    @Override
    public List<BookVO> getBooksByPhone(String phone) {
        VipInfo vip = vipInfoRepository.findByPhone(phone);
        if (vip == null) {
            return new ArrayList<BookVO>();
        }
        List<Book> list = bookRepository.findByVid(vip.getVid());
        List<BookVO> vos = new ArrayList<>();
        for (Book book : list) {
            BookVO bookVO = new BookVO();
            HotelPlan plan = hotelPlanRepository.findOne(book.getPlanid());
            HotelInfo info = hotelInfoRepository.findOne(plan.getHid());

            bookVO.setBookid(book.getBookid());
            bookVO.setPlanid(book.getPlanid());
            bookVO.setVid(book.getVid());
            bookVO.setHid(plan.getHid());
            bookVO.setHname(info.getName());
            bookVO.setNames(book.getNames());
            bookVO.setDate(plan.getDate());
            bookVO.setType(plan.getType());
            bookVO.setPrice(book.getPay());
            bookVO.setCheckin(book.getCheckin());
            bookVO.setBooktime(book.getBooktime());
            bookVO.setState(book.getState());
            bookVO.setPoint(book.getPoint());
            bookVO.setUpdatetime(book.getUpdatetime());

            vos.add(bookVO);
        }
        return vos;
    }

    @Override
    public List<BookVO> getBooksByPhone(String phone, String hid, Date date) {
        VipInfo vip = vipInfoRepository.findByPhone(phone);
        if (vip == null)
            return new ArrayList<>();

        List<BookVO> list = this.getBooksByCustomer(vip.getVid());
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            BookVO bookVO = (BookVO) iterator.next();
            if (!bookVO.getDate().toString().equalsIgnoreCase(date.toString()) || !bookVO.getHid().equalsIgnoreCase(hid)) {
                iterator.remove();
            }
        }
        return list;
    }

    @Override
    public List<BookVO> getAllBooks(String hid, Date date) {
        List<BookVO> vos = new ArrayList<>();
        List<Book> list = bookRepository.findAll();
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            Book book = (Book) iterator.next();
            HotelPlan plan = hotelPlanRepository.findOne(book.getPlanid());
            if (plan.getDate().toString().equalsIgnoreCase(date.toString()) && plan.getHid().equalsIgnoreCase(hid)) {
                BookVO bookVO = new BookVO();
                HotelInfo info = hotelInfoRepository.findOne(plan.getHid());

                bookVO.setBookid(book.getBookid());
                bookVO.setPlanid(book.getPlanid());
                bookVO.setVid(book.getVid());
                bookVO.setHid(plan.getHid());
                bookVO.setHname(info.getName());
                bookVO.setNames(book.getNames());
                bookVO.setDate(plan.getDate());
                bookVO.setType(plan.getType());
                bookVO.setPrice(book.getPay());
                bookVO.setCheckin(book.getCheckin());
                bookVO.setBooktime(book.getBooktime());
                bookVO.setState(book.getState());
                bookVO.setPoint(book.getPoint());
                bookVO.setUpdatetime(book.getUpdatetime());

                vos.add(bookVO);
            }
        }

        return vos;
    }

    /**
     * 预定时直接支付
     * @param book
     * @return
     */
    @Override
    public synchronized Map<String, Object> payBook(BookVO book) {
        Map<String, Object> map = new HashMap<>();

        VipInfo vipInfo = vipInfoRepository.findOne(book.getVid());
        VipLevel level = vipLevelRepository.findOne(book.getVid());

        if (!"valid".equalsIgnoreCase(vipInfo.getState())) {
            map.put("success", false);
            map.put("error", "账户冻结！");
        } else if (level.getBalance() < book.getPrice()) {
            map.put("success", false);
            map.put("error", "账户余额不足！");
        } else if (!productService.subPlan(book.getPlanid())) {
            //房源不足
            map.put("success", false);
            map.put("error", "房源不足！");
        } else {
            map.put("success", true);
            //会员余额
            level.setBalance(level.getBalance() - book.getPrice());
            level.setIntegration(level.getIntegration() + book.getPrice());
            level.setPoint(level.getPoint() + (int) book.getPrice());
            vipLevelRepository.saveAndFlush(level);
            //新的订单
            Book model = book.toBook();
            model.setBookid(NumberFormater.formatLongId(NumberFormater.string2Integer(bookRepository.getMaxBookid()) + 1));
            model.setState(BookState.PAID.toString());
            model.setUpdatetime(new Date(System.currentTimeMillis()));
            model.setBooktime(new Date(System.currentTimeMillis()));
            HotelPlan plan = hotelPlanRepository.findOne(book.getPlanid());
            model.setRoomtype(plan.getType());
            bookRepository.saveAndFlush(model);
        }
        return map;
    }

    /**
     * 入住时现金支付
     * @param book
     * @return
     */
    @Override
    public Map<String, Object> bookCash(BookVO book) {
        Map<String, Object> map = new HashMap<>();

        if (!productService.subPlan(book.getPlanid())) {
            //房源不足
            map.put("success", false);
            map.put("error", "房源不足！");
        } else {
            map.put("success", true);
            //新的订单
            Book model = book.toBook();
            model.setState(BookState.NO_PAY.toString());
            model.setPay(-1 * model.getPay());
            model.setBookid(NumberFormater.formatLongId(NumberFormater.string2Integer(bookRepository.getMaxBookid()) + 1));
            model.setUpdatetime(new Date(System.currentTimeMillis()));
            model.setBooktime(new Date(System.currentTimeMillis()));
            HotelPlan plan = hotelPlanRepository.findOne(book.getPlanid());
            model.setRoomtype(plan.getType());
            bookRepository.saveAndFlush(model);
        }
        return map;
    }

    @Override
    public synchronized Map<String, Object> cancelBook(String bookid) {
        Map<String, Object> map = new HashMap<>();
        Book book = bookRepository.findOne(bookid);
        double money = book.getPay();

        VipLevel level = vipLevelRepository.findOne(book.getVid());
        //房源+1
        productService.addPlan(book.getPlanid());
        //反钱
        if (money > 0) {
            level.setBalance(level.getBalance() + money);
            //积分，消费总金额
            level.setPoint(level.getPoint() - (int) money);
            level.setIntegration(level.getIntegration() - money);
            vipLevelRepository.saveAndFlush(level);
        }

        book.setState(BookState.CANCEL.toString());
        book.setUpdatetime(new Date(System.currentTimeMillis()));
        bookRepository.saveAndFlush(book);

        map.put("success", true);
        return map;
    }

    @Override
    public Map<String, Object> remarkBook(String bookId, int remark) {
        Map<String, Object> map = new HashMap<>();
        Book book = bookRepository.findOne(bookId);
        if(book==null){
            map.put("error","No such booking");
            return map;
        }
        HotelPlan hotelPlan=hotelPlanRepository.findOne(book.getPlanid());
        if(hotelPlan==null){
            map.put("error","No such plan");
            return map;
        }
        HotelInfo hotel=hotelInfoRepository.findOne(hotelPlan.getHid());
        hotel.setPoint((remark+hotel.getPoint())/2.0);
        book.setPoint(remark);
        book.setState(BookState.REMARKED.toString());
        book.setUpdatetime(new Date(System.currentTimeMillis()));
        bookRepository.saveAndFlush(book);
        map.put("success",true);
        return map;
    }

    @Override
    public List<Book> getBooksByPlanid(String planid) {
        return bookRepository.findByPlanid(planid);
    }

}
