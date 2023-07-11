package poly.edu.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.edu.dao.AccountDAO;
import poly.edu.entity.Account;
import poly.edu.entity.Order;
import poly.edu.entity.OrderDetail;
import poly.edu.service.cookieService;
import poly.edu.service.sessionService;
import poly.edu.service.shoppingCartService;
import poly.edu.service.uploadService;

@Controller
@RequestMapping("account")
public class accountController {

	@Autowired
	sessionService session;
	
	@Autowired
	cookieService cookie;
	
	@Autowired
	AccountDAO account;
	
	@Autowired
	shoppingCartService shoppingCart;
	
	@GetMapping("register")
	public String registerForm(Model model) {
		Order order = shoppingCart.getCart();
		List<OrderDetail> ls = order.getLsOrderDetails();
		model.addAttribute("ORDER_DETAILS", ls);
		model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
		model.addAttribute("TOTAL_AMOUNT", order.getAmount());
		model.addAttribute("ACCOUNT", new Account());
		return "user/Register";
	}
	
	@PostMapping("register")
	public String register(@Validated @ModelAttribute("ACCOUNT")Account ac,  BindingResult result, Model model,
								@RequestParam("image") MultipartFile multipartFile) throws IOException {
	
		if(result.hasErrors()) {
			return "user/Register";
		}
		if(account.findById(ac.getUsername()).isPresent()) {
			model.addAttribute("ERR_USER", "username already exists");
			return "user/Register";
		}
		if(!multipartFile.isEmpty()) {
			
			String uploadDir = "uploads/user_img/";
			
			String fileName = uploadService.saveFile(uploadDir,multipartFile);
			
			ac.setPhoto(fileName);
		}
		account.save(ac);
		model.addAttribute("ACCOUNT", new Account());
		return "user/Register";
	}
	

	
	
	
	@GetMapping("register/{username}")
	public String edit(@PathVariable("username") String username, Model model) {
		
		Optional<Account> ac = account.findById(username); 
		if(ac.isPresent()) {
			model.addAttribute("ACCOUNT", ac.get());
		}else {
			model.addAttribute("ACCOUNT", new Account());
		}
		return "Register";
	}
	
	@GetMapping("login")
	public String viewFormLogin(Model model) {
		String username = cookie.getValue("USERNAME", "");
		String password = cookie.getValue("PASSWORD", "");
		model.addAttribute("USERNAME", username);
		model.addAttribute("PASSWORD", password);
		Order order = shoppingCart.getCart();
		List<OrderDetail> ls = order.getLsOrderDetails();
		model.addAttribute("ORDER_DETAILS", ls);
		model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
		model.addAttribute("TOTAL_AMOUNT", order.getAmount());
		return "Login";
	}
	@PostMapping("login")
	public String login(Model model, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam(value = "remember", required = false) String remember) {
		try {
			Account acc = account.findById(username).get();
			if(!acc.getPassword().equals(password)) {
				model.addAttribute("MESSAGE", "password is invalid");
				return "Login";
			}else {
				String uri = session.get("security_uri");
				if(uri !=null) {
					return "redirect:"+uri;
				}else {
					session.set("ACCOUNT", acc );
					if (remember != null) {
	                    cookie.add("USERNAME", username, 240);
	                    cookie.add("PASSWORD", password, 240);
	                } else {
	                    cookie.remove("USERNAME");
	                    cookie.remove("PASSWORD");
	                }
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("MESSAGE", "username is invalid");
			return "redirect:/account/login";
		}
		return "redirect:/store/view";
	}
	
	@GetMapping("logout")
	public String logout() {
		session.remove("ACCOUNT");
		return "redirect:/account/login";
	}
	
}
