package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String drv,String url, String id,String pw) {
		super(drv,url,id,pw);
	}
	
	public MemberDAO (ServletContext application) {
		super(application);
	}

	public MemberDTO getMemberDTO(String uid,String upass) {
		MemberDTO dto=new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs= psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	//회원가입 클래스
	public int setMemberDTO(String id,String pass,String name) {
		int result=0;
		String query = "INSERT INTO member(id,pass,name) VALUES(?,?,?)";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			psmt.setString(3, name);
			result= psmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	//로그인옆 사용자 이름표시
	public MemberDTO headerName(String UserId) {
		MemberDTO dto=new MemberDTO();
		String query = "SELECT * FROM member WHERE id=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, UserId);
			rs= psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	
	
}
