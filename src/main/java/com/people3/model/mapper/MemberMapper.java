package com.people3.model.mapper;

import java.util.List;

import com.people3.model.vo.Member;

public interface MemberMapper {

	public void Register(Member vo);
	public List<Member> idcheck(String id);
	public Member login(Member vo);
	
	
	

}
