package com.msk.wtwt.mapper;

import com.msk.wtwt.dto.People;

public interface PeopleMapper {
	void insertPerson(People person);
	People selectPerson(String email);
	void updatePerson(People person);
	void deletePerson(String email);
}
