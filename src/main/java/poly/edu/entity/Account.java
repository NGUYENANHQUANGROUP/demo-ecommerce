package poly.edu.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotEmpty(message = "Username is not empty")
	private String username;
	
	@NotEmpty(message = "Password is not empty")
	@Size(min = 6)
	private String password;
	
	@NotEmpty(message = "Fullname is not empty")
	@Column(columnDefinition = "nvarchar(100)")
	private String fullname;
	
	@NotEmpty(message = "Email is not empty")
	@Email(message = "Email invalidate")
	private String email;
	
	private String photo;
	private Boolean activated;
	private Boolean admin;
	
	@OneToMany(mappedBy = "account")
	private List<Order> lsOrders;
	
	public boolean isAdmin() {
	    return admin != null;
	}

}
