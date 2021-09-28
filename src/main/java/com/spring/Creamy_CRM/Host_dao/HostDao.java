package com.spring.Creamy_CRM.Host_dao;

import java.util.List; 
import java.util.Map;

import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.OperatingScheVO;
import com.spring.Creamy_CRM.VO.RoomSettingVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;

public interface HostDao {
	
	
	//호스트 정보
	HostVO selectInfo(String host_code);
	
	List<OperatingScheVO> getWorkTime(String host_code);
	
	
	int chkScheSet(Map<String, String> map);
	int setOeratingTime(OperatingScheVO vo);
	int altOperatingTime(OperatingScheVO vo);
	
	//zip코드 존재확인
	int chkZipcode(String zipcode);
	
	//zip코드 삽입
	int insertZipcode(ZipcodeVO zipcodeVo);
	
	//사업자정보 등록
	int insertCompany(HostVO vo);
	
	//호실 이름 중복확인
	int chkRoomName(Map<String, Object> map);
	
	//호실 이름 중복확인
	int insertRoom(RoomSettingVO vo);

	//호실 리스트
	List<RoomSettingVO> selectRoomList(String host_code);
	
	
}
