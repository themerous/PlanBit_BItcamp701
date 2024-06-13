package team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.dto.UserDto;
import team.mapper.UserMapperInter;

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
}
