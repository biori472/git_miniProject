package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;


@Transactional
@Repository
public class MemberDAOMybatis implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO loginCheck(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.loginCheck",map);//DTO return 
	}

	@Override
	public MemberDTO checkId(String id) {
		return sqlSession.selectOne("memberSQL.checkId", id);
	}
	@Override
	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map) {
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.checkPostSearch",map);		
		return list;
	}
	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write",memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("memberSQL.getMemberList",id);
	}

	@Override
	public void modifyUpdate(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modifyUpdate",memberDTO);	
	}

}
