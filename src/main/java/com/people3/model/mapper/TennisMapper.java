package com.people3.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.people3.model.vo.CLS;
import com.people3.model.vo.CTS;
import com.people3.model.vo.Cnt;
import com.people3.model.vo.Coach;
import com.people3.model.vo.GJTennis;
import com.people3.model.vo.Reservation;
import com.people3.model.vo.TennisCourt;


@Mapper
public interface TennisMapper {

	List<GJTennis> selectTA();

	GJTennis selectInfo(int courtNo);

	Cnt courtCnt(int courtNo);

	Cnt isPossibleLesson(int courtNo);

	List<TennisCourt> selectCourts(int courtNo);

	List<Coach> selectCoachs(int courtNo);

	List<String> selectCTS(CTS cts);

	List<String> selectCLS(CLS cls);

	void insertCourtResrv(Reservation resrv);

	void insertLessonResrv(Reservation resrv);

	List<Reservation> selectEvents(String id);

	void deleteResrv(Reservation resrv);

}
