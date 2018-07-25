package com.shoppingsite.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.userback.DAO.CartLineDAO;
import com.userback.DAO.CategoryDAO;
import com.userback.DAO.ProductDAO;
import com.userback.DAO.UserDAO;
import com.userback.model.Cart;
import com.userback.model.CartLine;
import com.userback.model.Product;
import com.userback.model.User;

@Controller
public class HomeController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	CartLineDAO cartLineDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartLine cartLine;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "index";

	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@RequestMapping(value = "/reguser", method = RequestMethod.POST)
	public String reguser(@ModelAttribute("User") User user) {

		user.setRole("ROLE_USER");
		user.setEnable(true);
		userDAO.addUser(user);
		cart.setUser(user);
		cartLineDAO.addCart(cart);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	@RequestMapping(value = "/login_success")
	public String loginSuccess(HttpSession session, Model m) {
		System.out.println("=========== Successful Login ===========");

		String page = null;

		boolean loggedIn = true;
		// Retrieving the username
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("username", username);
		session.setAttribute("loggedIn", loggedIn);
		User user = userDAO.getSingleUser(username);
		session.setAttribute("user", user);

		return "index";
	}

	@RequestMapping("/aboutus")
	public String AboutUs() {
		return "aboutus";
	}

	@RequestMapping("/contactus")
	public String contactus() {
		return "contactus";
	}

	@RequestMapping(value = "/addcart/{productID}")
	public String pr1(@PathVariable("productID") int productID, @RequestParam("qty") int quntity, HttpSession session,

			Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		System.out.println(email);
		Cart cart = cartLineDAO.getByEmailid(email);
		System.out.println(cart.getId());
		Product obj = productDAO.getProductById(productID);
		System.out.println(obj.getProductID());
		List<CartLine> lst = cartLineDAO.listAvailable(cart.getId());
		boolean flag = false;
		int id = 0;
		for (CartLine crtln : lst) {
			if (crtln.getProduct().getProductID() == obj.getProductID()) {
				flag = true;
				id = crtln.getId();
				break;
			}
		}
		if (flag) {

			CartLine crtln = cartLineDAO.get(id);

			crtln.setProductCount(crtln.getProductCount() + 1);
			crtln.setTotal(crtln.getProductCount() * crtln.getBuyingPrice());
			cartLineDAO.update(crtln);
		} else {
			cartLine.setProduct(obj);
			cartLine.setProductCount(quntity);
			cartLine.setBuyingPrice(Double.parseDouble(obj.getPrice()));
			cartLine.setCartId(cart.getId());
			System.out.println(quntity);
			System.out.println(obj.getPrice());
			System.out.println(email);
			System.out.println(cart.getId());
			cartLine.setTotal(quntity * Double.parseDouble(obj.getPrice()));
			cartLineDAO.add(cartLine);
		}

		lst = cartLineDAO.list(cart.getId());

		cart.setGrandTotal(this.getGrandTotal(lst));
		cart.setCartLines(cartLineDAO.listAvailable(cart.getId()).size());
		cartLineDAO.updateCart(cart);

		return "redirect:/cart";

	}

	@RequestMapping("/cart")
	public String cart(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Cart cart = cartLineDAO.getByEmailid(email);
		model.addAttribute("cartlist", cartLineDAO.listAvailable(cart.getId()));
		model.addAttribute("grandTotal", cart.getGrandTotal());
		return "cart";
	}

	@RequestMapping(value = "/updatecart/{cartLineId}")
	public String updatecart(@PathVariable("") int cartLineId, @RequestParam("qty") int qty, HttpSession session) {
		cartLine = cartLineDAO.get(cartLineId);
		if (qty == 0) {
			cartLineDAO.remove(cartLine);
	
		} else {
			cartLine.setProductCount(qty);
			cartLine.setTotal(qty * Double.parseDouble(cartLine.getProduct().getPrice()));

			User user = (User) session.getAttribute("user");
			cart = cartLineDAO.getByEmailid(user.getMail());

			
		
			cartLineDAO.update(cartLine);
		}
		cart.setGrandTotal(this.getGrandTotal(cartLineDAO.list(cart.getId())));
		cart.setCartLines(cartLineDAO.listAvailable(cart.getId()).size());
		cartLineDAO.updateCart(cart);

		return "redirect:/cart";

	}

	@RequestMapping("/bill")
	public String bill(Model model, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Cart cart = cartLineDAO.getByEmailid(email);
		model.addAttribute("address", cart.getUser().getAddress());
		model.addAttribute("name", cart.getUser().getName());
		model.addAttribute("number", cart.getUser().getNumber());
		model.addAttribute("cartid", cart.getId());
		model.addAttribute("grandtotal", cart.getGrandTotal());
		model.addAttribute("cartlist", cartLineDAO.listAvailable(cart.getId()));
		return "bill";

	}

	@RequestMapping(value = "/deletecartline/{cartLineID}")
	public String DeleteClicked(@PathVariable("cartLineID") int cartLineID, Model model) {

		CartLine cartLine = cartLineDAO.get(cartLineID);
		cartLineDAO.remove(cartLine);
		
		String username=SecurityContextHolder.getContext().getAuthentication().getName();
		Cart cart=cartLineDAO.getByEmailid(username);
		cart.setGrandTotal(this.getGrandTotal(cartLineDAO.list(cart.getId())));
		cartLineDAO.updateCart(cart);
		
		return "redirect:/cart";
	}

	@RequestMapping(value="/catproduct/{categoryID}")
	public String catproduct(@PathVariable("categoryID") int categoryID, Model model,HttpSession session) {
		session.setAttribute("prolist", productDAO.listSelected(categoryID));
		return "catproduct";
	}
	
	
	private int getGrandTotal(List<CartLine> lst) {
		int grandTotal = 0;
		for (CartLine cartLine : lst) {
			grandTotal += cartLine.getTotal();
		}

		return grandTotal;
	}

}