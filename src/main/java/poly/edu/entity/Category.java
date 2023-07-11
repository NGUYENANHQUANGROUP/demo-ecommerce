package poly.edu.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	@Id
	private String id;
	@Column(columnDefinition = "nvarchar(255)")
	private String name;
	
	@OneToMany(mappedBy = "category")
	List<Product> lsProducts;
	
	
}
