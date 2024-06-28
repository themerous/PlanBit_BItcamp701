package data.service;

import data.dto.Blog_BoardDto;
import data.mapper.Blog_BoardMapperInter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Blog_BoardService {
    @NonNull
    private Blog_BoardMapperInter boardMapper;

    public int getMaxNum()
    {
        return boardMapper.getMaxNum();
    }

//    public void updateRestep(int regroup,int restep)
//    {
//        Map<String, Integer> map=new HashMap<>();
//        map.put("regroup", regroup);
//        map.put("restep", restep);
//
//        boardMapper.updateRestep(map);
//    }

    public void insertBoard(Blog_BoardDto dto)
    {
        //db 에 insert
        boardMapper.insertBoard(dto);
    }

    public int getTotalCount()
    {
        return boardMapper.getTotalCount();
    }

    public List<Blog_BoardDto> getPagingList(int start,int perpage)
    {
        Map<String, Integer> map=new HashMap<>();
        map.put("start", start);
        map.put("perpage", perpage);

        return boardMapper.getPagingList(map);
    }

    public void updateReadcount(int board_num)
    {
        boardMapper.updateReadcount(board_num);
    }

    public Blog_BoardDto getData(int board_num)
    {
        return boardMapper.getData(board_num);
    }
    public void updateBoard(Blog_BoardDto dto){
        boardMapper.updateBoard(dto);
    }
        public void deleteBoard(int board_num){

            boardMapper.deleteBoard(board_num);
        }
    public void incrementlikes(int board_num) {
        boardMapper.incrementlikes(board_num);
    }

    public Blog_BoardDto getBoardByIdx(int board_num) {
        return boardMapper.getDataidx(board_num);
    }
    public List<Blog_BoardDto> userDataID(int user_num){
        return boardMapper.userDataID(user_num);
    }



}