package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlannerController {
	@GetMapping("/planner/list")
	public String PlannerList() {
		return "planner/list";
	}
	
	@GetMapping("/planner/page") 
	public String PlannerPage(
			@RequestParam int planner_num,
			@RequestParam int page_num,
			Model model) {
		model.addAttribute("planner_num", planner_num);
		model.addAttribute("page_num", page_num);
		return "planner/page";
	}
	
	@PostMapping("/planner/page")
	public void CreatePage() {
		
	}
	@PutMapping("/planner/page")
	public void UpdatePage() {
		
	}
	@DeleteMapping("/planner/page")
	public void DeletePage() {
		
	}
	
}