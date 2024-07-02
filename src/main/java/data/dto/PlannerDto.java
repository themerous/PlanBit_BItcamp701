package data.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PlannerDto {
	private int planner_num;
	private int planner_creator;
	private String planner_title;
	private String planner_detail;
	private Timestamp last_update;
}