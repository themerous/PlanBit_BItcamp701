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

    public List<Tour_MarkDto> findByMark(String id, int provider) {
        return tour_MarkMapperInter.findByMark(id, provider);
    }

    public int checkBySerialNum(String id, int user_num, String serialNum) {
        return tour_MarkMapperInter.checkBySerialNum(id, user_num, serialNum);
    }

    public void insert(String id, int user_num, String title, String addr, String photo, String serial_num, String link, String phone_num) {
        System.out.println("in");
        tour_MarkMapperInter.insert(id, user_num, title, addr, photo, serial_num, link, phone_num);
    }

    public void deleteBySerialNum(String id, int user_num, String serial_num){
        tour_MarkMapperInter.deleteBySerialNum(id, user_num, serial_num);
    }
}
