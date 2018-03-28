
package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;
import javax.xml.bind.attachment.AttachmentUnmarshaller;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.common.MailHandler;
import kr.co.trycatch.common.TempKey;
import kr.co.trycatch.domain.user.MemberVO;
import kr.co.trycatch.persistence.user.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDao;

	@Inject
	private JavaMailSender mailSender;

	@Transactional
	@Override
	public String registUser(MemberVO memberVo) throws Exception {

		System.out.println("member_id >>> "+memberVo.getMember_id());
		String state = "";
		if(memberDao.member(memberVo.getMember_id())==null) {
			memberDao.createUser(memberVo);
			sendEmail(memberVo.getMember_id(), "register");
			state = "registNew";
			System.out.println("state = "+state);
			
		}else {
			memberVo = memberDao.member(memberVo.getMember_id());
			String authStatus = memberVo.getUser_authStatus();
			if(authStatus.equals("Y")) {
				state = "registComplete";
				System.out.println("state = registComplete");
			}else if(authStatus.equals("N")) {
				state = "noEmailConfirm";
				System.out.println("state = noEmailConfirm");
			}
		}
		
		return state;
	}

	@Override
	public void sendEmail(String member_id, String type) throws Exception {
		String key = new TempKey().getKey(10, false);

		memberDao.createAuthCode(member_id, key);
		MailHandler sendMail = new MailHandler(mailSender);
		
		if(type.equals("register")) {
			sendMail.setSubject("Try Catch 회원가입 인증 메일입니다.");// 발송되는 이메일 제목
			sendMail.setText(new StringBuffer().append("<h1>Try Catch 회원가입을 축하드립니다.</h1><hr>")
					.append(member_id + "님 회원 가입 감사드립니다.<br>").append("인증 코드는 " + key + "입니다.<br>").toString());
	
		}else if(type.equals("changePass")) {
			sendMail.setSubject("Try Catch 비번찾기 인증 메일입니다.");// 발송되는 이메일 제목
			sendMail.setText(new StringBuffer().append("<h1>Try Catch회원 비밀번호 찾기 인증코드입니다.</h1><hr>")
					.append(member_id+"님의 인증 코드는 " + key + "입니다.<br>").toString());
		}
		sendMail.setFrom("jyhjy1201", "TryCatch");// 보내는 이메일의 아이디, 보내는 이메일의 작성자명
		sendMail.setTo(member_id);// 받는사람 이메일
		sendMail.send();
	}

	@Override
	public String authCode(String member_id) throws Exception {

		return memberDao.authCode(member_id);
	}

	@Override
	public String authStatus(String member_id) throws Exception {

		return memberDao.authStatus(member_id);
	}

	@Override
	public String changeAuthStatus(String member_id, String user_authCode) throws Exception {
		String state = "";
		String authCode = memberDao.authCode(member_id);// 조회된 authCode

		if (user_authCode.equals(authCode)) {
			memberDao.updateAuthStatus(member_id);
			state = "success";
		} else {
			state = "fail";
		}
		return state;

	}

	@Override
	public List<MemberVO> memberAll() throws Exception {

		return memberDao.memberAll();
	}
	
	@Override
	public MemberVO member(String member_id) throws Exception {
		
		return memberDao.member(member_id);
	}

	@Override
	public MemberVO login(String member_id, String member_pass) throws Exception {

		return memberDao.loginUser(member_id, member_pass);
	}

	@Transactional
	@Override
	public void removeRegist(String member_id) throws Exception {

		double registDate = Double.parseDouble(memberDao.registDate(member_id));
		double sysDate = Double.parseDouble(memberDao.sysDate(member_id));

		System.out.println("1차 가입한 시간 >>> " + registDate);
		System.out.println("현재 시간 >>> " + sysDate);
		System.out.println("두시간의 차이 >>> " + (sysDate - registDate));

		// 60초가 지나면 삭제하도록 되어있는데 사실 이게 필요한가? 어차피 60초 지나고 삭제하게 하였다.
		if ((sysDate - registDate) > 60) {
			memberDao.deleteRegist(member_id);
		}

	}

	@Override
	public String findUser(String member_id) throws Exception {
		String state = "";
		MemberVO memberVo = memberDao.member(member_id);
		if(memberVo==null) {
			state="noFindUser";
		}else {
			state="findUser";
			sendEmail(member_id, "changePass");
		}
		
		return state;
	}
	
	@Override
	public String changePass(MemberVO memberVo) throws Exception {
		String state = "";
		String authCode = memberDao.authCode(memberVo.getMember_id());
		String id = memberVo.getMember_id();
		System.out.println("비밀번호 변경할 아이디 >>> "+id);
		String authStatus = memberDao.authStatus(id);
		if(memberDao.member(id) != null) {
			
			if(authCode.equals(memberVo.getUser_authCode())) {
				if(authStatus.equals("Y")) {
					memberDao.updatePass(memberVo.getMember_id(), memberVo.getMember_pass());
					state = "success";
				}else {
					state = "noFindUser";
				}
			}else {
				state="fail";
			}
		}else {
			state = "noFindUser";
		}
		
		return state;
	}


	

}
