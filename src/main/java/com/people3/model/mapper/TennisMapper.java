package com.people3.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.people3.model.vo.GJTennis;


@Mapper
public interface TennisMapper {

	List<GJTennis> selectTA();
	
}
