package data.service;

import data.dto.Blog_AnswerDto;
import data.mapper.Blog_AnswerMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Blog_AnswerService {
    @Autowired
    private Blog_AnswerMapperInter anInter;

    public void insertAnswer(Blog_AnswerDto dto){
        anInter.insertAnswer(dto);
    }
    public List<Blog_AnswerDto> getAnswerData(int num){

        return anInter.getAnswerData(num);
    }
    public void deleteAnswer(int idx){
        anInter.deleteAnswer(idx);
    }



}
