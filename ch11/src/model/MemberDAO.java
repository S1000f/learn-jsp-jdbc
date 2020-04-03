package model;

import java.util.ArrayList;

public interface MemberDAO {
	
	int insertMember(MemberVO memberVo);
	int updateMember(MemberVO memberVo);
	int deleteMember(MemberVO memberVo);
	MemberVO readMember(MemberVO memberVo);
	ArrayList<MemberVO> readMemberList(MemberVO memberVo);
}
