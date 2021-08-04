package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Payment;

public interface PaymentDao {

	/**
	 * 결제정보를 전달받아서 데이터베이스에 저장한다.
	 * @param payment 저장할 결제정보
	 */
	void insertPayment(Payment payment);
	
	/**
	 * 결제정보의 상태를 변경한다.
	 * @param payment 변경된 결제정보를 담고있는 Payment 객체
	 */
	void updatePaymentStatus(Payment payment);
	
	/**
	 * 사용자 아이디를 전달받아 해당하는 결제정보 리스트들을 반환한다.
	 * @param userId 사용자 아이디
	 * @return 사용자의 결제정보들
	 */
	List<Payment> getPaymentsByUserId(String userId);
	
	/**
	 * 결제코드를 전달받에서 해당하는 결제정보를 반환한다.
	 * @param paymentCode 결제코드
	 * @return 결제정보
	 */
	Payment getPaymentByCode(String paymentCode);
	
	int getUserTotalPayment(String userId);
}
