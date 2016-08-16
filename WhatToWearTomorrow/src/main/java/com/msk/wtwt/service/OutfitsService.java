package com.msk.wtwt.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.msk.wtwt.dto.Outfits;
import com.msk.wtwt.dto.Share;
import com.msk.wtwt.mapper.OutfitsMapper;

@Component("outfitsService")
public class OutfitsService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void addOutfit(Outfits outfit) {
		OutfitsMapper outfitsMapper  = sqlSession.getMapper(OutfitsMapper.class);
		outfitsMapper.insertOutfit(outfit);
	}
	
	public List<Outfits> selcetByEmail(String email) {
		OutfitsMapper outfitsMapper  = sqlSession.getMapper(OutfitsMapper.class);
		return outfitsMapper.selectByEmail(email);
	}
	
	public List<Share> selcetByShare() {
		OutfitsMapper outfitsMapper  = sqlSession.getMapper(OutfitsMapper.class);
		return outfitsMapper.selectByShare();
	}

	
	public void editOutfit(Outfits outfit) {
		OutfitsMapper outfitsMapper  = sqlSession.getMapper(OutfitsMapper.class);
		outfitsMapper.updateOutfit(outfit);
	}
	public void deleteItem(int outfit_num) {
		OutfitsMapper outfitsMapper  = sqlSession.getMapper(OutfitsMapper.class);
		outfitsMapper.deleteOutfit(outfit_num);
	}
}