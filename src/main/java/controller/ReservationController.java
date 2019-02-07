package controller;

import javax.persistence.metamodel.SetAttribute;
import javax.validation.Valid;

import org.hibernate.engine.jdbc.connections.internal.DatasourceConnectionProviderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DaoPassager;
import dao.DaoReservation;
import dao.DaoVol;
import model.Passager;
import model.Reservation;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private DaoReservation daoReservation;

	@Autowired
	private DaoPassager daoPassager;
	


	@GetMapping("/list")
	public ModelAndView list() {
		return new ModelAndView("reservation/list", "reservations", daoReservation.findAll());

	}

	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "id") Long id) {
		daoReservation.deleteByKey(id);
		;
		return new ModelAndView("redirect:/reservation/list");

	}

	private ModelAndView goEdit(Reservation reservation) {
		return new ModelAndView("reservation/edit", "reservation", reservation);
	}

	@GetMapping("/edit")
	public ModelAndView edit(@RequestParam(name = "id") Long id) {
		return goEdit(daoReservation.findByKey(id));
	}

	@GetMapping("/add")
	public ModelAndView add() {
		return goEdit(new Reservation());
	}

	@PostMapping("/save")
	public ModelAndView save(@Valid @ModelAttribute("reservation") Reservation reservation) {
		
		daoReservation.update(reservation);
		return new ModelAndView("redirect:/reservation/list");
	}

	@GetMapping("/detailPassager")
	public ModelAndView detailPassager(@RequestParam(name = "id") Long id) { // attention convertion int/long
		ModelAndView modelAndView = new ModelAndView("reservation/passager", "passager", daoPassager.findByKey(id));
		String action = "detail";
		modelAndView.addObject("action", action);
		return modelAndView;
	}

	@PostMapping("/editPassager")
	public ModelAndView editPassager(@ModelAttribute("passager") Passager passager) {
		String action = "edit";
		ModelAndView modelAndView = new ModelAndView("reservation/passager");
		modelAndView.addObject("action", action);
		modelAndView.addObject("passager", passager);
		return modelAndView;
	}
	
	@PostMapping("/savePassager")
	public ModelAndView savePassager(@ModelAttribute("passager") Passager passager) {
		daoPassager.update(passager);
		return list();
	}
}