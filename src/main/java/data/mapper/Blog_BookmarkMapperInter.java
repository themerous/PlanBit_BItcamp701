package data.mapper;

import data.dto.Blog_BookmarkDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Blog_BookmarkMapperInter {

    @Select("select board_num from blog_bookmark where user_num = #{user_num}")
    List<Integer> getBookMarkALlByUserNum(int user_num);


    @Select("SELECT board_num FROM blog_bookmark WHERE user_num = #{user_num}")
    List<Long> getBookmarkedBoardIds(int user_num);

    @Insert("INSERT INTO blog_bookmark (user_num, board_num) VALUES (#{user_num}, #{boardNum})")
    void insertFavorite(int user_num, int boardNum);

    @Delete("DELETE FROM blog_bookmark WHERE user_num = #{user_num} AND board_num = #{boardNum}")
    void deleteFavorite(int user_num, int boardNum);

    @Select("SELECT COUNT(*) > 0 FROM blog_bookmark WHERE user_num = #{user_num} AND board_num = #{boardNum}")
    boolean isFavoriteExists(int user_num, int boardNum);

    @Insert({
            "INSERT INTO blog_bookmark (user_num, board_num) VALUES (#{user_num}, #{boardNum}) ",
            "ON DUPLICATE KEY UPDATE user_num = VALUES(user_num), board_num = VALUES(board_num)"
    })
    void toggleFavorite(@Param("user_num") int user_num, @Param("boardNum") int boardNum);
}
