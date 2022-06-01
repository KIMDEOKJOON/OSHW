package membership;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String regidate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id=id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String Pass) {
		this.pass = Pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String Name) {
		this.name=Name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String Regidate) {
		this.regidate = Regidate;
	}
}
