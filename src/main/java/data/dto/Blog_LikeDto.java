package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Alias("Blog_LikeDto")
public class Blog_LikeDto {
    private int user_num;
    private int board_num;
    private int board_like;
    private int like_count;
    private int idx;
}
