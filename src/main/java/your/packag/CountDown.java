package your.packag;

import java.util.Date;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.text.ParseException;

public class CountDown {
  private String title;
  private String locale;
  private String time;


	/**
  * TODO: Implement default constructor
	* Default empty CountDown constructor
	*/
	public CountDown() {
    this.time = "02/11/2016 17:30:00";
	}

	/**
	* Default CountDown constructor
	*/
	public CountDown(String title, String locale, String time) {
		this.title = title;
		this.locale = locale;
		this.time = time;
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

  private String diff(){
    String pattern = "dd/MM/yyyy HH:mm:ss";
		Date d2 = null;
		try {
			d2 = new SimpleDateFormat(pattern).parse(getTime());
		} catch (ParseException e) {
			return "server error...";
		}
		Date d1 = new Date();

		long diff = d2.getTime() - d1.getTime();

		long diffSeconds = diff / 1000 % 60;
		long diffMinutes = diff / (60 * 1000) % 60;
		long diffHours = diff / (60 * 60 * 1000) % 24;
		long diffDays = diff / (24 * 60 * 60 * 1000);
		return diffDays+" jour(s) "+diffHours+" heure(s) "+diffMinutes+" minute(s) "+diffSeconds+" seconde(s)";
	}

  public String toString() {
    return diff();
  }

}
