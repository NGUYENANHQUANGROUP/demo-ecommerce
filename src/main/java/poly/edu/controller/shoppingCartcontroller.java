package poly.edu.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import poly.edu.dao.ProductDAO;
import poly.edu.entity.Product;
import poly.edu.entity.Order;
import poly.edu.entity.OrderDetail;

import poly.edu.service.shoppingCartService;



@Controller
@RequestMapping("shoppingCart")
public class shoppingCartcontroller {

	@Autowired
	shoppingCartService shoppingCart;
	
	@Autowired
	ProductDAO productDAO;
	
	@GetMapping("view")
	public String viewCart(Model model) {
		Order order = shoppingCart.getCart();
		List<OrderDetail> ls = order.getLsOrderDetails();
		model.addAttribute("ORDER_DETAILS", ls);
		model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
		model.addAttribute("TOTAL_AMOUNT", order.getAmount());
		return "user/ViewCart";
	}


	@GetMapping("add/{id}")
	public ModelAndView addCart(@PathVariable("id") int id) {
	    Product product = productDAO.findById(id).get();
	    Order order = shoppingCart.getCart();
	    order.addOrderDetail(product);
	    List<OrderDetail> orderDetails = order.getLsOrderDetails();
	    double totalAmount = order.getAmount();
	    
	    ModelAndView modelAndView = new ModelAndView("forward:/store/view");
	    modelAndView.addObject("ORDER_DETAILS", orderDetails);
	    modelAndView.addObject("TOTAL_PRODUCT", order.getTotalProducts());
	    modelAndView.addObject("TOTAL_AMOUNT", totalAmount);
	    
	    return modelAndView;
	}
	
	@GetMapping("add")
	public ModelAndView addCartWithQty(@RequestParam("id") int id, @RequestParam("qty") int qty) {
	    Product product = productDAO.findById(id).get();
	    Order order = shoppingCart.getCart();
	    order.addOrderDetail(product, qty);
	    List<OrderDetail> orderDetails = order.getLsOrderDetails();
	    double totalAmount = order.getAmount();
	    
	    ModelAndView modelAndView = new ModelAndView("user/ProductDetail");
	    modelAndView.addObject("PRODUCT_DETAIL", product);
	    modelAndView.addObject("ORDER_DETAILS", orderDetails);
	    modelAndView.addObject("TOTAL_PRODUCT", order.getTotalProducts());
	    modelAndView.addObject("TOTAL_AMOUNT", totalAmount);
	    
	    return modelAndView;
	}
	

	
	@GetMapping("clear")
	public String clear() {
		Order order = shoppingCart.getCart();
		order.clear();
		return "redirect:/shoppingCart/view";
	}
	
	@GetMapping("remove/{id}")
	public String remove(@PathVariable("id") int id) {
		Product product = productDAO.findById(id).get();
		Order order = shoppingCart.getCart();
		order.removeOrderDetail(product);
		return "redirect:/shoppingCart/view";
	}
	
	
	
	@GetMapping("update")
	public String update(@RequestParam("id") int id, @RequestParam("qty") int qty) {
		Product product = productDAO.findById(id).get();
		Order order = shoppingCart.getCart();
		order.updateOrderDetail(product, qty);
		return "redirect:/shoppingCart/view";
	}
	
}
