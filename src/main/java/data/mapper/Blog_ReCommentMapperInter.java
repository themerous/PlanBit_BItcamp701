package data.mapper;

import data.dto.Blog_AnswerDto;
import data.dto.Blog_ReCommentDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Blog_ReCommentMapperInter {

    @Insert("""
            insert into blog_re_comment (comment_num,user_id,content,writeday) values (#{comment_num},#{user_id},#{content},now())
            """)
    public void insertReComment(Blog_ReCommentDto dto);

    @Select("select * from blog_re_comment where comment_num=#{num} order by aidx desc")
    public List<Blog_ReCommentDto> getReCommentData(int num);

    @Delete("delete from blog_re_comment where aidx=#{aidx}")
    public void deleteReComment(int aidx);
}
