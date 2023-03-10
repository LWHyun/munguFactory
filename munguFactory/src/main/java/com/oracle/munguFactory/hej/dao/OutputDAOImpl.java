package com.oracle.munguFactory.hej.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.OutputDTO;
import com.oracle.munguFactory.dto.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class OutputDAOImpl implements OutputDAO {

	/* MyBatis DB 연동 */
	private final SqlSession session;

	@Override
	public int totalOutput() {
		int totOutputCnt = 0;
		System.out.println("OutputDAOImpl Start Total");
		
		try {
			totOutputCnt = session.selectOne("outputTotal");
			System.out.println("OutputDAOImpl totalOutput totOutputCnt -> " + totOutputCnt);
			
		} catch (Exception e) {
			System.out.println("OutputDAOImpl totalEmp Exception -> " + e.getMessage());
		}
		return totOutputCnt;
	}
	// 생산실적 목록
	@Override
	public List<OutputDTO> outputList(OutputDTO output) {
		System.out.println("- OutputDAOImpl outputList Start -");
		
		List<OutputDTO> outputList = null;
		
		try {
			outputList = session.selectList("outputList", output);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl outputList Exception -> " + e.getMessage());
		}
		
		return outputList;
	}
	// 생산실적 상세 정보
	@Override
	public OutputDTO outputDetail(int prod_no) {
		System.out.println("- OutputDAOImpl outputDetail Start -");
		
		OutputDTO output = new OutputDTO();
		
		try {
			output = session.selectOne("outputDetail", prod_no);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl outputDetail Exception -> " + e.getMessage());
		}
		
		return output;
	}
	
	
	// 생산실적 등록
	@Override
	public int insertOutput(OutputDTO output) {
		System.out.println("- OutputDAOImpl insert Start -");
		
		int result = 0;
		
		try {
			result = session.insert("insertOutput", output);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl insert Exception -> " + e.getMessage());
		}
		
		return result;
	}
	// 생산실적 수정
	@Override
	public int updateOutput(OutputDTO output) {
		log.info("- OutputDAOImpl getEmpList Start -");
		
		int updateCnt = 0;
		
		try {
			updateCnt = session.update("updateOutput", output);
			log.info("output -> " + updateCnt);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl updateOutput Exception -> " + e.getMessage());
		}
		
		return updateCnt;
	}
	// 생산실적 삭제
	@Override
	public int deleteOutput(OutputDTO prod_no) {
		log.info("- OutputDAOImpl delete Start -");
		
		int result = 0;
		
		try {
			result = session.delete("deleteOutput", prod_no);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl delete Exception -> " + e.getMessage());
		}
		
		return result;
	}

	// 생산실적 관련 조회
	@Override
	public List<OutputDTO> outputSearchList(OutputDTO output) {
		System.out.println("- OutputDAOImpl outputSearchList Start -");
		
		List<OutputDTO> outputSearchList = null;
		
		try {
			// keyword 검색
			outputSearchList = session.selectList("outputSearchList", output);
			System.out.println("outputSearchList -> " + outputSearchList);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl outputSearchList Exception -> " + e.getMessage());
		}
		return outputSearchList;
	}
	
	// select option용
	// 공장 목록
	@Override
	public List<FactoryDTO> getFactoryList() {
		//System.out.println("- OutputDAOImpl getFactoryList Start -");
		
		List<FactoryDTO> result = null;
		
		try {
			result = session.selectList("factoryList");
		} catch (Exception e) {
			System.out.println("OutputDAOImpl getFactoryList Exception -> " + e.getMessage());
		}
		return result;
	}
	// 사원 목록
	@Override
	public List<EmpDTO> getEmpList() {
		//System.out.println("- OutputDAOImpl getEmpList Start -");
		
		List<EmpDTO> result = null;
		
		try {
			result = session.selectList("empList");
		} catch (Exception e) {
			System.out.println("OutputDAOImpl getEmpList Exception -> " + e.getMessage());
		}
		return result;
	}
	
	
	
	@Override
	public int getOutputListSize(PageDTO searchOptions) {
		log.info("- getOutputListSize() start -");
		
		int result = 0;
		
		try {
			result = session.selectOne("getOutputList", searchOptions);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl getOutputList Exception -> " + e.getMessage());
		}
		
		return result;
	}
	@Override
	public List<OutputDTO> getOutputList(PageDTO paging) {
		log.info("getOutputList() start...");
		
		List<OutputDTO> result = null;
		
		try {
			result = session.selectList("getOutputList", paging);
		} catch (Exception e) {
			System.out.println("getOutputList e.getMessage() : "+e.getMessage());
		}
		
		return result;
	}
	@Override
	public int insertOutputSubul(OutputDTO output) {
		System.out.println("- OutputDAOImpl insertOutputSubul Start -");
		
		int result = 0;
		
		try {
			result = session.insert("insertOutputSubul", output);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl insertOutputSubul Exception -> " + e.getMessage());
		}
		
		return result;
	}
	@Override
	public int plusOutputStorage(OutputDTO output) {
		System.out.println("- OutputDAOImpl updateOutputStorage Start -");
		
		int updateCnt = 0;
		
		try {
			updateCnt = session.update("plusOutputStorage", output);
			log.info("output -> " + updateCnt);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl updateOutputStorage Exception -> " + e.getMessage());
		}
		
		return updateCnt;
	}
	@Override
	public int updateOutputSubul(OutputDTO output) {
		System.out.println("- OutputDAOImpl updateOutputSubul Start -");
		
		int updateCnt = 0;
		
		try {
			updateCnt = session.update("updateOutputSubul", output);
			log.info("output -> " + updateCnt);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl updateOutputSubul Exception -> " + e.getMessage());
		}
		
		return updateCnt;
	}
	@Override
	public int updateStorageOutput(OutputDTO output) {
		System.out.println("- OutputDAOImpl updateStorageOutput Start -");
		
		int updateCnt = 0;
		
		try {
			updateCnt = session.update("updateStorageOutput", output);
			log.info("output -> " + updateCnt);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl updateStorageOutput Exception -> " + e.getMessage());
		}
		
		return updateCnt;
	}
}
