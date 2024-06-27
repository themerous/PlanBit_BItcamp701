package data.mapper;

import data.dto.Blog_AnswerDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Blog_AnswerMapperInter {

    @Insert("""
            insert into blog_comment (num,user_id,content,writeday) values (#{num},#{user_id},#{content},now())
            """)
    public void insertAnswer(Blog_AnswerDto dto);

    @Select("select * from blog_comment where num=#{num} order by aidx desc")
    public List<Blog_AnswerDto> getAnswerData(int num);

    @Delete("delete from blog_comment where aidx=#{aidx}")
    public void deleteAnswer(int aidx);
}
