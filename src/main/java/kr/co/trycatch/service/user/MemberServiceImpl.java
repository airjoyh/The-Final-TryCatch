
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
			sendMail.setSubject("Try Catch ȸ������ ���� �����Դϴ�.");// �߼۵Ǵ� �̸��� ����
			sendMail.setText(new StringBuffer().append("<h1>Try Catch ȸ�������� ���ϵ帳�ϴ�.</h1><hr>")
					.append(member_id + "�� ȸ�� ���� ����帳�ϴ�.<br>").append("���� �ڵ�� " + key + "�Դϴ�.<br>").toString());
	
		}else if(type.equals("changePass")) {
			sendMail.setSubject("Try Catch ���ã�� ���� �����Դϴ�.");// �߼۵Ǵ� �̸��� ����
			sendMail.setText(new StringBuffer().append("<h1>Try Catchȸ�� ��й�ȣ ã�� �����ڵ��Դϴ�.</h1><hr>")
					.append(member_id+"���� ���� �ڵ�� " + key + "�Դϴ�.<br>").toString());
		}
		sendMail.setFrom("jyhjy1201", "TryCatch");// ������ �̸����� ���̵�, ������ �̸����� �ۼ��ڸ�
		sendMail.setTo(member_id);// �޴»�� �̸���
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
		String authCode = memberDao.authCode(member_id);// ��ȸ�� authCode

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

		System.out.println("1�� ������ �ð� >>> " + registDate);
		System.out.println("���� �ð� >>> " + sysDate);
		System.out.println("�νð��� ���� >>> " + (sysDate - registDate));

		// 60�ʰ� ������ �����ϵ��� �Ǿ��ִµ� ��� �̰� �ʿ��Ѱ�? ������ 60�� ������ �����ϰ� �Ͽ���.
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
		System.out.println("��й�ȣ ������ ���̵� >>> "+id);
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
