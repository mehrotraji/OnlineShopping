package com.userback.DAO;

import java.util.List;

import com.userback.model.Product;

public interface ProductDAO {
	
	public boolean addProduct(Product product);
	public List<Product> getAll();
	public Product getProductById(int productID);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(int productID);
	public List<Product> listSelected(int categoryID);

}
