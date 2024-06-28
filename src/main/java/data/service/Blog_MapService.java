package data.service;

import data.dto.Blog_MapDto;
import data.mapper.Blog_MapMapperInter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class Blog_MapService {
    @NonNull
    private Blog_MapMapperInter mapMapper;



    public void insertBoard(Blog_MapDto dto)
    {
        //db 에 insert
        mapMapper.insertBoard(dto);
    }

    public Blog_MapDto selectMap(int map_num){
        return mapMapper.selectMap(map_num);
    }
    public void updateMapData(Blog_MapDto dto) {
        mapMapper.updateMapDto(dto);
    }




}