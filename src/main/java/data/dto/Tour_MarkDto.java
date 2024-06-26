package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("Tour_MarkDto")
public class Tour_MarkDto {
    private int idx;
    private String id;
    private String title;
    private String photo;
    private String serial_num;
    private String link;
    private String phone_num;
}
