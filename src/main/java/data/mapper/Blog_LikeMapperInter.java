package data.mapper;

import data.dto.Blog_LikeDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Blog_LikeMapperInter {

  int checkLikeExists(Blog_LikeDto likeDto);
  Blog_LikeDto selectUserLike(int board_num, int user_num);
  void insertLike(Blog_LikeDto likeDto);
  void incrementLike(Blog_LikeDto likeDto);
  int selectLikeCount(int boardNum);
}
