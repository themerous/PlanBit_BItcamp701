package data.service;

import data.dto.Tour_MarkDto;
import data.mapper.Tour_MarkMapperInter;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Tour_MarkService {
    Tour_MarkMapperInter tour_MarkMapperInter;

    public List<Tour_MarkDto> findByMark(String id) {
        return tour_MarkMapperInter.findByMark(id);
    }
}
