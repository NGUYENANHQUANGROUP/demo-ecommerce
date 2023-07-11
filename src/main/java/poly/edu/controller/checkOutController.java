package poly.edu.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.dao.AccountDAO;
import poly.edu.dao.OrderDAO;
import poly.edu.dao.OrderDetailDAO;
import poly.edu.entity.Account;
import poly.edu.entity.MailInfo;
import poly.edu.entity.Order;
import poly.edu.entity.OrderDetail;
import poly.edu.service.MailerService;
import poly.edu.service.sessionService;
import poly.edu.service.shoppingCartService;

@Controller
@RequestMapping("checkout")

public class checkOutController {
	
	@Autowired
	sessionService session;
	
	@Autowired
	AccountDAO accountDao;
	
	@Autowired
	shoppingCartService shoppingCart;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@Autowired
	MailerService mailer;
	
	@GetMapping("view")
	public String view(Model model) {
		
		
		Account acc = session.get("ACCOUNT");
		model.addAttribute("ACCOUNT", acc);
		
		Order order = shoppingCart.getCart();
		List<OrderDetail> orderDetails = order.getLsOrderDetails();
		Double total = order.getAmount();
		model.addAttribute("ORDER_DETAILS", orderDetails);
		model.addAttribute("TOTAL_AMOUNT", total);
		model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
		return "user/CheckOut";
	}
	
	@GetMapping("submit")
	public String submit(@RequestParam(value = "address", defaultValue = "") String address, @RequestParam(value = "email", defaultValue = "") String email, Model model) {
		if(address.isEmpty()) {
			model.addAttribute("ERR_ADRESS", "vui lòng nhập địa chỉ giao hàng");
			return "forward:/checkout/view";
		}
		
		if(email.isEmpty()) {
			model.addAttribute("ERR_ADRESS", "vui lòng nhập địa chỉ Email");
			return "forward:/checkout/view";
		}
		
		Account acc = session.get("ACCOUNT");
		
		Order order = shoppingCart.getCart();
		if(order.getLsOrderDetails().isEmpty()) {
			model.addAttribute("MESSAGE", "vui lòng thêm sản phẩm vào giỏ hàng");
			return "forward:/checkout/view";
		}
		order.setAccount(acc);
		order.setAdress(address);
		orderDao.save(order);
		order.clear();
		
		MailInfo mail = new MailInfo();
		mail.setTo(email);
		//Gửi mail
		mailer.queue(mail);
		model.addAttribute("MESSAGE", "Đặt hàng thành công, vui lòng kiểm tra Email");
		return "forward:/checkout/view";
	}
	
}
