package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.DaoVol;

@Controller
@RequestMapping("vol")
public class VolController {
	
	@Autowired
	private DaoVol daoVol;
	
	@GetMapping("/list")
	public ModelAndView list() {
		return new ModelAndView("vol/vol", "vols", daoVol.findAll());
	}
}
