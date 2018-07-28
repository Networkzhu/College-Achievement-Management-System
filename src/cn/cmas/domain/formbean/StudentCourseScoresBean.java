package cn.cmas.domain.formbean;

public class StudentCourseScoresBean {
	private String name;
	private String type;
	private int score;
	private double coefficient;
	private double gpa;
	private double credit;
	public StudentCourseScoresBean() {}
	public StudentCourseScoresBean(String name, String type, int score, double coefficient, double gpa, double credit) {
		super();
		this.name = name;
		this.type = type;
		this.score = score;
		this.coefficient = coefficient;
		this.gpa = gpa;
		this.credit = credit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public double getCoefficient() {
		return coefficient;
	}
	public void setCoefficient(double coefficient) {
		this.coefficient = coefficient;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "StudentCourseScoresBean [name=" + name + ", type=" + type + ", score=" + score + ", coefficient="
				+ coefficient + ", gpa=" + gpa + ", credit=" + credit + "]";
	}
}