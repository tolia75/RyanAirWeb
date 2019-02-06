package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DaoAeroport;
import dao.DaoEscale;
import dao.DaoVol;
import model.Aeroport;
import model.Vol;

@Controller
@RequestMapping("vol")
public class VolController {
	
	@Autowired
	private DaoVol daoVol;
	
	@Autowired
	private DaoEscale daoEscale;

	@Autowired
	private DaoAeroport daoAeorport;
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("vol/list");
		modelAndView.addObject("vols1", daoVol.findAllVolWithEscale());
		//modelAndView.addObject("vols", daoVol.findAll());
		return modelAndView;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam(name="id", required=true)Long id) {
		 daoVol.deleteByKey(id);
		return list();
	}
	
	@GetMapping("/editdepart")
	public ModelAndView editDepart(@RequestParam(name="id", required=true)Long id) {
		Integer i = 1;
		return goEdit(daoVol.findByKey(id),i);
	}
	
	@GetMapping("/editscale")
	public ModelAndView editEscale(@RequestParam(name="id", required=true)Long id) {
		Integer i = 2;
		return goEdit(daoVol.findByKey(id),i);
	}
	
	@GetMapping("/editarrivee")
	public ModelAndView editArrivee(@RequestParam(name="id", required=true)Long id) {
		Integer i = 3;
		return goEdit(daoVol.findByKey(id),i);
	}
	
	@GetMapping("/add")
	public ModelAndView add() {
		Vol vol = new Vol();
		Integer i =0;
		return goEdit(vol,i);
	}

	public ModelAndView goEdit(Vol vol, Integer i) {
		ModelAndView modelAndView = new ModelAndView("vol/edit");
		modelAndView.addObject("vol", vol);
		modelAndView.addObject("i", i);
		modelAndView.addObject("aeroports", daoAeorport.findAll());
		return modelAndView;
	}
	
	@GetMapping("/savedepart")
	public ModelAndView saveDepart(Vol vol, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return editDepart(vol.getId());
		}
		if	(vol.getDepart()!=null && vol.getDepart().getId()!=null) {
				vol.setDepart(null);
			}
		
		daoVol.update(vol);
		return list();
	}
	
	@GetMapping("/saveescale")
	public ModelAndView saveEscale(Vol vol, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return editEscale(vol.getId());
		}
		daoVol.update(vol);
		return list();
	}
	
	@GetMapping("/savearrivee")
	public ModelAndView saveArrivee(Vol vol, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return editArrivee(vol.getId());
		}
		Aeroport aeroport = vol.getArrivee();
		daoAeorport.update(aeroport);
		daoVol.update(vol);
		
		return list();
	}
	
	@GetMapping("/save")
	public ModelAndView save(Vol vol, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return editArrivee(vol.getId());
		}
		daoVol.insert(vol);	
		return list();
	}
	
}
