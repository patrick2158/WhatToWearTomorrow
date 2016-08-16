package com.msk.wtwt.mapper;

import java.util.List;

import com.msk.wtwt.dto.People;

public interface PeopleMapper {
	void insertPerson(People person);
	People selectPerson(String email);
	List<People> selectPersonByName(String name);
	void updatePerson(People person);
	void deletePerson(String email);
}
