package data.service;

import data.dto.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.mapper.UserMapperInter;

import java.util.List;

@Service
public class UserService {
	@Autowired
	private UserMapperInter uInter;
	//회원가입 이벤트
	public void insertUser(UserDto dto)
	{
		uInter.insertUser(dto);
	}
	//로그인 이벤트
	public boolean logincheck(String id, String pw)
	{
		return uInter.logincheck(id, pw)==1?true:false;
	}
	//아이디 중복확인
	public int idcheckcount(String searchid)
	{
		return uInter.idcheckcount(searchid);
	}


}
