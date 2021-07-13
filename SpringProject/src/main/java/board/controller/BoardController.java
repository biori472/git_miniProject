package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;
import member.bean.MemberDTO;
import net.sf.json.JSONObject;


@Controller
@RequestMapping(value="board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
		model.addAttribute("display","/board/boardWriteForm.jsp");
		return "/index";
	}
	
	//회원가입 checkID 중복체크 →DB연결
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map) {
		//원글-1페이지의 첫번째 글로 들어가고, 항상 첫번째로 들어간다.(최신순)
		boardService.boardWrite(map);
	}	
	//게시판목록 페이지 
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("pg",pg);
		model.addAttribute("display","/board/boardList.jsp");
		return "/index";
	}
	//게시판목록-글정보 불러오기
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getBoardList(@RequestParam(required=false, 
													defaultValue="1")String pg, 
													HttpSession session,
													HttpServletResponse response) {
		//1페이지당 5개씩
		List<BoardDTO> list = boardService.getBoardList(pg);
		
		//페이징 처리 는 여기서 하지 않고, 메소드만 호출! 
		BoardPaging boardPaging = boardService.boardPaging(pg);
		
		//세션
		String memId=(String) session.getAttribute("memId");
		
		//쿠키생성
		if(session.getAttribute("memId")!=null) {
			Cookie cookie= new Cookie("memHit","0");
			cookie.setMaxAge(30*60);
			response.addCookie(cookie);
		}
		//ModelAndView생성
		ModelAndView mav = new ModelAndView();
		mav.addObject("memId", memId);
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//게시판 상세 페이지
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public String boardView(@RequestParam String seq
							,String pg
							,HttpServletResponse response
							,HttpServletRequest request
							,Model model) {
		model.addAttribute("seq",seq);
		model.addAttribute("pg",pg);
		model.addAttribute("display","/board/boardView.jsp");//boardViewJSP로 seq, pg데리고가기
		return "/index";
	}
	//게시판 상세정보 →DB연결 (1사람의 글)
	@RequestMapping(value="getBoardView", method=RequestMethod.POST)//강사님: getBoard
	@ResponseBody
	public ModelAndView getBoardView(@RequestParam String seq
									,HttpSession session
									,@CookieValue(value="memHit",required=false)Cookie cookie
									,HttpServletResponse response) {
		//조회수-새로고침 방지  (이제 전체 다 꺼내 올 필요 없고, memHit 의 쿠키만 꺼내 올 수 있따. )
		if(cookie!=null) {
			boardService.hitUpdate(seq);
			cookie.setMaxAge(0);
			response.addCookie(cookie);//클라이언트에게 보내기
		}
		//1사람의 글 가져오기.		
		BoardDTO boardDTO = boardService.getBoardData(seq);
		//ID 세션 가져오기
		String memId = (String) session.getAttribute("memId");
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("boardDTO",boardDTO);
		mav.addObject("memId",memId);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//게시판 글수정
	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq, 
								  @RequestParam String pg,	
								  Model model) {
		model.addAttribute("seq",seq);
		model.addAttribute("pg",pg);
		model.addAttribute("display","/board/boardModifyForm.jsp");
		return "/index";
	}
	
	//게시판글수정  DB
	@RequestMapping(value="boardModify", method=RequestMethod.POST)
	@ResponseBody
	public void boardModify(@ModelAttribute BoardDTO boardDTO) {
		System.out.println("seq"+boardDTO.getSeq());
		boardService.updateBoard(boardDTO);
	}
	/*
	 * 게시판 글수정
	 * @RequestMapping(value="boardModify", method=RequestMethod.POST)
	 * @ResponseBody public void boardModify(@RequestParam Map<String, String> map) {
	 * boardService.updateBoard(boardDTO); }
	 */
	 
	//게시판 댓글
	@RequestMapping(value="boardReplyForm", method=RequestMethod.POST)
	public String boardReplyForm(@RequestParam String seq, 
								@RequestParam String pg, 
								Model model) {
		//원글번호, 원글의 페이지 번호 잡아와야 한다. 
		//답글은 원글페이지, 그리고 원글 밑으로 들어가야한다. 
		
		//원글번호
		model.addAttribute("pseq",seq);
		//원글의페이지번호 
		model.addAttribute("pg",pg);
		
		model.addAttribute("display","/board/boardReplyForm.jsp");
		return "/index";
	}
	
	//게시판 댓글→DB연결
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	@ResponseBody
	public void boardReply(@RequestParam Map<String, String> map) {
		//원글페이지,원글번호 
		boardService.boardReply(map);
	}	
	
	//게시글 삭제-boardView에서 boardDelete Btn
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	//@ResponseBody
	public ModelAndView boardDelete(@RequestParam String seq) {
		//원글페이지,원글번호 
		boardService.boardDelete(seq);
		return new ModelAndView("redirect:/board/boardList");
	}	
	
	//게시판목록-글정보 불러오기
		@RequestMapping(value="boardSearch", method=RequestMethod.POST)
		@ResponseBody
		public ModelAndView boardSearch(@RequestParam Map<String, String> map, HttpSession session) {
		
			List<BoardDTO> list = boardService.getBoardSearchList(map);
		
			//ID 세션 가져오기
			String memId = (String) session.getAttribute("memId");
			
			//페이징 처리 는 여기서 하지 않고, 메소드만 호출! 
			BoardPaging boardPaging = boardService.boardPaging(map);
			
			//ModelAndView생성
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", map.get("pg"));
			mav.addObject("memId", memId);
			mav.addObject("list", list);
			mav.addObject("boardPaging", boardPaging);
			mav.setViewName("jsonView");
			return mav;
		}
}
