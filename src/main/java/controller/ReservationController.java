package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoReservation;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private DaoReservation daoReservation;
	
	

}
