package data.mapper;

import data.dto.Blog_BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface Blog_BoardMapperInter {


    public void insertBoard(Blog_BoardDto dto);

    public int getMaxNum();

    public Blog_BoardDto getData(int board_num);

    public List<Blog_BoardDto> getPagingList(Map<String,Integer> map);

    public int getTotalCount();

    public void updateReadcount(int board_num);

    public void updateBoard(Blog_BoardDto dto);

    public void deleteBoard(int board_num);

    public Blog_BoardDto getDataidx(int board_num);

    public List<Blog_BoardDto> userDataID(int user_num);

    public void incrementlikes(int board_num);


}
