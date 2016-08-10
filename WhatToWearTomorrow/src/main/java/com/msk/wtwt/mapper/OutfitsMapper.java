package com.msk.wtwt.mapper;

import java.util.List;

import com.msk.wtwt.dto.Outfits;

public interface OutfitsMapper {
	void insertOutfit(Outfits outfit);
	List<Outfits> selectByEmail(String email);
	void updateOutfit(Outfits outfit);
	void deleteOutfit(int outfit_num);
}