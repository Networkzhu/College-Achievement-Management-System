package cn.cmas.domain.database;

public class CAndPInfos {
	private Integer id;
	private String name;
	private String year;
	private String levelorprize;
	private String is_leader;
	private String stuid;
	private String status;
	public CAndPInfos() {}
	public CAndPInfos(String name, String year, String levelorprize, String is_leader, String stuid,
			String status) {
		this.name = name;
		this.year = year;
		this.levelorprize = levelorprize;
		this.is_leader = is_leader;
		this.stuid = stuid;
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getLevelorprize() {
		return levelorprize;
	}
	public void setLevelorprize(String levelorprize) {
		this.levelorprize = levelorprize;
	}
	public String getIs_leader() {
		return is_leader;
	}
	public void setIs_leader(String is_leader) {
		this.is_leader = is_leader;
	}
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CAndPInfos [id=" + id + ", name=" + name + ", year=" + year + ", levelorprize=" + levelorprize
				+ ", is_leader=" + is_leader + ", stuid=" + stuid + ", status=" + status + "]";
	}
	
}