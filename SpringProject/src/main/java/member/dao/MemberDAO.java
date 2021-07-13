package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberDAO {

	public MemberDTO loginCheck(Map<String, String> map);

	public MemberDTO checkId(String id);

	public void write(MemberDTO memberDTO);

	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map);

	public MemberDTO getMember(String id);

	public void modifyUpdate(MemberDTO memberDTO);
	
	
}
