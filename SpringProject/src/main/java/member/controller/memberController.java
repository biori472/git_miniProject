package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;
import net.sf.json.JSONObject;


@Controller
@RequestMapping(value="member")

public class memberController {
	
	@Autowired
	private MemberService memberService ;
	//로그인 페이지 
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	//로그인 →DB연결
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam Map<String, String> map, HttpSession session) {
		return memberService.loginCheck(map,session);
	}
	//로그아웃 후 넘어가는 페이지 
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();//모든 세션 무효화.
		return "/index";
	}
	//회원가입 display 에 넣기 1
	/*@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public ModelAndView writeForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/member/writeForm.jsp");
		mav.setViewName("/index");
		return mav;
	}*/
	
	//회원가입 display 에 넣기  2
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display","/member/writeForm.jsp");
		return "/index";
	}
	//회원가입 전송 →DB연결
	@RequestMapping(value="write", method=RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute MemberDTO memberDTO) {
		System.out.println(memberDTO.getName());
		memberService.write(memberDTO);
	}
	//회원가입 checkID 중복체크 →DB연결
		@RequestMapping(value="checkId", method=RequestMethod.POST)
		@ResponseBody
		public String checkId(@RequestParam String id) {
			return memberService.checkId(id);
	}
	//회원가입 우편번호 window open페이지
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}
	//회원가입 우편번호 →DB연결 (json형식 사용, servlet-context bean 설정하기.
	@RequestMapping(value="/checkPostSearch", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView checkPostSearch(@RequestParam Map<String,String> map) {
		List<ZipcodeDTO> list;
		
		ModelAndView mav = new ModelAndView();
		if (map.get("sido") != null && map.get("roadname") != null) {
			if(map.get("sido")!=""&&map.get("roadname")!="") {
				
			list = memberService.checkPostSearch(map);
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			}
		}
		return mav;
	}
	//회원정보수정
	@RequestMapping(value="modifyForm", method=RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		String id= (String) session.getAttribute("memId");
		
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("display","/member/modifyForm.jsp");
		return "/index";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)//submit  으로 처리.
	public String modify(@ModelAttribute MemberDTO memberDTO, Model model) { 
		memberService.modifyUpdate(memberDTO); //DB연결.
		
		model.addAttribute("display","/member/modify.jsp");
		return "/index";
		}
	
	
}
