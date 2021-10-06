package com.spring.Creamy_CRM.User_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;
import com.spring.Creamy_CRM.VO.outReviewVO;

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

	@Override
	public List<ReviewVO> getReviewSearch_title(Map<String, String> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReviewSearch_title",map);
	}

	@Override
	public List<ReviewVO> getReviewSearch_user(Map<String, String> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReviewSearch_user",map);
	}

	@Override
	public List<ReviewVO> getReviewSearch_date(Map<String, String> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.User_dao.UserReviewDAO.getReviewSearch_date",map);
	}

	@Override
	public int addOutReview(outReviewVO vo) {
		int insertCnt = sqlSession.insert("com.spring.Creamy_CRM.User_dao.UserReviewDAO.addOutReview",vo);
		
		if(insertCnt > 0)
			insertCnt = addDetailOutReview(vo);
		
		return insertCnt; 
	}

	@Override
	public int addDetailOutReview(outReviewVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.User_dao.UserReviewDAO.addDetailOutReview",vo);
	}

	@Override
	public List<outReviewVO> getOutreviewList(String host_code) {
		return sqlSession.getMapper(UserReviewDAO.class).getOutreviewList(host_code);
	}

	@Override
	public List<outReviewVO> getGraphOutreviewList(String code) {
		return sqlSession.getMapper(UserReviewDAO.class).getGraphOutreviewList(code);
	}

	@Override
	public int getGraphCount() {
		return sqlSession.getMapper(UserReviewDAO.class).getGraphCount();
	}

	@Override
	public int insertDetail_ranknotnull(outReviewVO vo) {
		return sqlSession.getMapper(UserReviewDAO.class).insertDetail_ranknotnull(vo);
	}

	@Override
	public int updateOutreview_rankout(outReviewVO vo) {
		insertDetail_ranknotnull(vo);
		return sqlSession.getMapper(UserReviewDAO.class).updateOutreview_rankout(vo);
	}

	@Override
	public int updateOutreview_MaxrankIn(outReviewVO vo) {
		insertDetail_ranknotnull(vo);
		return sqlSession.getMapper(UserReviewDAO.class).updateOutreview_MaxrankIn(vo);
	}

	@Override
	public List<outReviewVO> getUpdateOutreviewList(String host_code) {
		return sqlSession.getMapper(UserReviewDAO.class).getUpdateOutreviewList(host_code);
	}

	@Override
	public int deleteOutreview(String code) {
		return sqlSession.getMapper(UserReviewDAO.class).deleteOutreview(code);
	}

	
}
