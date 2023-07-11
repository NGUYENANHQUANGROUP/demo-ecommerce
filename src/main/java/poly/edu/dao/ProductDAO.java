package poly.edu.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

import poly.edu.entity.Product;
import poly.edu.entity.report;

public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("select p from Product p where p.name LIKE ?1 OR p.category.name LIKE ?1")
	Page<Product> findByKeyWords(String keyWord, Pageable page);
	
	@Query("select p from Product p where p.category.name = ?1")
	Page<Product> findByCategory(String name,Pageable page);
	
	@Query("SELECT new report(o.category, sum(o.price), count(o))"
		       + " FROM Product o JOIN o.category c"
		       + " GROUP BY o.category"
		       + " ORDER BY sum(o.price) DESC")
	List<report> getInventoryByCategory();
	
	
	@Query("select p from Product p where p.category.name LIKE ?1 AND p.name LIKE ?2")
	Page<Product> findByKeyWordsWithCategory(String category, String name, Pageable page);
	
	@Query("SELECT p FROM Product p WHERE p.category.name IN ?1 AND p.price BETWEEN ?2 AND ?3")
	Page<Product> productFilter(List<String> categories, Double min, Double max, Pageable page);
	
}
