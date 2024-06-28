package data.mapper;

import data.dto.Blog_MapDto;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface Blog_MapMapperInter {


    public void insertBoard(Blog_MapDto dto);

    public Blog_MapDto selectMap(int map_num);

    public void updateMapDto(Blog_MapDto Dto);
}
