package cn.cmas.domain.formbean;

public class MajorBaseInfo {
	private String major;
	private String gpa;
	private String notPassTimes;
	private String notPassRate;
	private String comTimes;
	private String proTimes;
	public MajorBaseInfo() {	}
	public MajorBaseInfo(String major, String gpa, String notPassTimes, String notPassRate, String comTimes,
			String proTimes) {
		this.major = major;
		this.gpa = gpa;
		this.notPassTimes = notPassTimes;
		this.notPassRate = notPassRate;
		this.comTimes = comTimes;
		this.proTimes = proTimes;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	public String getNotPassTimes() {
		return notPassTimes;
	}
	public void setNotPassTimes(String notPassTimes) {
		this.notPassTimes = notPassTimes;
	}
	public String getNotPassRate() {
		return notPassRate;
	}
	public void setNotPassRate(String notPassRate) {
		this.notPassRate = notPassRate;
	}
	public String getComTimes() {
		return comTimes;
	}
	public void setComTimes(String comTimes) {
		this.comTimes = comTimes;
	}
	public String getProTimes() {
		return proTimes;
	}
	public void setProTimes(String proTimes) {
		this.proTimes = proTimes;
	}
}
