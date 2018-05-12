package com.eventbooking.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    static SimpleDateFormat simpleDateFormat = new SimpleDateFormat();

    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String formatT(Date date) {
        if (date == null) {
            return null;
        }
        return format(date, "yyyy-MM-dd HH:mm:ss").replace(" ", "T");
    }


    public static Date getDate(String date, String format) throws ParseException {
        return new SimpleDateFormat(format).parse(date);
    }

    public static Date getH5Date(String date) throws ParseException {
        return getDate(date.replace("T", " "), "yyyy-MM-dd HH:mm");
    }


    public static void main(String[] args) {
        String s = format(new Date(), "yyyy-MM-dd HH:mm:ss");
        System.out.println(s);
    }

}
