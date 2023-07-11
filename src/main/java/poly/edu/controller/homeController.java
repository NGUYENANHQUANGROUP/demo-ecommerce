package poly.edu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.entity.Order;
import poly.edu.entity.OrderDetail;
import poly.edu.service.shoppingCartService;



@Controller

public class homeController {
	
	@Autowired
	shoppingCartService shoppingCart;

	@RequestMapping("home")
	public String home(Model model) {
		Order order = shoppingCart.getCart();
		List<OrderDetail> orderDetails = order.getLsOrderDetails();
		model.addAttribute("ORDER_DETAILS", orderDetails);
		model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
		model.addAttribute("TOTAL_AMOUNT", order.getAmount());
		return "user/index";
	}
	
}
