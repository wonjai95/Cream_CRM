package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.OperatingScheVO;
import com.spring.Creamy_CRM.VO.RoomSettingVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;

@Repository
public class HostDaoImpl implements HostDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//호스트 정보
	@Override
	public HostVO selectInfo(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.selectInfo",host_code);
	}


	@Override
	public List<OperatingScheVO> getWorkTime(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.HostDao.getWorkTime", host_code);
	}


	@Override
	public int chkScheSet(Map<String, String> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.chkScheSet",map);
	}

	@Override
	public int setOeratingTime(OperatingScheVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.HostDao.setOeratingTime",vo);
	}

	@Override
	public int altOperatingTime(OperatingScheVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.HostDao.altOperatingTime",vo);
	}

	//zip코드 존재확인
	@Override
	public int chkZipcode(String zipcode) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.chkZipcode", zipcode);
	}
	
	//zip코드 삽입
	@Override
	public int insertZipcode(ZipcodeVO zipcodeVo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.HostDao.insertZipcode",zipcodeVo);
	}

	//사업자 등록
	@Override
	public int insertCompany(HostVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.HostDao.insertCompany", vo);
	}
	
	//호실 이름 중복확인
	@Override
	public int chkRoomName(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.chkRoomName", map);
	}

	//호실 등록
	@Override
	public int insertRoom(RoomSettingVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.HostDao.insertRoom",vo);
	}
	
	//등록한 호실 정보 or 상세 요청
	@Override
	public RoomSettingVO getRoom(RoomSettingVO vo) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.getRoom",vo);
	}

	//호실 리스트
	@Override
	public List<RoomSettingVO> selectRoomList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.HostDao.selectRoomList", map);
	}

	//호실 개수
	@Override
	public int roomCnt(RoomSettingVO vo) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.HostDao.roomCnt", vo);
	}

	
	
	
	
	
}
