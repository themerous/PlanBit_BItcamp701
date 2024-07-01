package data.mapper;

import data.dto.Tour_MarkDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Tour_MarkMapperInter {
    @Select("select * from tour_mark where id=#{id} and user_num=#{user_num}")
    List<Tour_MarkDto> findByMark(String id, int user_num);

    @Select("select count(*) from tour_mark where id = #{id} and user_num=#{user_num} and serial_num = #{serial_num}")
    int checkBySerialNum(String id, int user_num, String serial_num);

    @Insert("insert into tour_mark (id, user_num, title, addr, photo, serial_num, link, phone_num, mark_time) values(#{id}, #{user_num}, #{title}, #{addr}, #{photo}, #{serial_num},#{link}, #{phone_num}, now())")
    void insert(String id, int user_num, String title, String addr, String photo, String serial_num, String link, String phone_num);

    @Delete("delete from tour_mark where id=#{id} and user_num=#{user_num} and serial_num = #{serial_num}")
    void deleteBySerialNum(String id, int user_num, String serial_num);
}
