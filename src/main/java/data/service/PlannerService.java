package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.PageDto;
import data.dto.PlannerDto;
import data.mapper.PlannerMapper;

@Service
public class PlannerService {
	@Autowired
	PlannerMapper mapper;
	// Create
	public void createPage(int page_num, int planner_num, String content) {
		mapper.createPage(page_num, planner_num, content);
	}
	public void createPlanner(PlannerDto dto) {
		mapper.createPlanner(dto);
	}
	public void setParticipent(int planner_num, int user_num) {
		mapper.setParticipent(planner_num, user_num);
	}
	
	// Read
	public int pageNumCount(int planner_num) {
		return mapper.pageNumCount(planner_num);
	}
	public PageDto getPage(int page_num, int planner_num) {
		return mapper.getPage(page_num, planner_num);
	}
	public PlannerDto getPlanner(int planner_num) {
		return mapper.getPlanner(planner_num);
	}
	public List<PlannerDto> getUserPlanner(int user_num) {
		return mapper.getUserPlanner(user_num);
	}
	public String pageLastUpdate(int page_num, int planner_num) {
		return mapper.pageLastUpdate(page_num, planner_num);
	}
	
	// Update
	public void updatePage(int planner_num, int page_num, String content) {
		mapper.updatePage(planner_num, page_num, content);
	}
	public void updatePlanner(int planner_num) {
		mapper.updatePlanner(planner_num);
	}
	
	// Delete
	public void deletePage(int page_num, int planner_num) {
		mapper.deletePage(page_num, planner_num);
	}
	public void deletePlanner(int planner_num) {
		mapper.deletePlanner(planner_num);
	}
}
