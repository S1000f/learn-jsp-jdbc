package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberService implements MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = "";
	private ResultSet rs = null;
	private MemberVO rsMemberVo = null;
	
	
	public int insertMember(MemberVO memberVo) {
		
		int result = 0;
		try {
			conn = DAOBase.getInstance().getConnection();
			sql = "insert into member VALUES((select nvl(max(num),0)+1 from member), ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPw());
			pstmt.setString(3, memberVo.getEmail());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DAOBase.getInstance().closeDBResources(pstmt, conn);
		}
		
		return result;
	}
	
	public int updateMember(MemberVO memberVo) {
		
		int result = 0;
		try {
			conn = DAOBase.getInstance().getConnection();
			sql = "UPDATE MEMBER SET EMAIL= ? WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getEmail());
			pstmt.setString(2, memberVo.getId());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DAOBase.getInstance().closeDBResources(pstmt, conn);
		}
		
		return result;
	}
	
	public int deleteMember(MemberVO memberVo) {
		return 0;
	}
	
	public MemberVO readMember(MemberVO memberVo) {
		
		try {
			conn = DAOBase.getInstance().getConnection();
			sql = "select * from member where ID = ? and PW = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rsMemberVo = new MemberVO();
				rsMemberVo.setId(rs.getString("ID"));
				rsMemberVo.setId(rs.getString("PW"));
				rsMemberVo.setId(rs.getString("EMAIL"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DAOBase.getInstance().closeDBResources(rs, pstmt, conn);
		}
		
		return rsMemberVo;
		
	}
	
	public ArrayList<MemberVO> readMemberList(MemberVO memberVo) {
		return new ArrayList<MemberVO>();
	}
}
