package data.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import data.dto.PageDto;
import data.dto.PlannerDto;

@Mapper
public interface PlannerMapper {
	// Create
	@Insert("insert into planner_page (page_num, planner_num, page_date, content) value (#{page_num},#{planner_num}, now(), #{content})")
	public void createPage(int page_num, int planner_num, String content);
	
	
	// Read
	@Select("select count(*) from planner_page where planner_num = #{planner_num}")
	public int pageNumCount(int planner_num);
	@Select("select * from planner_page where planner_num = #{planner_num} and page_num = #{page_num}")
	public PageDto getPage(int page_num, int planner_num);
	@Select("select * from planner_board where planner_num = #{planner_num}")
	public PlannerDto getPlanner(int planner_num);
	@Select("select page_date from planner_page where planner_num = #{planner_num} and page_num = #{page_num}")
	public String pageLastUpdate(int page_num, int planner_num);
	
	// Update
	@Update("""
				update planner_page set content = #{content}, page_date = now() 
				where planner_num=#{planner_num} and page_num=#{page_num}
			""")
	public void updatePage(int planner_num, int page_num, String content);
	
	// Delete
	@Delete("delete from planner_page where page_num = #{page_num} and planner_num = #{planner_num}")
	public void deletePage(int page_num, int planner_num);
	@Delete("delete from planner_board where planner_num = #{planner_num}")
	public void deletePlanner(int planner_num);
}
