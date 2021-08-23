package org.spring.my.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendServiceImpl implements MailSendService{
	
	//root-context에서 만들어진 객체 자동 주입
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//인증키 생성 메소드(6자리 인증번호 반환)
	private String getAuthCode() {
		StringBuffer authCode = new StringBuffer();
		Random random = new Random();

		while(authCode.length() <6) { //또는 for(int i = 0; i <6, i++)
			authCode.append(random.nextInt(10));
		}
		return authCode.toString();
	}

	@Override
	public String sendAuthMail(String email, String userid) throws MessagingException {
		//6자리 난수 인증번호 생성
		String authCode = getAuthCode();
		
		//보낼 메일 내용(웹상에서 열리기 때문에 html형식으로 작성)
		StringBuffer mailContent = new StringBuffer();
		mailContent.append("<h2>이메일 인증</h2>");
		mailContent.append(userid+"님 안녕하세요<br>");
		mailContent.append("이메일 계정을 인증받으시려면 아래 링크를 클릭해주세요.<br>");
		mailContent.append("<a href ='http://localhost:8081/my/member/joinConfirm");
		mailContent.append("?userid="+userid+"&authCode="+authCode+"'>이메일 인증</a>");
		
		//System.out.println(mailContent.toString());
		
		//인증메일 객체 만들기
		MimeMessage mimeMsg = mailSender.createMimeMessage();//메세지 객체를 생성
		mimeMsg.setSubject("[Project Test]이메일계정인증", "utf-8"); //메세지의 제목
		mimeMsg.setText(mailContent.toString(), "utf-8", "html"); //메세지의 내용
		mimeMsg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));//수신자메일정보
		
		//메일 보내기
		mailSender.send(mimeMsg);
		
		//난수인증번호 리턴하기(추후 해당 유저가 위 인증번호를 받았는지 인증하는 용도)
		return authCode;
	}

}
