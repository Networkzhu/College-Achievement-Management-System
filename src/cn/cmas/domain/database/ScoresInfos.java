package cn.cmas.domain.database;

public class ScoresInfos {
	private int id;
	private String stu_id;
	private String cou_id;
	private int score;
	private int year;
	private int term;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getCou_id() {
		return cou_id;
	}
	public void setCou_id(String cou_id) {
		this.cou_id = cou_id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	@Override
	public String toString() {
		return "ScoresInfos [id=" + id + ", stu_id=" + stu_id + ", cou_id=" + cou_id + ", score=" + score + ", year="
				+ year + ", term=" + term + "]";
	}
}