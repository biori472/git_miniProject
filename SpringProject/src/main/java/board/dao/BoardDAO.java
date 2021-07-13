package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public BoardDTO getBoardData(String seq);

	public int getTotalA();

	public int getTotalSearchA(Map<String, String> map);

	public void updateBoard(BoardDTO boardDTO);

	public void boardReply(Map<String, String> map);

	public void hitUpdate(String seq);

	public void boardDelete(String seq);

	public List<BoardDTO> getBoardSearchList(Map<String, String> map);


}
