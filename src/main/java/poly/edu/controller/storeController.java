package poly.edu.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import poly.edu.dao.ProductDAO;
import poly.edu.entity.Order;
import poly.edu.entity.Account;
import poly.edu.entity.OrderDetail;
import poly.edu.entity.Product;
import poly.edu.service.sessionService;
import poly.edu.service.shoppingCartService;

@Controller
@RequestMapping("store")
public class storeController {
	@Autowired
	sessionService session;

	@Autowired
	shoppingCartService shoppingCart;

	@Autowired
	ProductDAO productDAO;

	@GetMapping("view")
	public String viewStore(Model model, @RequestParam(value = "category") Optional<String> Category,
			@RequestParam(value = "keyword") Optional<String> kw,
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "p", required = false) Integer p) {

		String ct = Category.orElse(session.get("category", "all"));
		session.set("category", ct);

		String kwords = kw.orElse(session.get("keyword", ""));
		session.set("keyword", kwords);

		Sort.Direction sortDirection = Sort.Direction.DESC; // Sắp xếp theo hướng giảm dần (mặc định)

		if (field != null && field.contains("ASC")) {
			sortDirection = Sort.Direction.ASC; // Sắp xếp theo hướng tăng dần nếu giá trị tham số là "asc"
		}

		String sortField = "price"; // Sắp xếp theo trường "price" nếu không có trường được chỉ định

		if (field != null && field.contains("createDate")) {
			sortField = "createDate";
		}

		Pageable pageable = PageRequest.of(p != null ? p : 0, 12, Sort.by(sortDirection, sortField));

		Page<Product> page;

		if (ct == null || ct.equals("all")) {

			if (kwords == null) {
				page = productDAO.findAll(pageable);

			} else {
				page = productDAO.findByKeyWords("%" + kwords + "%", pageable);
			}

		} else {
			if (kwords == null) {

				page = productDAO.findByCategory(ct, pageable);
			} else {
				
				page = productDAO.findByKeyWordsWithCategory(ct, "%" + kwords + "%", pageable);
			}

		}

		model.addAttribute("PRODUCTS", page);

		// Truyền thông tin sắp xếp qua tham số URL
		model.addAttribute("fieldParam", field);

		    Order order = shoppingCart.getCart();
		    List<OrderDetail> orderDetails = order.getLsOrderDetails();
		    model.addAttribute("ORDER_DETAILS", orderDetails);
			model.addAttribute("TOTAL_PRODUCT", order.getTotalProducts());
			model.addAttribute("TOTAL_AMOUNT", order.getAmount());

		return "user/Store";


	}

	@GetMapping("filter")
	public ModelAndView productFilter(@RequestParam(value = "categories") Optional<List<String>> categories,
			@RequestParam(value = "minPrice") Optional<Double> minPrice,
			@RequestParam(value = "maxPrice") Optional<Double> maxPrice,
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "p", required = false) Integer p,Model model) {
		
		List<String> defaultcategories = List.of("Laptops","PC","Smartphones","Tablets","Headphones");
		List<String> lscategories = categories.orElse(session.get("categories",defaultcategories));
		session.set("categories", lscategories);
		
		Double min = minPrice.orElse(session.get("minPrice", 1.00));
		session.set("minPrice", min);

		Double max = maxPrice.orElse(session.get("maxPrice", 9999.0));
		session.set("maxPrice", max);
		
		Sort.Direction sortDirection = Sort.Direction.DESC; // Sắp xếp theo hướng giảm dần (mặc định)

		if (field != null && field.contains("ASC")) {
			sortDirection = Sort.Direction.ASC; // Sắp xếp theo hướng tăng dần nếu giá trị tham số là "asc"
		}

		String sortField = "price"; // Sắp xếp theo trường "price" nếu không có trường được chỉ định

		if (field != null && field.contains("createDate")) {
			sortField = "createDate";
		}

		Pageable pageable = PageRequest.of(p != null ? p : 0, 9, Sort.by(sortDirection, sortField));
		Page<Product> page = productDAO.productFilter(lscategories, min, max, pageable);
		ModelAndView modelAndView = new ModelAndView("user/ProductFilter");
		modelAndView.addObject("PRODUCTS", page);
		
		Order order = shoppingCart.getCart();
		List<OrderDetail> orderDetails = order.getLsOrderDetails();
		double totalAmount = order.getAmount();
		modelAndView.addObject("ORDER_DETAILS", orderDetails);
	    modelAndView.addObject("TOTAL_PRODUCT", order.getTotalProducts());
	    modelAndView.addObject("TOTAL_AMOUNT", totalAmount);
		
		
		// Truyền thông tin sắp xếp qua tham số URL
		modelAndView.addObject("fieldParam", field);

		return modelAndView;
	}
	
	@GetMapping("productDetail/{id}")
	public ModelAndView productDetail(@PathVariable("id") int id) {
		Product product = productDAO.findById(id).get();
		ModelAndView modelAndView = new ModelAndView("user/ProductDetail");
		modelAndView.addObject("PRODUCT_DETAIL", product);
		
		Order order = shoppingCart.getCart();
		List<OrderDetail> orderDetails = order.getLsOrderDetails();
		double totalAmount = order.getAmount();
	    modelAndView.addObject("ORDER_DETAILS", orderDetails);
	    modelAndView.addObject("TOTAL_PRODUCT", order.getTotalProducts());
	    modelAndView.addObject("TOTAL_AMOUNT", totalAmount);
		return modelAndView;
	}


}
