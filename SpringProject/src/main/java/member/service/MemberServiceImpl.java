package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public String loginCheck(Map<String, String> map, HttpSession session) {
		//db로 갈 때는 map 만 들고 간다. 
		MemberDTO memberDTO= memberDAO.loginCheck(map);
		
		if(memberDTO==null) {
			return "fail";// 로그인 실패로. 지금 일치하는 값 없음 
		}else {//로그인 가능, 이제 session 같이 보낸다. 
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			return "success";
		}
		
	}

	@Override
	public String checkId(String id) {
		MemberDTO memberDTO = memberDAO.checkId(id);
		if(memberDTO==null) {
			return "non_exist";//사용할 수 있음. 
		}else return "exist";
	}

	@Override
	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map) {
		return memberDAO.checkPostSearch(map);
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public void modifyUpdate(MemberDTO memberDTO) {
		memberDAO.modifyUpdate(memberDTO);
	}

}
