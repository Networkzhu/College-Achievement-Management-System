package cn.cmas.domain.formbean;

public class User {
	private String id;
	private String name;
	private int level;
	public User() {}
	public User(String id, String name, int level) {this.id = id;this.name = name; this.level = level;}
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", level=" + level + "]";
	}
}