
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
		List<MemberVO> list = memberDao.selectMember();
		if (list.size() == 0) {
			memberDao.createUser(memberVo);
			sendEmail(memberVo.getMember_id());
			state = "registNew";
			
		} else {

			for (int i = 0; i < list.size(); i++) {
				System.out.println("MemberServiceImpl registerUser() for�� ������?");
				String id = list.get(i).getMember_id();
				String authStatus = list.get(i).getUser_authStatus();
				
				if (memberVo.getMember_id().equals(id) && authStatus.equals("Y")) {
					state = "registComplete";
					break;
				} else if (memberVo.getMember_id().equals(id) && authStatus.equals("N")) {
					state = "noEmailConfirm";
					break;
				} else {
					memberDao.createUser(memberVo);
					sendEmail(memberVo.getMember_id());
					state = "registNew";
					break;
				}
			}
		}
		return state;
	}

	@Override
	public void sendEmail(String member_id) throws Exception {
		String key = new TempKey().getKey(10, false);

		memberDao.createAuthCode(member_id, key);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("Try Catch ȸ������ ���� �����Դϴ�.");// �߼۵Ǵ� �̸��� ����
		sendMail.setText(new StringBuffer().append("<h1>Try Catch ȸ�������� ���ϵ帳�ϴ�.</h1><hr>")
				.append(member_id + "�� ȸ�� ���� ����帳�ϴ�.<br>").append("���� �ڵ�� " + key + "�Դϴ�.<br>").toString());
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

	@Transactional
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
	public List<MemberVO> selectMember() throws Exception {

		return memberDao.selectMember();
	}

	@Override
	public MemberVO login(String member_id, String member_pass) throws Exception {

		return memberDao.loginUser(member_id, member_pass);
	}

	@Transactional
	@Override
	public void removeRegist(String member_id) throws Exception {

		int registDate = Integer.parseInt(memberDao.registDate(member_id));
		int sysDate = Integer.parseInt(memberDao.sysDate(member_id));

		System.out.println("1�� ������ �ð� >>> " + registDate);
		System.out.println("���� �ð� >>> " + sysDate);
		System.out.println("�νð��� ���� >>> " + (sysDate - registDate));

		// 60�ʰ� ������ �����ϵ��� �Ǿ��ִµ� ��� �̰� �ʿ��Ѱ�? ������ 60�� ������ �����ϰ� �Ͽ���.
		if ((sysDate - registDate) > 60) {
			memberDao.deleteRegist(member_id);
		}

	}

	@Override
	public void changePass(String member_id, String member_pass) throws Exception {

		memberDao.updatePass(member_id, member_pass);
	}

}
