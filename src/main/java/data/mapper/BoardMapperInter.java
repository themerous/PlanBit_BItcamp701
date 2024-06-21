package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Update;

import data.dto.BoardDto;

@Mapper
public interface BoardMapperInter {
	@Insert("insert into testboard (id) values (#{id})")
	@Options(useGeneratedKeys = true, keyProperty = "board_num") 
	public int insertboard(BoardDto dto);
	@Update("update testboard set title=#{title},img=#{img},content=#{content} where board_num=#{board_num}")
	public void updateboard(BoardDto dto);
	@Update("update testboard set lat=#{lat},lng=#{lng},addr=#{addr},mapname=#{mapname} where board_num=#{board_num}")
	public void updatemap(BoardDto dto);
}
