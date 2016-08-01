package com.msk.wtwt.service;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.msk.wtwt.dto.People;
import com.msk.wtwt.mapper.PeopleMapper;

@Component("peopleService")
public class PeopleService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void addPerson(People person) {
		PeopleMapper peopleMapper = sqlSession.getMapper(PeopleMapper.class);
		peopleMapper.insertPerson(person);
	}
	
	public People selcetPerson(String email) {
		PeopleMapper peopleMapper = sqlSession.getMapper(PeopleMapper.class);
		return peopleMapper.selectPerson(email);
	}
	public void editPerson(People person) {
		PeopleMapper peopleMapper = sqlSession.getMapper(PeopleMapper.class);
		peopleMapper.updatePerson(person);
	}
	public void outPerson(String email) {
		PeopleMapper peopleMapper = sqlSession.getMapper(PeopleMapper.class);
		peopleMapper.deletePerson(email);
	}
	
}
