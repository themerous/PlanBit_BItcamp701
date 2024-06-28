package data.mapper;

import data.dto.Blog_BoardDto;
import org.apache.ibatis.annotations.*;

import data.dto.BoardDto;

import java.util.List;

@Mapper
public interface BoardMapperInter {
	@Insert("insert into testboard (id) values (#{id})")
	@Options(useGeneratedKeys = true, keyProperty = "board_num") 
	public int insertboard(BoardDto dto);
	@Update("update testboard set title=#{title},img=#{img},content=#{content} where board_num=#{board_num}")
	public void updateboard(BoardDto dto);
	@Update("update testboard set lat=#{lat},lng=#{lng},addr=#{addr},mapname=#{mapname} where board_num=#{board_num}")
	public void updatemap(BoardDto dto);

	@Select("select * from blog_board order by board_num desc")
	List<Blog_BoardDto> gettestboardlist();

	@Select("<script>" +
			"SELECT * FROM blog_board " +
			"WHERE " +
			"<if test='category == \"title\"'>board_title</if>" +
			"<if test='category == \"content\"'>board_content</if>" +
			"<if test='category == \"author\"'>user_id</if>" +
			" LIKE CONCAT('%', #{query}, '%')" +
			"</script>")
	List<Blog_BoardDto> searchBoard(@Param("category") String category, @Param("query") String query);


	@Select("SELECT * FROM blog_board ORDER BY board_views DESC LIMIT 1")
	Blog_BoardDto findTopViewedBoard();
}
