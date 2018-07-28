package cn.cmas.domain.formbean;

public class MajorClassInfo {
	private String id;
	private String gpa;
	private String notPassTimes;
	private String passRate;
	private String comTimes;
	private String proTimes;
	public MajorClassInfo() {	}
	public MajorClassInfo(String id, String gpa, String notPassTimes, String passRate, String comTimes,
			String proTimes) {
		this.id = id;
		this.gpa = gpa;
		this.notPassTimes = notPassTimes;
		this.passRate = passRate;
		this.comTimes = comTimes;
		this.proTimes = proTimes;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPassRate() {
		return passRate;
	}
	public void setPassRate(String passRate) {
		this.passRate = passRate;
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
	@Override
	public String toString() {
		return "MajorClassInfo [id=" + id + ", gpa=" + gpa + ", notPassTimes=" + notPassTimes + ", passRate=" + passRate
				+ ", comTimes=" + comTimes + ", proTimes=" + proTimes + "]";
	}
}
