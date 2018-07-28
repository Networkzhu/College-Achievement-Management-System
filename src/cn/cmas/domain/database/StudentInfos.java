package cn.cmas.domain.database;

public class StudentInfos {
	private String id;
	private String pwd;
	private String name;
	private String major;
	private String cclass;
	private Double gpa;
	private int level;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getCclass() {
		return cclass;
	}
	public void setCclass(String cclass) {
		this.cclass = cclass;
	}
	
	public Double getGpa() {
		return gpa;
	}
	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	@Override
	public String toString() {
		return "StudentInfos [id=" + id + ", pwd=" + pwd + ", name=" + name + ", major=" + major + ", cclass=" + cclass
				+ ", gpa=" + gpa + ", level=" + level + "]";
	}
}
