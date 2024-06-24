package data.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Alias("Blog_MapDto")
public class Blog_MapDto {
    private int map_num;

    private String placeNames;
    private String placeAddress;
    private String placeLatitudes;
    private String placeLongitudes;

}
