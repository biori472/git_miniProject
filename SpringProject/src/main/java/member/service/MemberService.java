package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;


public interface MemberService {

	public String loginCheck(Map<String, String> map, HttpSession session);

	public String checkId(String id);

	public void write(MemberDTO memberDTO);

	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map);

	public MemberDTO getMember(String id);

	public void modifyUpdate(MemberDTO memberDTO);

}
