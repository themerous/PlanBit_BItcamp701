package data.service;

import data.dto.Blog_AnswerDto;
import data.dto.Blog_ReCommentDto;
import data.mapper.Blog_AnswerMapperInter;
import data.mapper.Blog_ReCommentMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Blog_ReCommentService {
    @Autowired
    private Blog_ReCommentMapperInter reInter;

    public void insertReComment(Blog_ReCommentDto dto){
        reInter.insertReComment(dto);
    }
    public List<Blog_ReCommentDto> getReCommentData(int num){

        return reInter.getReCommentData(num);
    }
    public void deleteReComment(int idx){
        reInter.deleteReComment(idx);
    }



}