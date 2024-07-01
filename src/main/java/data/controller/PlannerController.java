package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.PageDto;
import data.dto.PlannerDto;
import data.service.PlannerService;

@Controller
public class PlannerController {
	@Autowired
	private PlannerService service;
	
	@GetMapping("/planner")
	public String PlannerList(
			@RequestParam String user_id,
			@RequestParam String provider,
			Model model) {
		model.addAttribute("user_id", user_id);
		model.addAttribute("provider", provider);
		return "planner/list";
	}
	@ResponseBody
	@DeleteMapping("/planner")
	public void DeletePlanner(
			@RequestParam int planner_num) {
		service.deletePlanner(planner_num);
	}

	@ResponseBody
	@GetMapping("/planner/page/list")
	public int ListPage(@RequestParam int planner_num) {
		int pageCount = service.pageNumCount(planner_num);
		return pageCount;
	}
	@ResponseBody
	@GetMapping("/planner/page/time")
	public String LastUpdate(
			@RequestParam int planner_num,
			@RequestParam int page_num) {
		return service.pageLastUpdate(page_num, planner_num);
	}
	
	@GetMapping("/planner/page") 
	public String PlannerPage(
			@RequestParam int planner_num,
			@RequestParam int page_num,
			Model model) {
		PageDto dto = service.getPage(page_num, planner_num);
		PlannerDto dto2 = service.getPlanner(planner_num);
		model.addAttribute("dto", dto);
		model.addAttribute("title", dto2.getPlanner_title());
		return "planner/page";
	}
	
	@ResponseBody
	@PostMapping("/planner/page")
	public void CreatePage(
			@RequestParam int planner_num,
			@RequestParam int page_num) {
		service.createPage(page_num, planner_num, "");
	}
	@ResponseBody
	@PutMapping("/planner/page")
	public void UpdatePage(
			@RequestParam int planner_num,
			@RequestParam int page_num,
			@RequestParam String content) {
		service.updatePage(planner_num, page_num, content);
	}
	@ResponseBody
	@DeleteMapping("/planner/page")
	public void DeletePage(
			@RequestParam int planner_num,
			@RequestParam int page_num) {
		service.deletePage(page_num, planner_num);
	}
	
}