package cn.cmas.domain.formbean;

public class ClassAdmin {
	private String id;
	private String pwd;
	private String cclass;
	private String level;
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
	public String getCclass() {
		return cclass;
	}
	public void setCclass(String cclass) {
		this.cclass = cclass;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "ClassAdmin [id=" + id + ", pwd=" + pwd + ", cclass=" + cclass + ", level=" + level + "]";
	}
}