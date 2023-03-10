package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.Paging;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ItemAdminDaoImpl implements ItemAdminDao {
	private final SqlSession session;

	//ItemAdminList
	@Override
	public List<ItemDTO> itemAdminList(Paging page) {
//		List<ItemDTO> itemAdminList = session.selectList("jhy_itemAdminList");
		List<ItemDTO> itemAdminList = null;
		try {
			itemAdminList = session.selectList("jhy_itemAdminListPaging", page);
//			itemAdminList = session.selectList("jhy_itemAdminList");
		} catch (Exception e) {
			System.out.println("itemAdminList exception -> " + e.getMessage());
		}
		return itemAdminList;
		
	}

	//ItemAdminSelect
	@Override
	public List<ItemDTO> itemAdminSelect(ItemDTO itemDto) {
		List<ItemDTO> itemAdminSelect = session.selectList("jhy_itemAdminSelect", itemDto);
		return itemAdminSelect;
	}

	//ItemAdminInsert
	@Override
	public List<FactoryDTO> getFactoryList() {
		List<FactoryDTO> getFactoryList = session.selectList("jhy_getFactoryList");
		return getFactoryList;
	}
	@Override
	public int itemAdminInsert(ItemDTO itemDto) {
		int itemAdminInsert = session.insert("jhy_itemAdminInsert", itemDto);
		return itemAdminInsert;
	}

	//ItemAdminUpdate
	@Override
	public List<ItemDTO> itemAdminUpSelect(ItemDTO itemDto) {
		List<ItemDTO> itemAdminUpSelect = session.selectList("jhy_itemAdminUpSelect", itemDto);
		return itemAdminUpSelect;
	}
	@Override
	public int itemAdminUpdate(ItemDTO itemDto) {
		int itemAdminUpdate = session.update("jhy_itemAdminUpdate", itemDto);
		return itemAdminUpdate;
	}

	//ItemAdminDelete
	@Override
	public int itemAdminDelete(ItemDTO itemDto) {
		int itemAdminDelete = session.delete("jhy_itemAdminDelete", itemDto);
		return itemAdminDelete;
	}

	//Paging
	@Override
	public int totalCount() {
		int totalCount = 0;
		try {
			Integer objTotalCount = session.selectOne("jhy_totalCount");
			totalCount = objTotalCount.intValue();
			System.out.println("totalCount->" + totalCount);
		} catch (Exception e) {
			System.out.println("totalCount exception->" + e.getMessage());
		}
		return totalCount;
	}



}
