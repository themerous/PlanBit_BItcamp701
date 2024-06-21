package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;

@Service
public class BoardService {
	@Autowired
	private BoardMapperInter bInter;
	//게시판 만들기
	public void insertboard(BoardDto dto)
	{
		int num = bInter.insertboard(dto);
		System.out.println(num);
	}
	public void updateboard(BoardDto dto)
	{
		bInter.updateboard(dto);
	}
	public void updatemap(BoardDto dto)
	{
		bInter.updatemap(dto);
	}
}
