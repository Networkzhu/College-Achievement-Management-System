package cn.cmas.domain.database;

public class ClassStudentScores {
	private String id;
	private String name;
	private String gpa;
	private String allcre;
	private String passrate;
	public ClassStudentScores() { }
	public ClassStudentScores(String id, String name, String gpa, String allcre, String passrate) {
		this.id = id;
		this.name = name;
		this.gpa = gpa;
		this.allcre = allcre;
		this.passrate = passrate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	public String getAllcre() {
		return allcre;
	}
	public void setAllcre(String allcre) {
		this.allcre = allcre;
	}
	public String getPassrate() {
		return passrate;
	}
	public void setPassrate(String passrate) {
		this.passrate = passrate;
	}
	@Override
	public String toString() {
		return "ClassStudentScores [id=" + id + ", name=" + name + ", gpa=" + gpa + ", allcre=" + allcre + ", passrate="
				+ passrate + "]";
	}
}