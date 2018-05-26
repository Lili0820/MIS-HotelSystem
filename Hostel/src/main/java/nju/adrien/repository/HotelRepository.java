package nju.adrien.repository;

import nju.adrien.model.Hotel;
import nju.adrien.model.HotelInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by JiachenWang on 2017/3/7.
 */
public interface HotelRepository extends JpaRepository<Hotel, String> {

    @Query("select a from Hotel a where a.name like ?1 or a.location like ?1")
    List<Hotel> findByKey(String key);

    @Query("select a from Hotel a where a.region=?1")
    List<Hotel> getHotelByRegion(String region);
}
