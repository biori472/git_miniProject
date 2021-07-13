package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(String pg);

	public BoardDTO getBoardData(String seq);

	public BoardPaging boardPaging(String pg);

	public BoardPaging boardPaging(Map<String, String> map);//boardSearch
	
	public void updateBoard(BoardDTO boardDTO);

	public void boardReply(Map<String, String> map);

	public void hitUpdate(String seq);

	public void boardDelete(String seq);

	public List<BoardDTO> getBoardSearchList(Map<String, String> map);


}
