package org.spring.my.service;

import javax.mail.MessagingException;

public interface MailSendService {
	public String sendAuthMail(String email, String userid) throws MessagingException;
}
