package board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
//	@Autowired
//	private HttpServletResponse response;--> controller 처리.
	
	
	@Override
	public void boardWrite(Map<String, String> map) {
		map.put("id", (String) session.getAttribute("memId"));
		map.put("name", (String) session.getAttribute("memName"));
		map.put("email", (String) session.getAttribute("memEmail"));
		boardDAO.boardWrite(map);
	}
	//리스트 + 페이지 처리
	@Override
	public List<BoardDTO> getBoardList(String pg) {
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, Integer> map = new HashedMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return boardDAO.getBoardList(map);
	}
	
	@Override
	public BoardDTO getBoardData(String seq) {
		return boardDAO.getBoardData(seq);
	}
	
	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getTotalA();//총 글수 
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);//5개씩 뿌리기
		boardPaging.setTotalA(totalA);//db에서 받아온 total게시글 수 
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}
	
	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		int totalA = boardDAO.getTotalSearchA(map);//검색한 총 글수 
	
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);//5개씩 뿌리기
		boardPaging.setTotalA(totalA);//db에서 받아온 total게시글 수 
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}
	//오버로드

	
	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}
	@Override
	public void boardReply(Map<String, String> map) {
		//원글 페이지의, 원글 아래로 (level=원글+1), 글순서step = 원글step+1
		
		//
		BoardDTO pDTO = boardDAO.getBoardData(map.get("pseq"));
		map.put("id", (String) session.getAttribute("memId"));
		map.put("email", (String) session.getAttribute("memEmail"));
		map.put("name", (String) session.getAttribute("memName"));
		
		map.put("ref",pDTO.getRef()+"");//원글 ref
		map.put("lev",pDTO.getLev()+"");//원글 lev 여기서 +1NO! , mapper 에서 
		map.put("step",pDTO.getStep()+"");//원글 step
		
		boardDAO.boardReply(map);
	}
	@Override
	public void hitUpdate(String seq) {
		boardDAO.hitUpdate(seq);
	}
	
	
	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
	}
	
	
	@Override
	public List<BoardDTO> getBoardSearchList(Map<String, String> map) {
		
		String pg = map.get("pg");
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
	
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");

		return boardDAO.getBoardSearchList(map);
	}

	/*
	 * @Override public List<BoardDTO> getBoardList(Map<String, String> map) { int
	 * endNum = 1 * 5; int startNum = endNum - 4; map.put("startNum", startNum+ "");
	 * map.put("endNum", endNum+ ""); return boardDAO.getBoardList(map); }
	 */
}
