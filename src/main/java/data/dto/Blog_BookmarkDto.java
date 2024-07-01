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
@Alias("Blog_BookmarkDto")
public class Blog_BookmarkDto {

        private int user_nun;
        private int board_num;

        private Timestamp addTime; //북마크를 추가한시ㅣ간
}
