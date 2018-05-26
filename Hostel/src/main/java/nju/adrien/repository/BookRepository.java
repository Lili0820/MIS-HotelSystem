package nju.adrien.repository;

import nju.adrien.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Date;
import java.util.List;

@SuppressWarnings("ALL")
public interface BookRepository extends JpaRepository<Book, String> {

    @Query("select a.bookid from Book a where bookid=(select max(bookid) from Book)")
    String getMaxBookid();

    @Query("select a from Book a where vid=?1")
    List<Book> findByVid(String vid);

    @Query("select a from Book a where a.planid = ?1 ")
    List<Book> findByPlanid(String planid);

    @Query("select a from Book a where a.hid=?1")
    List<Book> findByHotelId(String hid);

    @Query("select a from Book a where a.hid=?1 and a.booktime>=?2 and a.booktime<=?3")
    List<Book> findByHotelDate(String hid,Date date1,Date date2);

    @Query("select a from Book a where a.hid=?1 and a.booktime=?2")
    List<Book> findByHotelDate(String hid,Date date);

    @Query("select distinct a.vid from Book a where a.hid=?1 and a.booktime>=?2 and a.booktime<=?3")
    List<String> findBookVIPByHotelDate(String hid,Date date1,Date date2);

    @Query("select distinct a.vid from Book a where a.hid=?1")
    List<String> findBookVIPByHotel(String hid);

    @Query("select a from Book a where a.hid=?1 and a.vid=?2")
    List<Book> findBookByHotelVIP(String hid,String vid);

    @Query("select a from Book a where a.vid=?1 and a.booktime<?2")
    List<Book> findVIPBooksBeforeDate(String vid,Date date);

    @Query("select a from Book a where a.booktime=?1")
    List<Book> findBookByDate(Date date);

    @Query("select a from Book a where a.booktime>=?1 and a.booktime<?2")
    List<Book> findBookByDate(Date date1,Date date2);
}
