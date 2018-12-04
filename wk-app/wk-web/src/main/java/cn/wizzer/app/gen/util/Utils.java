package cn.wizzer.app.gen.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.MemoryCacheImageInputStream;

import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import sun.misc.BASE64Encoder;

public class Utils {

	private static Log log = LogFactory.getLog(Utils.class);

	public static boolean validateEmail(String email) {
		String regEx = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(email);
		return m.matches();
	}

	public static String md5(String message) throws Exception {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		String md5Str = base64en.encode(md5.digest(message.getBytes("UTF-8")));
		return md5Str;
	}

	public static java.sql.Date getDate() {
		return new java.sql.Date(new Date().getTime());
	}

	public static java.sql.Time getTime() {
		return new java.sql.Time(new Date().getTime());
	}

	public static Timestamp getTimestamp() {
		return new Timestamp(new Date().getTime());
	}

	public static Timestamp getTimestampZero() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, 1970);
		c.set(Calendar.MONTH, 0);
		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return new Timestamp(c.getTime().getTime());
	}

	public static Date parseDate(String dateString) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return simpleDateFormat.parse(dateString);
	}

	public static Timestamp parseTimestamp(String datetimeString)
			throws Exception {
		SimpleDateFormat simpleDatetimeSecondFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		return new Timestamp(
				(simpleDatetimeSecondFormat.parse(datetimeString).getTime()));
	}
	public static Timestamp parseTimestamp(String datetimeString,String simpleDateFormat)
			throws Exception {
		SimpleDateFormat simpleDatetimeSecondFormat = new SimpleDateFormat(
				simpleDateFormat);
		return new Timestamp(
				(simpleDatetimeSecondFormat.parse(datetimeString).getTime()));
	}
	public static String formatDatetime(Date date, String format) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(date);
	}

	public static String formatDate(Date date) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return simpleDateFormat.format(date);
	}

	public static String formatDateSeqNo(Date date) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		return simpleDateFormat.format(date);
	}

	public static String formatDatetime(Date date) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDatetimeFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm");
		return simpleDatetimeFormat.format(date);
	}

	public static String formatDatetimeSecond(Date date) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDatetimeSecondFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		return simpleDatetimeSecondFormat.format(date);
	}

	public static String formatDatetimeShort(Date date) {
		if (date == null)
			return "";
		SimpleDateFormat simpleDatetimeShortFormat = new SimpleDateFormat(
				"MM-dd HH:mm");
		return simpleDatetimeShortFormat.format(date);
	}

	public static String formatTime(Date date, String format) {
		if (date == null)
			return "";
		SimpleDateFormat simpleFormat = new SimpleDateFormat(format);
		return simpleFormat.format(date);
	}

	public static String formatPercent(double number) {
		return new DecimalFormat("###,###,###.#").format(number * 100);
	}

	/**
	 * getTimestampByString
	 * 
	 * @param value
	 *            支持三种格式"yyyy-MM-dd"、"yyyy/MM/dd"、"yyyy\MM\dd"
	 * @return
	 */
	public static Timestamp getTimestamp(String value) throws Exception {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"yyyy-MM-dd");
			Date date = simpleDateFormat.parse(value);
			return new Timestamp(date.getTime());
		} catch (ParseException e1) {
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
						"yyyy/MM/dd");
				Date date = simpleDateFormat.parse(value);
				return new Timestamp(date.getTime());
			} catch (ParseException e2) {
				try {
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
							"yyyy\\MM\\dd");
					Date date = simpleDateFormat.parse(value);
					return new Timestamp(date.getTime());
				} catch (ParseException e3) {
					throw e3;
				}
			}
		}
	}

	public static Timestamp addOneDay(Timestamp timestamp) {
		if (timestamp == null)
			return null;
		else
			return new Timestamp(timestamp.getTime() + PERIOD_DAY);
	}

	public static boolean isValidTimestamp(String value) {
		boolean result = true;
		try {
			Timestamp.valueOf(value);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}

	public static String getOriginalMessageFromException(Exception ajaxException) {
		Throwable throwable = ajaxException.getCause();
		if (throwable == null)
			return ajaxException.getMessage();
		while (throwable.getCause() != null) {
			throwable = throwable.getCause();
		}
		return throwable.getMessage();
	}

	public static Throwable getOriginalException(Exception ajaxException) {
		Throwable throwable = ajaxException.getCause();
		if (throwable == null)
			return ajaxException;
		while (throwable.getCause() != null) {
			throwable = throwable.getCause();
		}
		return throwable;
	}

	public static boolean validateJSONArray(String arrayString) {
		boolean result = true;
		try {
			new JSONArray(arrayString);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}

	public static JSONArray getJSONArrayFromStr(String arrayString)
			throws Exception {
		JSONArray result = null;
		try {
			result = new JSONArray(arrayString);
		} catch (Exception e) {
		}
		return result;
	}

	public static List<String> getListFromJSONArrayStr(String arrayString)
			throws Exception {
		JSONArray array = getJSONArrayFromStr(arrayString);
		if (array != null)
			return getListFromJSONArray(array);
		else
			return new ArrayList<String>();
	}

	public static List<String> getListFromJSONArray(JSONArray array)
			throws Exception {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < array.length(); i++) {
			list.add(array.getString(i));
		}
		return list;
	}

	public static String getPeriodTime(Timestamp startTime) {
		Timestamp endTime = getTimestamp();
		long period = (endTime.getTime() - startTime.getTime()) / 1000;

		long year = period / (12 * 30 * 24 * 3600);
		long month = period / (30 * 24 * 3600);
		long day = period / (24 * 3600);
		long hour = period % (24 * 3600) / 3600;
		long minute = period % 3600 / 60;
		long second = period % 60;

		String result = "";
		if (year > 0)
			result = result + year + "年";
		else if (month > 0)
			result = result + month + "个月";
		else if (day > 0)
			result = result + day + "天";
		else if (hour > 0)
			result = result + hour + "小时";
		else if (minute > 0)
			result = result + minute + "分钟";
		else if (second > 0)
			result = result + second + "秒";
		result = result + "前";
		return result;
	}

	public static String getDurationTime(Timestamp startTime) {
		Timestamp endTime = getTimestamp();
		long period = endTime.getTime() - startTime.getTime();

		long year = period / Utils.PERIOD_YEAR;
		long month = (period - year * Utils.PERIOD_YEAR) / Utils.PERIOD_MONTH;
		long day = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH)
				/ Utils.PERIOD_DAY;
		long hour = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY)
				/ Utils.PERIOD_HOUR;
		long minute = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY - hour
				* Utils.PERIOD_HOUR)
				/ Utils.PERIOD_MINUTE;
		long second = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY - hour
				* Utils.PERIOD_HOUR - minute * Utils.PERIOD_MINUTE)
				/ Utils.PERIOD_SECOND;
		long millisecond = period % 1000;

		String result = "";
		if (year > 0)
			result = result + year + "年";
		if (month > 0)
			result = result + month + "个月";
		if (day > 0)
			result = result + day + "天";
		if (hour > 0)
			result = result + hour + "小时";
		if (minute > 0)
			result = result + minute + "分钟";
		if (second > 0)
			result = result + second + "秒";
		if (millisecond > 0)
			result = result + millisecond + "毫秒";

		return result;
	}

	public static String getDurationTime(long period) {

		long year = period / Utils.PERIOD_YEAR;
		long month = (period - year * Utils.PERIOD_YEAR) / Utils.PERIOD_MONTH;
		long day = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH)
				/ Utils.PERIOD_DAY;
		long hour = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY)
				/ Utils.PERIOD_HOUR;
		long minute = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY - hour
				* Utils.PERIOD_HOUR)
				/ Utils.PERIOD_MINUTE;
		long second = (period - year * Utils.PERIOD_YEAR - month
				* Utils.PERIOD_MONTH - day * Utils.PERIOD_DAY - hour
				* Utils.PERIOD_HOUR - minute * Utils.PERIOD_MINUTE)
				/ Utils.PERIOD_SECOND;

		String result = "";
		if (year > 0)
			result = result + year + "年";
		if (month > 0)
			result = result + month + "个月";
		if (day > 0)
			result = result + day + "天";
		if (hour > 0)
			result = result + hour + "小时";
		if (minute > 0)
			result = result + minute + "分钟";
		if (second > 0)
			result = result + second + "秒";

		return result;
	}

	public static String getDurationTimeWithMonth(long period) {

		long year = period / (12L * 30L * 24L * 60L * 60L * 1000L);
		long month = period / (30L * 24L * 60L * 60L * 1000L) - year * 12;
		long day = period / (24 * 60 * 60 * 1000);
		long hour = period / (60 * 60 * 1000) - day * 24;
		long minute = period / (60 * 1000) - day * 24 * 60 - hour * 60;

		String result = "";
		if (year > 0)
			result = year + "年前";
		else if (month > 0)
			result = month + "个月前";
		else if (day > 0)
			result = day + "天前";
		else if (hour > 0)
			result = hour + "小时前";
		else if (minute > 0)
			result = minute + "分钟前";

		return result;
	}

	public static String getOwnerIdFromImageFileId(String fileId) {
		String ownerId = "";
		if (fileId.length() > 30) {
			ownerId = fileId.substring(0, 22);
		}
		return ownerId;
	}

	public static String getIcoUrl(String imageUrl, int size) {
		return imageUrl.replace("{size}", String.valueOf(size));
	}

	public static String getCrossSystemPath(String path) {
		if (!System.getProperty("os.name").equalsIgnoreCase("Linux"))
			return "c:" + path;
		return path;
	}

	public static String warningNotExistsText(String text, String id) {
		return "<font color=red>(" + text + "，ID:" + id + ")</font>";
	}

	public static String warningNotExistsText(String text) {
		return "<font color=red>(" + text + ")</font>";
	}

	public static final int ICO_SMALL = 50;
	public static final int ICO_BIG = 100;
	public static final int ICO_LARGE = 150;
	public static final int ICO_IMG_DISPLAY = 700;

	public static String getUrlSpliterGtDouble() {
		return " &gt;&gt; ";
	}

	public static String getUrlSpliterGt() {
		return " &gt; ";
	}

	public static String getForumPageUrl() {
		return "<a href='forum.jsp' target='_blank'>用户论坛</a>";
	}

	public static String getCirclePageUrl() {
		return "<a href='circleList.jsp' target='_blank'>知识圈</a>";
	}

	public static String getIntellectualPageUrl() {
		return "<a href='intellectualList.jsp' target='_blank'>知识分子</a>";
	}

	private static Map<String, String> emailMap = new HashMap<String, String>();

	static {
		emailMap.put("@sina.com", "http://mail.sina.com.cn/");
		emailMap.put("@vip.sina.com", "http://mail.sina.com.cn/");
		emailMap.put("@my3ia.sina.com", "http://mail.sina.com.cn/");
		emailMap.put("@sina.cn", "http://mail.sina.com.cn/");

		emailMap.put("@163.com", "http://mail.163.com/");

		emailMap.put("@hotmail.com", "http://www.hotmail.com/");

		emailMap.put("@yahoo.com.cn", "http://mail.cn.yahoo.com/");
		emailMap.put("@yahoo.com", "http://mail.yahoo.com/");

		emailMap.put("@126.com", "http://mail.126.com/");

		emailMap.put("@21cn.com", "http://mail.21cn.com/");

		emailMap.put("@tom.com", "http://mail.tom.com/");

		emailMap.put("@gmail.com", "http://www.gmail.com/");

		emailMap.put("@263.net", "http://mail.263.com/");
		emailMap.put("@263.net.cn", "http://mail.263.com/");
		emailMap.put("@x263.net", "http://mail.263.com/");

		emailMap.put("@qq.com", "http://mail.qq.com/");
		emailMap.put("@vip.qq.com", "http://mail.qq.com/");
		emailMap.put("@foxmail.com", "http://mail.qq.com/");

		emailMap.put("@sohu.com", "http://mail.sohu.com/");
		emailMap.put("@vip.sohu.com", "http://mail.sohu.com/");

		emailMap.put("@139.com", "http://mail.139.com/");
	}

	public static String parseEmailWebAddress(String email) {
		String linkUrl = null;
		String emailLowerCase = email.toLowerCase();
		Iterator<String> it = emailMap.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			if (emailLowerCase.endsWith(key))
				linkUrl = emailMap.get(key);
		}
		if (linkUrl != null)
			return "立即前往<a href='" + linkUrl
					+ "' style='font-size: 20px;margin-left: 4px;'>" + email
					+ "</a>";
		else
			return "<span style='font-size: 20px;'>" + email + "</span>";
	}

	public static String htmlEscape(String text) {
		text = text.replaceAll("<", "&lt;");
		text = text.replaceAll(">", "&gt;");
		return text;
	}

	public static String getNumberDisplay(double value) {
		long v = Math.round(value);
		if (v == value)
			return String.valueOf(v);
		else
			return String.valueOf(value);
	}

	public static Date getDateByTimestamp(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public static Timestamp getTimestamp(int dayOffset) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		cal.add(Calendar.DATE, dayOffset);

		return new Timestamp(cal.getTime().getTime());
	}

	public static String joinArray(String[] array, String splitter) {
		if (array.length <= 0)
			return "";
		StringBuffer sb = new StringBuffer();
		for (String s : array)
			sb.append(s + splitter);
		String result = sb.toString();
		return result.substring(0, result.length() - 1);
	}

	public static String joinList(List<String> array, String splitter) {
		if (array.size() <= 0)
			return "";
		StringBuffer sb = new StringBuffer();
		for (String s : array)
			sb.append(s + splitter);
		String result = sb.toString();
		return result.substring(0, result.length() - 1);
	}

	public static byte[] readFile(String path) throws Exception {
		File file = new File(path);
		if (!file.exists() || !file.isFile())
			return null;
		InputStream is = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] tmpData = new byte[1024];
		int length;
		byte[] data;
		try {
			while ((length = is.read(tmpData)) > 0) {
				baos.write(tmpData, 0, length);
			}
			data = baos.toByteArray();
		} finally {
			is.close();
			baos.close();
		}
		return data;
	}

	public static void writeFile(String path, InputStream is) throws Exception {
		File desFile = new File(path);
		if (!desFile.getParentFile().exists())
			desFile.getParentFile().mkdirs();
		OutputStream os = null;
		try {
			os = new FileOutputStream(desFile);
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = is.read(buf, 0, 1024)) > 0) {
				os.write(buf, 0, len);
			}
		} finally {
			if (os != null) {
				try {
					os.flush();
				} catch (IOException e) {
					log.error(Utils.getOriginalMessageFromException(e), e);
				}
				try {
					os.close();
				} catch (IOException e) {
					log.error(Utils.getOriginalMessageFromException(e), e);
				}
			}
			try {
				if (is != null)
					is.close();
			} catch (Exception e) {
				log.error(Utils.getOriginalMessageFromException(e), e);
			}
		}
	}

	public static void writeFile(String path, byte[] data) throws Exception {
		File file = new File(path);
		if (!file.getParentFile().exists())
			file.getParentFile().mkdirs();
		OutputStream os = new FileOutputStream(file);
		try {
			os.write(data);
		} finally {
			os.close();
		}
	}

	public static void writeFile(String path, File srcFile) throws Exception {
		File desFile = new File(path);
		if (!desFile.getParentFile().exists())
			desFile.getParentFile().mkdirs();
		OutputStream os = null;
		InputStream is = null;
		try {
			os = new FileOutputStream(desFile);
			is = new FileInputStream(srcFile);
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = is.read(buf, 0, 1024)) > 0) {
				os.write(buf, 0, len);
			}
		} finally {
			if (os != null) {
				try {
					os.flush();
				} catch (IOException e) {
					log.error(Utils.getOriginalMessageFromException(e), e);
				}
				try {
					os.close();
				} catch (IOException e) {
					log.error(Utils.getOriginalMessageFromException(e), e);
				}
			}
			try {
				if (is != null)
					is.close();
			} catch (Exception e) {
				log.error(Utils.getOriginalMessageFromException(e), e);
			}
		}
	}

	public static void deleteFile(String filePath) {
		try {
			File file = new File(filePath);
			file.delete();
		} catch (Exception e) {
			log.error(Utils.getOriginalMessageFromException(e), e);
		}
	}

	public static byte[] getDataUrl(String url) throws Exception {

		URL pageUrl = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) pageUrl
				.openConnection();

		connection.setConnectTimeout(10000);

		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		InputStream is = connection.getInputStream();
		byte[] buffer = new byte[512];
		int len = 0;
		while ((len = is.read(buffer)) > 0) {
			baos.write(buffer, 0, len);
		}

		return baos.toByteArray();
	}

	public static String getPageDataHtml(String url, String characterSet)
			throws Exception {

		URL pageUrl = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) pageUrl
				.openConnection();

		connection.setConnectTimeout(10000);

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), characterSet));

		StringBuffer sb = new StringBuffer();
		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				sb.append(String.format("%s\r", line));
			}
		} finally {
			if (reader != null)
				reader.close();
		}

		return sb.toString();
	}

	public static Timestamp adjustAsEndDate(Timestamp endDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(endDate.getTime());
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 0);

		return new Timestamp(cal.getTime().getTime());
	}

	public static Timestamp getDateTimeByOffsetDays(int offsetDays) {
		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		cal.add(Calendar.DAY_OF_MONTH, offsetDays);

		return new Timestamp(cal.getTime().getTime());
	}

	public static Timestamp getDateTimeByOffsetDays(Timestamp time,
			int offsetDays) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(time.getTime());

		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		cal.add(Calendar.DAY_OF_MONTH, offsetDays);

		return new Timestamp(cal.getTime().getTime());
	}

	public static Date getDateTimeByOffsetDays(Date time, int offsetDays) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(time.getTime());

		cal.add(Calendar.DAY_OF_MONTH, offsetDays);

		return new Timestamp(cal.getTime().getTime());
	}

	public static Timestamp getTimestampByOffsetDays(Timestamp time,
			int offsetDays) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(time.getTime());

		cal.add(Calendar.DAY_OF_MONTH, offsetDays);

		return new Timestamp(cal.getTime().getTime());
	}

	public static String validateImageType(String filePath) throws Exception {
		MemoryCacheImageInputStream mcis = null;
		File file = new File(filePath);
		FileInputStream fis = new FileInputStream(file);

		try {
			mcis = new MemoryCacheImageInputStream(fis);
			Iterator<ImageReader> iterator = ImageIO.getImageReaders(mcis);
			while (iterator.hasNext()) {
				ImageReader reader = (ImageReader) iterator.next();
				String imageName = reader.getClass().getSimpleName();
				if ("GIFImageReader".equals(imageName)) {
					return "gif";
				} else if ("JPEGImageReader".equals(imageName)) {
					return "jpg";
				} else if ("PNGImageReader".equals(imageName)) {
					return "png";
				}
			}
		} finally {
			fis.close();
		}
		return null;
	}

	public static Date getTimeThisHour() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);

		return c.getTime();
	}

	public static Date getTimeToday(String time) {
		if (time == null || time.trim().equals("")) {
			return null;
		}

		time = time.replaceAll("：", ":");
		String[] fixedTime = time.split(":");
		if (fixedTime.length != 2)
			return null;

		String hourStr = fixedTime[0];
		String minuteStr = fixedTime[1];

		int hour = 0;
		int minute = 0;
		try {
			hour = Integer.valueOf(hourStr);
			minute = Integer.valueOf(minuteStr);
		} catch (Exception e) {
			return null;
		}

		Calendar c = Calendar.getInstance();

		c.setTime(new Date());
		c.set(Calendar.HOUR_OF_DAY, hour);
		c.set(Calendar.MINUTE, minute);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);

		return c.getTime();
	}

	public static String getMainDomain(String urlStr) {
		URL url = null;
		try {
			url = new URL(urlStr);
		} catch (MalformedURLException e) {
			return "";
		}

		String host = url.getHost();
		Pattern p = Pattern.compile("([a-z0-9]+\\.(com|cn|net|cc))",
				Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(host);
		if (m.find())
			return m.group();
		else
			return "";
	}

	public static String getQueryString(String urlStr) throws Exception {
		URL url = new URL(urlStr);
		String queryStr = url.getQuery();
		if (queryStr == null)
			queryStr = "";
		return queryStr;
	}

	public static boolean findDomain(String queryStr) {
		Pattern p = Pattern.compile("([a-z0-9]+\\.(com|cn|net|cc))",
				Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(queryStr);
		return m.find();
	}

	public static long getStartTime() {
		return Calendar.getInstance().getTime().getTime();
	}

	public static String getElapsedTime(long startTime) {
		long endTime = Calendar.getInstance().getTime().getTime();
		String result = String.format("共经过%d毫秒", endTime - startTime);
		return result;
	}

	public static JSONArray wrapAsJSONArray(Object value) {
		JSONArray array = new JSONArray();
		array.put(value);
		return array;
	}

	public static String wrapAsDate(Timestamp time) {
		String resultDate = "";
		if (!time.equals(Utils.getTimestampZero()))
			resultDate = Utils.formatDate(time);
		return resultDate;
	}

	public static String getFileNameExt(String fileName) {
		if (!fileName.contains("."))
			return null;
		if (fileName.endsWith("."))
			return null;
		String[] parts = fileName.split("\\.");
		return parts[parts.length - 1];
	}

	public static boolean existsInterface(Class<?> clazz,
			Class<?> clazzInterface) {
		Class<?>[] clazzes = clazz.getInterfaces();
		for (Class<?> cla : clazzes) {
			if (cla.equals(clazzInterface))
				return true;
		}
		return false;
	}

	public static String getFileSize(long length) {
		long kb = length / 1024;
		String kbStr = String.valueOf(kb);
		return String.format("%sKB", kbStr);
	}

	public static List<String> getListFromJsonArrayString(String jsonArrayStr)
			throws Exception {
		if (jsonArrayStr == null || jsonArrayStr.isEmpty())
			return null;
		JSONArray array = new JSONArray(jsonArrayStr);
		List<String> resultList = new ArrayList<String>();
		for (int i = 0; i < array.length(); i++) {
			String value = array.getString(i);
			resultList.add(value);
		}
		return resultList;
	}

	public static String convertToJavaDataType(String jdbcType){
		String result = "";
		switch (jdbcType.toUpperCase()){
			case "VARCHAR":
				result = "String";
				break;
			case "INT":
				result = "int";
				break;
			case "INTEGER":
				result = "Integer";
				break;
			case  "DECIMAL":
				result = "Float";
				break;
			case  "CHAR":
				result = "String";
				break;
			case  "BIT":
				result = "Boolean";
				break;
			default:
				result = "String";
		}

		return result;
	}
	/**
	 * 转换为下划线
	 *
	 * @param camelCaseName
	 * @return
	 */
	public static String underscoreName(String camelCaseName) {
		StringBuilder result = new StringBuilder();
		if (camelCaseName != null && camelCaseName.length() > 0) {
			result.append(camelCaseName.substring(0, 1).toLowerCase());
			for (int i = 1; i < camelCaseName.length(); i++) {
				char ch = camelCaseName.charAt(i);
				if (Character.isUpperCase(ch)) {
					result.append("_");
					result.append(Character.toLowerCase(ch));
				} else {
					result.append(ch);
				}
			}
		}
		return result.toString();
	}

	/**
	 * 转换为驼峰
	 *
	 * @param underscoreName
	 * @return
	 */
	public static String camelCaseName(String underscoreName) {
		StringBuilder result = new StringBuilder();
		if (underscoreName != null && underscoreName.length() > 0) {
			boolean flag = false;
			for (int i = 0; i < underscoreName.length(); i++) {
				char ch = underscoreName.charAt(i);
				if ("_".charAt(0) == ch) {
					flag = true;
				} else {
					if (flag) {
						result.append(Character.toUpperCase(ch));
						flag = false;
					} else {
						result.append(ch);
					}
				}
			}
		}
		return result.toString();
	}

	public static final long PERIOD_SECOND = 1000;
	public static final long PERIOD_MINUTE = PERIOD_SECOND * 60;
	public static final long PERIOD_HALF_HOUR = PERIOD_MINUTE * 30;
	public static final long PERIOD_HOUR = PERIOD_MINUTE * 60;
	public static final long PERIOD_DAY = PERIOD_HOUR * 24;
	public static final long PERIOD_WEEK = PERIOD_DAY * 7;
	public static final long PERIOD_MONTH = PERIOD_DAY * 30;
	public static final long PERIOD_YEAR = PERIOD_MONTH * 12;

	public static void main(String[] args) throws Exception {
	}
}
