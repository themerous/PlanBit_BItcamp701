package data.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailService {
	private final JavaMailSender javamailsender; //의존성으로 객체 가져옴
	private static final String senderEmail = "gim28711@gmail.com"; //보내는 이메일
	private static int num; //랜덤 인증 코드
		
	//랜덤 인증 코드 생성
	public static void createNumber() {
		// (int) Math.random() * (최댓값-최소값+1) + 최소값
		num = (int)(Math.random() * (90000)) + 100000;
	}
	//메일 양식 작성 
	public MimeMessage createEmail(String mail) {
		createNumber(); //인증 코드 생성
		MimeMessage msg = javamailsender.createMimeMessage();
		
		try {
			msg.setFrom(senderEmail);
			msg.setRecipients(MimeMessage.RecipientType.TO, mail); //보낼 이메일 설정
			msg.setSubject("[BIT TRIP] 아이디를 찾기 위한 이메일 인증"); //보낼 제목
			String body = "";
			body += "<div style='background: linear-gradient(to right, #51e3d4, #19B3FF); padding: 20px;'>";
			body += "<h1>" + "안녕하세요." + "</h1>";
			body += "<h1>" + "[BIT TRIP] 입니다." + "</h1>";
			body += "<h3>" + "아이디를 찾기 위한 요청하신 인증 번호입니다." + "</h3><br>";
			body += "<h2>" + "아래 코드를 아이디찾기 창으로 돌아가 입력해주세요." + "</h2>";
			
			body += "<div align='center' style='font-family: verdana; padding: 10px; border-radius: 4px; background-color: rgba(255, 255, 255, 0.8);'>";
			body += "<h2>" + "아이디찾기 인증 코드입니다." + "</h2>";
			body += "<h1 style='color: #51e3d4'>" + num + "</h1>";
			body += "</div><br>";
			body += "<h2>" + "감사합니다!" + "</h2>";
			msg.setText(body,"UTF-8","html");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	//실제 메일 주소
	public int sendEmail(String mail) {
		//메일 전송에 필요한 정보 설정
		MimeMessage msg = createEmail(mail);
		//실제 메일 전송
		javamailsender.send(msg);
		//인증 코드 반환
		return num;
	}
}
