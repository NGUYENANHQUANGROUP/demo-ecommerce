package poly.edu.controller.admin;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import poly.edu.dao.ProductDAO;
import poly.edu.entity.Product;
import poly.edu.entity.report;
import poly.edu.service.sessionService;

@Controller
@RequestMapping("admin")
public class productController {
	
	@Autowired
	ProductDAO product;
	
	@Autowired
	sessionService session;
	
	@GetMapping("formProduct")
	public String formProduct() {
		
		
		return"admin/FormProduct";
	}
	
	@GetMapping("product")
	public String viewProducts(Model model, @RequestParam(value = "field", required = false) String field, @RequestParam(value = "p", required = false) Integer p) {
		
		Sort.Direction sortDirection = Sort.Direction.DESC; // Sắp xếp theo hướng giảm dần (mặc định)
	    String sortField = "price"; // Sắp xếp theo trường "price" nếu không có trường được chỉ định

	    if (field != null && !field.isEmpty()) {
	        sortField = field;
	    }

	    Pageable pageable = PageRequest.of(p != null ? p : 0, 6, Sort.by(sortDirection, sortField));
	    Page<Product> page = product.findAll(pageable);
	    model.addAttribute("PRODUCTS", page);

	    // Truyền thông tin sắp xếp qua tham số URL
	    model.addAttribute("fieldParam", sortField);
		
		return"admin/ViewProducts";
	}
	
	@GetMapping("product/delete/{id}")
	public String delProduct(@PathVariable("id") int id) {
		
		try {
			product.deleteById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return"redirect:/admin/product";
	}
	
	@GetMapping("search&page")
	public String searchAndPage(Model model, 
			@RequestParam(value = "field", required = false) String field, 
			@RequestParam(value = "p", required = false) Integer p,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword) {
		
		
		
		
		Sort.Direction sortDirection = Sort.Direction.DESC; // Sắp xếp theo hướng giảm dần (mặc định)
	    String sortField = "price"; // Sắp xếp theo trường "price" nếu không có trường được chỉ định

	    if (field != null && !field.isEmpty()) {
	        sortField = field;
	    }
	    
	    Pageable pageable = PageRequest.of(p != null ? p : 0, 6, Sort.by(sortDirection, sortField));
	    Page<Product> page = product.findByKeyWords("%"+keyword+"%",pageable);
	    model.addAttribute("PRODUCTS", page);
	    model.addAttribute("fieldParam", sortField);
	    model.addAttribute("keyword", keyword);
	    
		return"admin/SearchAndPage";
	}
	
	@GetMapping("search")
	public ModelAndView search(Model model, 
			@RequestParam(value = "field", required = false) String field, 
			@RequestParam(value = "p", required = false) Integer p,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword) {
		
		
	
		
		Sort.Direction sortDirection = Sort.Direction.DESC; // Sắp xếp theo hướng giảm dần (mặc định)
	    String sortField = "price"; // Sắp xếp theo trường "price" nếu không có trường được chỉ định

	    if (field != null && !field.isEmpty()) {
	        sortField = field;
	    }
	    
	    Pageable pageable = PageRequest.of(p != null ? p : 0, 6, Sort.by(sortDirection, sortField));
	    Page<Product> page = product.findByKeyWords("%"+keyword+"%",pageable);
	    ModelAndView modelAndView = new ModelAndView("forward:/admin/search&page");
	    modelAndView.addObject("PRODUCTS", page);
	    modelAndView.addObject("fieldParam", sortField);
	    modelAndView.addObject("keyword", keyword);
	    
	    
		return modelAndView;
	}
	
	@GetMapping("report-by-inventory")
	public String reportByInventory(Model model) {
		
		List<report> items = product.getInventoryByCategory();
		model.addAttribute("items", items);
		return "admin/Report";
	}
	
//	@GetMapping("search-by-price")
//	public String searchByPrice(Model model,
//			@RequestParam("min") Optional<Double> min,@RequestParam("max") Optional<Double> max) {
//		double minPrice = min.orElse(Double.MIN_VALUE);
//		double maxPrice = max.orElse(Double.MAX_VALUE);
//		Page<Product> items = product.findByPrice(minPrice, maxPrice);
//		model.addAttribute("items", items);
//		return "";
//	}

}
