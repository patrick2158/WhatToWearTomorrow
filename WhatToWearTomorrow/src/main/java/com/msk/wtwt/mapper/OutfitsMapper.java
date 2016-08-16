package com.msk.wtwt.mapper;

import java.util.List;

import com.msk.wtwt.dto.Outfits;
import com.msk.wtwt.dto.Share;

public interface OutfitsMapper {
	void insertOutfit(Outfits outfit);
	List<Outfits> selectByEmail(String email);
	List<Share> selectByShare();
	void updateOutfit(Outfits outfit);
	void deleteOutfit(int outfit_num);
}