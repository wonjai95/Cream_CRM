/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 로그인 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.mail.javamail.JavaMailSender;

import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;
import com.spring.Creamy_CRM.VO.userVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//회원상세정보 
	@Override
	public Map<String, Object> selectUser(String id) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.selectUser",id);
	}

	//이메일인증테이블 insert
	@Override
	public int insertAuth(Map<String, String> map) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.loginDAO.insertAuth",map);
	}
	
	//로그인 체크
	@Override
	public int confirmIdPwd(Map<String, String> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.confirmIdPwd",map);
	}

	//우편번호 조회 
	@Override
	public int getZipcodeCount(Map<String, String> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.getZipcodeCount",map);
	}

	//우편번호 insert
	@Override
	public int insertZipcode(Map<String, String> map) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.loginDAO.insertZipcode",map);
	}

	//회원가입
	@Override
	public int insertUserinfo(userVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.loginDAO.insertUserinfo",vo);
	}
	
	//이메일 전송
	@Override
	public void sendMail(String email, String key) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요." 

			+ "<a href='http://localhost/Creamy_CRM/emailChk?key=" + key + "'>link</a>";
            System.out.println(txt);
          message.setSubject("회원가입 인증 메일입니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@mss.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(email));
          mailSender.send(message);
		}catch(Exception e){
		          e.printStackTrace();
		}  
		
	}

	@Override
	public userVO getUserInfo(String id) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.getUserInfo",id);
	}

	@Override
	public HostVO getHostInfo(String id) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.getHostInfo",id);
	}

	@Override
	public ZipcodeVO selectzipcode(String zipcode) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.selectzipcode",zipcode);
	}

	@Override
	public int modifyPw(Map<String, String> map) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.loginDAO.modifyPw",map);
	}

	
	@Override
	public int updateUserInfo(userVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.loginDAO.updateUserInfo",vo);
	}

	//사장님 회원가입 host_seq
	@Override
	public int insertHost(HostVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.loginDAO.insertHost",vo);
	}

	@Override
	public int DupIdcheck(String id) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.DupIdcheck",id);
	}

	@Override
	public List<ReservationVO> getResListbyStore(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.loginDAO.getResListbyStore",host_code); 
	}

	@Override
	public List<ReservationVO> getTodayResListByStore(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.loginDAO.getTodayResListByStore",host_code);
	}

	@Override
	public List<userVO> getTodayUserList() {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.loginDAO.getTodayUserList");
	}

	@Override
	public int updateUserInfo_notWedding(userVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.loginDAO.updateUserInfo_notWedding", vo);
	}
	

}
