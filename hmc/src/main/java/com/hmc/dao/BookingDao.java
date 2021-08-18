package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Booking;
import com.hmc.vo.BookingDetail;

public interface BookingDao {

	/**
	 * 예매정보를 데이터베이스에 저장한다.
	 * @param booking 저장할 예매정보
	 */
	void insertBooking(Booking booking);
	
	/**
	 * 예매정보를 수정한다.
	 * @param bookingCode 
	 */
	void updateBookingStatus(String bookingCode);
	
	/**
	 * 사용자 아이디를 전달받아서 사용자의 예매내역을 반환한다.
	 * @param userId 사용자아이디
	 * @return 사용자의 예매내역
	 */
	List<Booking> getBookingsByUserId(String userId);
	
	/**
	 * 예매코드를 전달받아서 해당하는 예매정보를 반환한다.
	 * @param bookingCode 예매코드
	 * @return 해당하는 예매정보
	 */
	Booking getBookingByCode(String bookingCode);
	
	List<Map<String, Object>> getBookingDetailsByUserId(String userId);
	
	List<Map<String, Object>> getBookingPageByUser(Map<String, Object> param);
	
	int getBookingCntByUserId(String userId);
	
	void insertBookingDetail(BookingDetail bookedDetail);
	
	void deleteBookingDetail(String bookingCode);
	
	Map<String, Object> getBookingDetailByBookingCode(String bookingCode);
}
