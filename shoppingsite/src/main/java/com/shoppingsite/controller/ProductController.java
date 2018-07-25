package com.shoppingsite.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.userback.DAO.CategoryDAO;
import com.userback.DAO.ProductDAO;
import com.userback.model.Product;

@Controller
public class ProductController {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/product")
	public String showProduct(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("catlist", categoryDAO.getAll());
		model.addAttribute("productlist", productDAO.getAll());
		return "addproduct";
	}

	// @PostMapping()
	@RequestMapping(value = "/SaveProduct", method = RequestMethod.POST)
	public String SaveProduct(@ModelAttribute("product") Product product,
			@RequestParam("file1")MultipartFile file1,
			@RequestParam("file2")MultipartFile file2,
			@RequestParam("file3")MultipartFile file3) {
		
		
		
		if(file1.isEmpty())
		{
			return "redirect:/addproduct";
			}
		try {
			String dir="E:\\project1\\shoppingsite\\src\\main\\webapp\\resources\\IMAGES\\"+product.getCode()+"\\";
			new File(dir).mkdir();
			
			Path path1=Paths.get(dir+"1.jpg");
			byte arr1[]=file1.getBytes();
			Files.write(path1, arr1);
			
			Path path2=Paths.get(dir+"2.jpg");
			byte arr2[]=file2.getBytes();
			Files.write(path2, arr2);
			
			Path path3=Paths.get(dir+"3.jpg");
			byte arr3[]=file3.getBytes();
			Files.write(path3, arr3);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		productDAO.addProduct(product);
		
		return "redirect:/product";
	}

	@RequestMapping(value = "/editproduct/{productid}")
	public String EditClicked(@PathVariable("productid") int productid, Model model) {

		model.addAttribute("userclickededit", "true");
		model.addAttribute("product", productDAO.getProductById(productid));
		model.addAttribute("productlist", productDAO.getAll());
		model.addAttribute("catlist", categoryDAO.getAll());
		return "addproduct";
	}

	@RequestMapping(value = "/UpdateProduct", method = RequestMethod.POST)
	public String UpdateProduct(@ModelAttribute("product") Product product) {

		productDAO.updateProduct(product);

		return "redirect:/product";
	}

	@RequestMapping(value = "/deleteproduct/{productid}")
	public String DeleteClicked(@PathVariable("productid") int productid, Model model) {

		model.addAttribute("userclickeddelete", "true");
		model.addAttribute("product", productDAO.getProductById(productid));
		model.addAttribute("prolist", productDAO.deleteProduct(productid));

		return "redirect:/product";
	}

	@RequestMapping(value = "/displayproduct")
	public String DisplayProducts(Model model) {
		model.addAttribute("productlist", productDAO.getAll());

		return "displayproduct";
	}
	@RequestMapping(value="/displaysingleproduct/{productID}")
	public String Displaysingleproduct(@PathVariable("productID") int productID, Model model) {
		model.addAttribute("prolist", productDAO.getProductById(productID));
		return "displaysingleproduct";
	}

}
