package data.service;

import data.dto.Blog_BoardDto;
import data.dto.Blog_BookmarkDto;
import data.mapper.Blog_BookmarkMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Blog_BookmarkService {

    @Autowired
    private Blog_BookmarkMapperInter BKmapper;

    public List<Integer> getBookMarkALlByUserNum(int userNum) {
        return BKmapper.getBookMarkALlByUserNum(userNum);
    }

    public List<Long> getBookmarkedBoardIds(int user_num) {
        return BKmapper.getBookmarkedBoardIds(user_num);
    }

    public void toggleFavorite(int user_num, int boardNum) {
        BKmapper.toggleFavorite(user_num, boardNum);
    }
    public  void deleteFavorite(int user_num, int boardNum){
        BKmapper.deleteFavorite(user_num,boardNum);
    }
}
