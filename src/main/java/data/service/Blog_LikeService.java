package data.service;

import data.dto.Blog_LikeDto;
import data.mapper.Blog_LikeMapperInter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class Blog_LikeService {
    @Autowired
    private Blog_LikeMapperInter blogLikeMapper;

    public void addOrUpdateLike(Blog_LikeDto likeDto) {
        Blog_LikeDto existingLike = blogLikeMapper.selectUserLike(likeDto.getBoard_num(), likeDto.getUser_id());
        if (existingLike == null) {
            likeDto.setLike_count(1);
            blogLikeMapper.insertLike(likeDto);
        } else if (existingLike.getLike_count() < 3) {
            blogLikeMapper.incrementLike(likeDto);
        } else {
            throw new RuntimeException("Like limit exceeded for user");
        }
    }

    public int getLikeCount(int board_num) {
        return blogLikeMapper.selectLikeCount(board_num);
    }

    public Blog_LikeDto getUserLike(int board_num, String user_id) {
        return blogLikeMapper.selectUserLike(board_num, user_id);
    }

}
