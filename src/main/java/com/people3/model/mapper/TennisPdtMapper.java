package com.people3.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.people3.model.vo.TennisPdt;

@Mapper
public interface TennisPdtMapper {
	
	public List<TennisPdt> list();
	
}
