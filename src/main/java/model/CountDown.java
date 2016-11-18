package model;

import java.util.Date;
import java.io.PrintWriter;

import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.time.Duration;

import java.text.SimpleDateFormat;
import java.text.ParseException;

public class CountDown {
  private String title;
  private String locale;
  private String time;

	/**
	* Default CountDown constructor
	*/
	public CountDown(String title, String locale, String time) {
		this.title = title;
		this.locale = locale;
		this.time = time;
	}

  public CountDown(String concat) {
    String[] tab = concat.split(",");
    this.title = tab[0];
		this.locale = tab[1];
		this.time = tab[2];
	}

	/**
	* Returns value of title
	* @return
	*/
	public String getTitle() {
		return title;
	}

	/**
	* Sets new value of title
	* @param
	*/
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	* Returns value of locale
	* @return
	*/
	public String getLocale() {
		return locale;
	}

	/**
	* Sets new value of locale
	* @param
	*/
	public void setLocale(String locale) {
		this.locale = locale;
	}

	/**
	* Returns value of time
	* @return
	*/
	public String getTime() {
		return time;
	}

	/**
	* Sets new value of time
	* @param
	*/
	public void setTime(String time) {
		this.time = time;
	}

  public String diff(){
    String pattern = "dd/MM/yyyy HH:mm:ss";
		Date date2 = null;
		try {
			date2 = new SimpleDateFormat(pattern).parse(getTime());
		} catch (ParseException e) {
			return "server error...";
		}

    LocalDateTime d2 = date2.toInstant().atZone(ZoneId.of(getLocale())).toLocalDateTime();
    LocalDateTime d1 = LocalDateTime.of(LocalDate.now(), LocalTime.now());
    Duration duration = Duration.between(d1,d2);

    long diff = duration.getSeconds();
    long diffSeconds = diff % 60;
    long diffMinutes = diff / (60) % 60;
    long diffHours = diff / (60 * 60) % 24;
    long diffDays = diff / (24 * 60 * 60);

    String str ="";
    str += diffDays+" day(s) ";
    str += diffHours+" hour(s) ";
    str+= diffMinutes+" minut(s) ";
    str+= diffSeconds+" second(s) ";
		return str;
	}

  public long diffSeconds() {
    String pattern = "dd/MM/yyyy HH:mm:ss";
		Date date2 = null;
		try {
			date2 = new SimpleDateFormat(pattern).parse(getTime());
		} catch (ParseException e) {
			return 0;
		}

    LocalDateTime d2 = date2.toInstant().atZone(ZoneId.of(getLocale())).toLocalDateTime();
    LocalDateTime d1 = LocalDateTime.of(LocalDate.now(), LocalTime.now());
    Duration duration = Duration.between(d1,d2);

    return duration.getSeconds();
  }

  public String toString() {
    return title+","+locale+","+time;
  }

}
