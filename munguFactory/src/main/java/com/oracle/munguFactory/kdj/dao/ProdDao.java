package com.oracle.munguFactory.kdj.dao;

import java.util.List;

import com.oracle.munguFactory.dto.ProdDTO;

public interface ProdDao {
	//paging
	int totalProdCnt();
	//List조회
	List<ProdDTO> listProd(ProdDTO prodDto);
	//수정 조회	
	ProdDTO ContentModProd(int suju_no, int item_no);
	//수정update
	int modContent(ProdDTO prodDto);
	//delete
	ProdDTO delete(ProdDTO prodDto);
	

}
