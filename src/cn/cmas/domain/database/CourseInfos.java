package cn.cmas.domain.database;

public class CourseInfos {
	private String id;
	private String name;
	private String type;
	private Double coefficient;
	private Double credit;
	private Double year;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getCoefficient() {
		return coefficient;
	}
	public void setCoefficient(Double coefficient) {
		this.coefficient = coefficient;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public Double getYear() {
		return year;
	}
	public void setYear(Double year) {
		this.year = year;
	}
	@Override
	public String toString() {
		return "CourseInfos [id=" + id + ", name=" + name + ", type=" + type + ", coefficient=" + coefficient
				+ ", credit=" + credit + ", year=" + year + "]";
	}
}
