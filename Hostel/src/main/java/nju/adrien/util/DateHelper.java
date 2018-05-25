package nju.adrien.util;

import java.sql.Date;
import java.util.Calendar;

/**
 * Created by CLL on 18/5/25.
 */
public class DateHelper {
    private static final int MM_PER_DAY=60*60*24*1000;//一天的毫秒数
    private static final int DAY_PER_WEEK=7;
    public static Date getDateLastWeek(Date date){
        return new Date(date.getTime() - (DAY_PER_WEEK-1) * MM_PER_DAY);
    }

    public static Date getDateLastMonth(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        return new Date(calendar.getTime().getTime());
    }

    public static Date getNextDate(Date date){
        return new Date(date.getTime() + MM_PER_DAY);
    }

    public static int getDayGap(Date date1,Date date2){
        return (int) ((date2.getTime()-date1.getTime())/MM_PER_DAY);
    }
}
