package com.oracle.munguFactory.hej.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.OutputDTO;
import com.oracle.munguFactory.dto.PageDTO;

@Service
public interface OutputService {

	int totalOutput();

	List<OutputDTO> outputList(OutputDTO output);		// 생산실적 목록
	OutputDTO outputDetail(int prod_no);				// 생산실적 상세 정보

	int insertOutput(OutputDTO output);					// 생산실적 등록
	int updateOutput(OutputDTO output);					// 생산실적 수정 (공장코드,사원번호만)
	int deleteOutput(OutputDTO prod_no);				// 생산실적 삭제
	List<OutputDTO> listSearchOutput(OutputDTO output);	// 생산실적 조회

	// select option용
	List<FactoryDTO> factorySelect();				// 공장 목록
	List<EmpDTO> 	 empSelect();					// 사원 목록

	int getOutputListSize(PageDTO searchOptions);
	List<OutputDTO> getOutputList(PageDTO paging);





	

}
