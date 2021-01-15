package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;

@Repository
public class BoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.spring.board.boardMapper";
	
	//게시판 목록 조회
	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getBoardList");
	}
	
	//게시판 조회 수 수정
	public int updateBoardHits(BoardForm boardForm) throws Exception{
		
		return sqlSession.update(NAMESPACE + ".updateBoardHits", boardForm);
	}
	
	//게시판 상세 조회
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", boardForm);
	}
	
	//게시판 등록
	public int insertBoard(BoardForm boardForm) throws Exception{
		
		return sqlSession.insert(NAMESPACE + ".insertBoard", boardForm);
	}
	
	//게시판 삭제
	public int deleteBoard(BoardForm boardForm) throws Exception {
		
		return sqlSession.delete(NAMESPACE + ".deleteBoard", boardForm);
	}
	
	//게시판 수정
	public int updateBoard(BoardForm boardForm) throws Exception{
		
		return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
	}

	//게시판 등록 실패(트랜잭션 테스트용)
	public int insertBoardFail(BoardForm boardForm) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", boardForm); 
	}
}
