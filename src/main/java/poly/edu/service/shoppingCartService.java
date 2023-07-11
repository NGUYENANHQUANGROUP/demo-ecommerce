package poly.edu.service;

import poly.edu.entity.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class shoppingCartService {
	@Autowired
	sessionService session;
	
	void createCart(Order order) {
		session.set("CART", order);
	}
	
	public Order getCart() {
		Order order = (Order) session.get("CART");
		if(order == null) {
			order = new Order();
			createCart( order);
		}
		return order;
	}
	
	public void delCart() {
		session.remove("CART");
	}
	
}
