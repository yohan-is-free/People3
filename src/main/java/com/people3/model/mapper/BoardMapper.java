package com.people3.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.people3.model.vo.Board;

public interface BoardMapper {

	public List<Board> getLists(); // 전체리스트
	public void boardInsert(Board vo);
	public Board boardContent(int boardNo);
	public void boardDelete(int boardNo);
	public void boardUpdate(Board vo);
	
	@Update("update board set count=count+1 where boardNo=#{boardNo}")
	public void boardCount(int boardNo);
}
