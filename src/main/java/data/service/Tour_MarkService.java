package data.service;

import data.dto.Tour_MarkDto;
import data.mapper.Tour_MarkMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Tour_MarkService {
    @Autowired
    Tour_MarkMapperInter tour_MarkMapperInter;

    public List<Tour_MarkDto> findByMark(String id) {
        return tour_MarkMapperInter.findByMark(id);
    }

    public int checkBySerialNum(String id, String serialNum) {
        return tour_MarkMapperInter.checkBySerialNum(id, serialNum);
    }

    public void insert(String id, String title, String photo, String serial_num, String link, String phone_num) {
        System.out.println("in");
        tour_MarkMapperInter.insert(id, title, photo, serial_num, link, phone_num);
    }

    public void deleteBySerialNum(String id, String serial_num){
        tour_MarkMapperInter.deleteBySerialNum(id, serial_num);
    }
}
