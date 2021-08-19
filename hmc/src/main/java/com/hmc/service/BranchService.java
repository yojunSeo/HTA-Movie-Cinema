package com.hmc.service;

import java.util.List;

import com.hmc.dto.BranchDetailDto;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;

public interface BranchService {
	
	/**
	 * 모든 지점 정보를 반환하는 메서드
	 * @return Branch VO 리스트
	 */
	List<Branch> getAllBranch();
	
	/**
	 * 지점코드로 검색된 지점의 dto를 반환하는 매서드
	 * @param branchCode 지점코드
	 * @return BranchDTO
	 */
	BranchDetailDto getBranchDetailByCode(String branchCode);
	
	/**
	 * 지점코드로 검색된 지점을 반환하는 메서드
	 * @param branchCode 지점코드
	 * @return BranchVO
	 */
	Branch getBranchByCode(String branchCode);
	
	/**
	 * DB에 등록된 모든 시설 정보를 받아오는 메서드
	 * @return FacilityVO 리스트
	 */
	List<Facility> getAllFacility();
	
	/**
	 * 해당지점이 나의 영화관인지 아닌지 판별해주는 메서드
	 * @param branchCode 지점코드
	 * @param userId 로그인한 유저 ID
	 * @return 판별결과
	 */
	Boolean isFaveriteBranch(String branchCode, String userId);
	
	/**
	 * 지점 정보를 업데이트 해주는 매서드
	 * 관리자 지점관리에서 사용
	 * @param branch 업데이트할 지점 정보가 담긴 Branch VO
	 */
	void updateBranch(Branch branch);
}
