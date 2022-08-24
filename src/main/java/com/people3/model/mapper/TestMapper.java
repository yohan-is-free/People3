package com.people3.model.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.people3.model.vo.Board;


@Mapper
public interface TestMapper {
	
	public String testDB();
	public List<Board> getLists(); // 전체리스트
	public void boardInsert(Board vo);
	
}


	
