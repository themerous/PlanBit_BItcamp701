package data.mapper;

import data.dto.Tour_MarkDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Tour_MarkMapperInter {
    @Select("select * from tour_mark where id=#{id}")
    List<Tour_MarkDto> findByMark(String id);

    @Insert("insert into tour_mark (id, title, photo, seiral_num) values(#{id}, #{title}, #{photo}, #{serial_num})")
    void insert(Tour_MarkDto tour_MarkDto);

    @Update("update from tour_mark set link=#{link} where id = #{id} and seiral_num = #{serial_num}")
    void updateLink(String link, String id, String serial_num);

    @Update("update from tour_mark set phone_num=#{phone_num} where id = #{id} and seiral_num = #{serial_num}")
    void updatePhoneNum(String link, String id, String serial_num);

    @Delete("delete from tour_mark where phone_num=#{phone_num} and serial_num = #{serial_num}")
    void deleteBySerialNum(String id, String serial_num);
}
