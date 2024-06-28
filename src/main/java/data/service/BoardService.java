package data.service;

import data.dto.Blog_BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;

import java.util.List;

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
	//블로그 리스트 가져오기
	public List<Blog_BoardDto> gettestboardlist() {
		return bInter.gettestboardlist();
	}
	//검색 블로그 리스트 가져오기
	public List<Blog_BoardDto> searchBoard(String category, String query) {
		return bInter.searchBoard(category, query);
	}

	public Blog_BoardDto getTopViewedBoard() {
		return bInter.findTopViewedBoard();
	}


}
