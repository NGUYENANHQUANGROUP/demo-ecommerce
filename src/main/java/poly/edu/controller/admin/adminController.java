package poly.edu.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.dao.AccountDAO;

@Controller
@RequestMapping("admin")
public class adminController {
	
	@Autowired
	AccountDAO account;
	
	@GetMapping("dashboard")
	public String dashBoard() {
		
		return "admin/ViewProducts";
	}
	
	@GetMapping("user")
	public String view(Model model) {
		
		model.addAttribute("ACCOUNTS", account.findAll());
		return"admin/ViewAccounts";
	}
	
	@GetMapping(value = "user", params = "btnDel")
	public String delAccount(@RequestParam("username") String username) {
		
		account.deleteById(username);
		return "redirect:/admin/user";
	}
}
