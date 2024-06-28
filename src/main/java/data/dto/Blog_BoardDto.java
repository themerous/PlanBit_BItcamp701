package data.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Alias("Blog_BoardDto")
public class Blog_BoardDto {
    private int board_num;
    private String user_id;
    private String board_title;
    private String board_content;
    private int board_like;
    private int board_views;
    private String photo;
    private Timestamp board_writeday;
    private int user_num;


    private String placeNames;
    private String placeAddress;
    private String placeLatitudes;
    private String placeLongitudes;

}
