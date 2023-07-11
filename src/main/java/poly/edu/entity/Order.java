package poly.edu.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;



@AllArgsConstructor
@Data
@Entity
@Table(name = "Orders")

public class Order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String adress;
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	private Date createDate = new Date();
	
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account account;
	
	@OneToMany(mappedBy = "order", cascade = CascadeType.PERSIST)
	List<OrderDetail> lsOrderDetails;
	
	public Order() {
		lsOrderDetails = new ArrayList<OrderDetail>();
	}
	
	public OrderDetail getOrderDetail(Product p) {
		int id = p.getId();
		for(OrderDetail orderDetail: lsOrderDetails) {
			
			if (orderDetail.getProduct().getId() == id) {
				System.out.println("co san pham");
				return orderDetail;
			}
		}
		return null;
	}
	
	public void addOrderDetail(Product p) {
		OrderDetail orderDetail = getOrderDetail(p);
		if(orderDetail!=null) {
			orderDetail.setQuantity(orderDetail.getQuantity()+1);
		}else {
			orderDetail = new OrderDetail(p);
			orderDetail.setOrder(this);
			lsOrderDetails.add(orderDetail);
		}
	}
	
	public void addOrderDetail(Product p, int quantity) {
		OrderDetail orderDetail = getOrderDetail(p);
		if(orderDetail!=null) {
			orderDetail.setQuantity(orderDetail.getQuantity()+quantity);
		}else {
			orderDetail = new OrderDetail(p);
			orderDetail.setQuantity(quantity);
			orderDetail.setOrder(this);
			lsOrderDetails.add(orderDetail);
		}
	}
	
	public void updateOrderDetail(Product p, int quantity) {
		OrderDetail orderDetail = getOrderDetail(p);
		if(orderDetail!=null) {
			orderDetail.setQuantity(quantity);
		}
	}
	
	public void removeOrderDetail(Product p) {
		OrderDetail orderDetail = getOrderDetail(p);
		if(orderDetail!=null) {
			lsOrderDetails.remove(orderDetail);
		}
	}
	
	public void clear() {
		lsOrderDetails.clear();
	}
	
	public double getAmount() {
		double Amount = 0;
		for(OrderDetail orderDetail: lsOrderDetails) {
			Amount+= orderDetail.getPrice()*orderDetail.getQuantity();
		}
		return Amount;
	}
	
	public int getTotalProducts() {
		int total = 0;
		for(int i = 0; i< lsOrderDetails.size();i++) {
			total+= lsOrderDetails.get(i).getQuantity();
		}
		return total;
	}
}
