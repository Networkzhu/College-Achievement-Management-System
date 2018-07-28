package cn.cmas.domain.formbean;

public class ClassCourseScores {
	private String id;
	private Integer score;
	private String name;
	private Double gpa;
	public ClassCourseScores() {
	}
	@Override
	public String toString() {
		return "ClassCourseScores [id=" + id + ", score=" + score + ", name=" + name + ", gpa=" + gpa + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getGpa() {
		return gpa;
	}
	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}
	public ClassCourseScores(String id, Integer score, String name, Double gpa) {
		super();
		this.id = id;
		this.score = score;
		this.name = name;
		this.gpa = gpa;
	}
}
