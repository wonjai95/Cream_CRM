package com.spring.Creamy_CRM.User_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;

@Repository
public class UserReviewDAOImpl implements UserReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<ReservationVO> getReservationList(String id) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReservationList",id);
	}

	//한건의 예약정보 받아오기
	@Override
	public ReservationVO getReservationDetail(String res_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReservationDetail",res_code);
	}

	@Override
	public int InsertReview(ReviewVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.User_dao.UserReviewDAO.InsertReview",vo);
	}

	@Override
	public int modifyresCheck(String res_code) {
		return sqlSession.update("com.spring.Creamy_CRM.User_dao.UserReviewDAO.modifyresCheck",res_code);
	}

	@Override
	public List<ReviewVO> getMyReviewList(String user_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getMyReviewList",user_code);
	}

	@Override
	public List<ReviewVO> getAllReviewList() {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getAllReviewList");
	}

	@Override
	public List<ReviewVO> getStoreReviewList(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getStoreReviewList",host_code);
	}

	@Override
	public List<ReservationVO> getUserReservationlist(String user_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getUserReservationlist",user_code);
	}

	@Override
	public ReviewVO getReviewDetail(String review_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReviewDetail",review_code);
	}

	@Override
	public int plusReadCnt(Map<String, Object> map) {
		return sqlSession.update("com.spring.Creamy_CRM.User_dao.UserReviewDAO.plusReadCnt",map);
	}

	@Override
	public int modify_Review(ReviewVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.User_dao.UserReviewDAO.modify_Review",vo);
	}
	
}
