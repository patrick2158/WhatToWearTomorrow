package com.msk.wtwt.mapper;

import java.util.List;

import com.msk.wtwt.dto.Items;

public interface ItemsMapper {
	void insertItem(Items item);
	List<Items> selectByEmail(String email);
	void updateItem(Items item);
	void deleteItem(int item_num);
}