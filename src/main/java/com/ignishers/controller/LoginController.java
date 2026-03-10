package com.ignishers.controller;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ignishers.daoimpl.CustomerDaoImpl;
import com.ignishers.daoimpl.UserDaoImpl;
import com.ignishers.enums.AccountStatus;
import com.ignishers.enums.Role;
import com.ignishers.pojo.Customer;
import com.ignishers.pojo.User;



@Controller
public class LoginController {

	@Autowired
	private UserDaoImpl userdao;
	
	@Autowired
	private CustomerDaoImpl cstdao;
	

	@GetMapping({"/" , "/index"})
	public String indexPage()
	{
		return "index";
	}
	@GetMapping("/login")
	public String loginPage()
	{
		return "login";
	}
	@GetMapping("/signup")
	public String signupPage()
	{
		return "signup";
	}
	@GetMapping("/markets")
	public String marketPage()
	{
		return "markets";
	}
	@GetMapping("/about")
	public String aboutPage()
	{
		return "about";
	}
	@GetMapping("/pricing")
	public String pricingPage()
	{
		return "pricing";
	}
	@GetMapping("/contact")
	public String contactPage()
	{
		return "contact";
	}
	
	
	
	@PostMapping("/checkUser")
	public ModelAndView checkUserCredential(
			@RequestParam("email")String email,
			@RequestParam("password")String pass)
	{
		User u = userdao.checkUserCred(email, pass);
		ModelAndView mv = null;
		if(u!=null) {
			if(u.getRole().equals(Role.ADMIN)) {
				mv = new ModelAndView("adminhome", "msg", "Welcome Admin");
			}
			if(u.getRole().equals(Role.CUSTOMER)) {
				if(u.getAccountStatus().equals(AccountStatus.VERIFIED))
					mv = new ModelAndView("customerhome", "msg", "Welcome User");
				if(u.getAccountStatus().equals(AccountStatus.PENDING))
					mv = new ModelAndView("login", "msg", "User Verification is pending!");
				if(u.getAccountStatus().equals(AccountStatus.SUSPENDED))
					mv = new ModelAndView("login", "msg", "User is Blocked by admin!");
				if(u.getAccountStatus().equals(AccountStatus.REJECTED))
					mv = new ModelAndView("login", "msg", "User Application Rejected!");
			}
		}
		else
			mv = new ModelAndView("login", "msg", "Unable to Login, Username Password Wrong / User not Exist");
		return mv;
	}
	
	@PostMapping("/register")
	public ModelAndView registerUser(Customer cst) throws Exception
	{
		ModelAndView mv = null;
		if(cstdao.addCustomer(cst))
			mv = new ModelAndView("login", "msg", "Registration Successfull Wait for approval.");
		else
			mv = new ModelAndView("signup", "msg", "Registration Failed / User Already Exist!");
		return mv;
	}
	
	
}
