package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Transactional // 여기다가 줘도 되고 밑에 함수마다 줘도된다
@Repository
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList", map);
		return list;
	}

	@Override
	public BoardDTO getBoardData(String seq) {
		return sqlSession.selectOne("boardSQL.getBoardData", Integer.parseInt(seq));
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("boardSQL.getTotalA");
	}
	
	@Override
	public int getTotalSearchA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getTotalSearchA",map);
	}
	
	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.update("boardSQL.updateBoard", boardDTO);
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply", map);
	}

	@Override
	public void hitUpdate(String seq) {
		sqlSession.update("boardSQL.hitUpdate",Integer.parseInt(seq));
	}

	@Override
	public void boardDelete(String seq) {
		System.out.println("바티스seq"+seq);
		sqlSession.delete("boardSQL.boardDelete",Integer.parseInt(seq));
	}

	@Override
	public List<BoardDTO> getBoardSearchList(Map<String, String> map) {
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardSearchList", map);
		return list;
	}



	
}