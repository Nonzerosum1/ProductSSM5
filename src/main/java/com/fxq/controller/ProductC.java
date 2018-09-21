package com.fxq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fxq.model.Category;
import com.fxq.model.Product;
import com.fxq.service.ProductService;

@Controller
public class ProductC {

	@Autowired
	private ProductService service;
	/**
	 * 取得产品列表
	 * @return
	 */
	@RequestMapping("/queryProducts.do")
	public ModelAndView queryProducts() {
		ModelAndView mv = new ModelAndView();
		List<Product> products = service.queryProducts();
		System.out.println(products);
		mv.addObject("products",products);
		mv.setViewName("/product-list");
		return mv;
	}
	
	/**
	 * 增加产品
	 * @param product
	 * @return
	 */
	@RequestMapping("/insertProduct.do")
	public ModelAndView insertProduct(Product product) {
		System.out.println(product);
		int result = service.insertProduct(product);
		//System.out.println(result);
		ModelAndView mv = new ModelAndView();
		
		if(result > 0) {
			mv.addObject("jsonObj", true);
			mv.setViewName("redirect:queryProducts.do");
		}else {
			mv.addObject("jsonObj", false);
			mv.setViewName("/fail");
		}
		return mv;
	}
	
	/**
	 * 删除产品
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteProduct.do")
	public ModelAndView deleteProduct(String id) {
		System.out.println(id);
		int result1 = service.deleteProduct_category(id);
		int result2 = service.deleteProduct(id);
		//System.out.println(result);
		ModelAndView mv = new ModelAndView();
		if(result1 > 0 && result2 > 0) {
			mv.setViewName("redirect:queryProducts.do");
		}else {
			mv.setViewName("/fail");
		}
		return mv;
	}
	
	/**
	 * 得到更新页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/getUpdateForm.do")
	public ModelAndView queryProduct(String id) {
		System.out.println(id);
		Product product = service.queryProduct(id);
		List<Category> allCategories = service.queryAllCategories();
 		ModelAndView mv = new ModelAndView();
		mv.addObject("product",product);
		mv.addObject("allCategories",allCategories);
		mv.setViewName("/getUpdateForm");
		return mv;
	}
	
	/**
	 * 更新产品
	 * @param product
	 * @return
	 */
	@RequestMapping("/updateProduct.do")
	public ModelAndView updateProduct(Product product) {
		System.out.println(product);
		int result = service.updateProduct(product);
		System.out.println(result);
		ModelAndView mv = new ModelAndView();
		if(result > 0) {
			mv.setViewName("redirect:queryProducts.do");
		}else {
			mv.setViewName("/fail");
		}
		return mv;
	}
}
