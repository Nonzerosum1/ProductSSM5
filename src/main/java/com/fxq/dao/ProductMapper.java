package com.fxq.dao;

import java.util.List;
import java.util.Map;

import com.fxq.model.Category;
import com.fxq.model.Product;

public interface ProductMapper {

	List<Product> queryProducts();
	
	List<Category> queryCategories(Map<String,Object> map);
	
 	int insertProduct(Product product);
 	
	int insertProduct_category(Map<String,Object> map);
 	
 	int deleteProduct(String id);
	
 	int updateProduct(Product product);
 	
 	int updateProduct_category(Map<String,Object> map);
 	
 	Product queryProduct(String id);
 	
 	List<Category> queryAllCategory();

//	int update_deleteProduct_category(Map<String, Object> map1);

	int deleteProduct_category(String pid);

}
