package com.msk.wtwt.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.msk.wtwt.dto.Items;
import com.msk.wtwt.mapper.ItemsMapper;

@Component("itemsService")
public class ItemsService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void addItem(Items item) {
		ItemsMapper itemsMapper  = sqlSession.getMapper(ItemsMapper.class);
		itemsMapper.insertItem(item);
	}
	
	public List<Items> selcetByEmail(String email) {
		ItemsMapper itemsMapper  = sqlSession.getMapper(ItemsMapper.class);
		return itemsMapper.selectByEmail(email);
	}
	public void editItem(Items item) {
		ItemsMapper itemsMapper  = sqlSession.getMapper(ItemsMapper.class);
		itemsMapper.updateItem(item);
	}
	public void deleteItem(int item_num) {
		ItemsMapper itemsMapper  = sqlSession.getMapper(ItemsMapper.class);
		itemsMapper.deleteItem(item_num);
	}
}