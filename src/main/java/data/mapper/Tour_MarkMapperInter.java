package data.mapper;

import data.dto.Tour_MarkDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Tour_MarkMapperInter {
    @Select("select * from tour_mark where id=#{id}")
    List<Tour_MarkDto> findByMark(String id);

    @Select("select count(*) from tour_mark where id = #{id} and serial_num = #{serial_num}")
    int checkBySerialNum(String id, String serial_num);

    @Insert("insert into tour_mark (id, title, addr, photo, serial_num, link, phone_num, mark_time) values(#{id}, #{title}, #{addr}, #{photo}, #{serial_num},#{link}, #{phone_num}, now())")
    void insert(String id, String title, String addr, String photo, String serial_num, String link, String phone_num);

    @Delete("delete from tour_mark where id=#{id} and serial_num = #{serial_num}")
    void deleteBySerialNum(String id, String serial_num);
}
