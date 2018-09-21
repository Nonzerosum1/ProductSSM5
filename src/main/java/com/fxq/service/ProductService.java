package com.fxq.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxq.dao.ProductMapper;
import com.fxq.model.Category;
import com.fxq.model.Product;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	
	public List<Product> queryProducts(){
		 List<Product> products = mapper.queryProducts();
		 for(Product product : products) {
			 String[] ids = product.getCids().split(",");
			 
			 Map<String, Object> map = new HashMap<>();
			 map.put("ids", ids);
			 List<Category> categories = mapper.queryCategories(map);
			 product.setCategories(categories);
		 }
		 return products;
	}
	
	public int insertProduct(Product product) {
		int result = mapper.insertProduct(product);
		if(result > 0) {
			String cids = product.getCids();
			String pid = product.getId();
			System.out.println("cids="+cids+",id="+pid);
			if(cids != null) {
				String[] cid = cids.split(",");
				Map<String,Object> map = new HashMap<>();
				map.put("pid", pid);
				map.put("cids", cid);
				mapper.insertProduct_category(map);
			} 
		}
 		return result;
 	}
	
	public int deleteProduct(String id) {
		return mapper.deleteProduct(id);
	}
	
	public int deleteProduct_category(String pid) {
		return mapper.deleteProduct_category(pid);
	}
	
	public Product queryProduct(String id) {
		Product product = mapper.queryProduct(id);
		System.out.println(product);
		String[] ids = product.getCids().split(",");
		Map<String,Object> map = new HashMap<>();
		map.put("ids", ids);
		List<Category> categories = mapper.queryCategories(map);
		product.setCategories(categories);
		return product;
	}
	
	public int updateProduct(Product product) {
		int result = mapper.updateProduct(product);
		if(result > 0) {
			String pid = product.getId();
			String ids = product.getCids();
			System.out.println(ids);
			if(ids != null) {
				String[] cids = ids.split(",");
				if(cids.length == 1) {
					Map<String,Object> map = new HashMap<>();
					map.put("pid", pid);
					map.put("cids", cids);
					mapper.updateProduct_category(map);
				}else {
//					Map<String,Object> map1 = new HashMap<>();
//					map1.put("pid", pid);
					mapper.deleteProduct_category(pid);
					
					Map<String,Object> map2 = new HashMap<>();
					map2.put("pid", pid);
					map2.put("cids", cids);
					mapper.insertProduct_category(map2);
				}
				
			}
 		}
 		return result;
	}
	
	public List<Category> queryAllCategories(){
		return mapper.queryAllCategory();
	}
}
