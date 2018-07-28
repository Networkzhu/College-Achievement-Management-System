package cn.cmas.domain.formbean;

public class ClassBaseInfoBean {
	private String className;
	private int allNum;
	private String gpa;
	private String notPassRate;
	private int comTimes;
	private int proTimes;
	
	public ClassBaseInfoBean(String className, int allNum, String gpa, String notPassRate, int comTimes, int proTimes) {
		super();
		this.className = className;
		this.allNum = allNum;
		this.gpa = gpa;
		this.notPassRate = notPassRate;
		this.comTimes = comTimes;
		this.proTimes = proTimes;
	}
	public ClassBaseInfoBean() {}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getAllNum() {
		return allNum;
	}
	public void setAllNum(int allNum) {
		this.allNum = allNum;
	}
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	public String getNotPassRate() {
		return notPassRate;
	}
	public void setNotPassRate(String notPassRate) {
		this.notPassRate = notPassRate;
	}
	public int getComTimes() {
		return comTimes;
	}
	public void setComTimes(int comTimes) {
		this.comTimes = comTimes;
	}
	public int getProTimes() {
		return proTimes;
	}
	public void setProTimes(int proTimes) {
		this.proTimes = proTimes;
	}
}