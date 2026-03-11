package com.ignishers.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ignishers.daoimpl.StockDaoImpl;
import com.ignishers.daoimpl.UserDaoImpl;
import com.ignishers.enums.AccountStatus;
import com.ignishers.pojo.Customer;
import com.ignishers.pojo.Stock;
import com.ignishers.pojo.User;

@Controller
public class AdminController {

	@Autowired
	private UserDaoImpl userdao;
	
	@Autowired
	public StockDaoImpl stockdao;

	@GetMapping("/logout")
    public String logout(HttpSession session) {

        if (session != null) {
            session.invalidate();
        }

        return "index";
    }
	
	@GetMapping("/adminstock")
    public String adminstockpage() {
        return "adminstock";
    }
	@GetMapping("/editcustomers")
    public String editcustomerspage() {
        return "editcustomers";
    }
	@GetMapping("/editprofile")
    public String editprofilepage() {
        return "editprofile";
    }
	@GetMapping("/adminhome")
    public String adminhomepage() {
        return "adminhome";
    }
	@GetMapping("/amdcustomer")
	public String amdcustomerpage() {
		return "amdcustomer";
	}
	@GetMapping("/getcustomer")
	public String getcustomerpage() {
		return "getcustomer";
	}
	
	
	@GetMapping("/getallcst")
	public String getallcstpage(Model model) {
		List<User> lst= userdao.getAllUser();
		model.addAttribute("users", lst);
		return "getallcst";
	}
	
	@GetMapping("/verifypage")
	public String verifycustomerspage(Model model) {
		List<User> lst = userdao.getAllUser();
		List<Customer> unverifiedCustomers = new ArrayList<>();
		for(User u : lst) {
			if(u instanceof Customer && !u.getAccountStatus().equals(AccountStatus.VERIFIED)) {
				unverifiedCustomers.add((Customer)u);
			}
		}
		model.addAttribute("unverifiedCustomers", unverifiedCustomers);
		return "verifypage";
	}
	
	@PostMapping("/updateAccountStatus")
	public String updateAccountStatus(@RequestParam String email, @RequestParam String newStatus, Model model) {
		User existingUser = userdao.checkExistence(email);
		
		if(existingUser != null) {
			existingUser.setAccountStatus(AccountStatus.valueOf(newStatus));
			userdao.updateUser(existingUser);
			model.addAttribute("msg", "Account status updated successfully for: " + email);
		} else {
			model.addAttribute("msg", "User not found.");
		}
		
		List<User> lst = userdao.getAllUser();
		java.util.List<Customer> unverifiedCustomers = new java.util.ArrayList<>();
		for(User u : lst) {
			if(u instanceof Customer && !u.getAccountStatus().equals(AccountStatus.VERIFIED)) {
				unverifiedCustomers.add((Customer)u);
			}
		}
		model.addAttribute("unverifiedCustomers", unverifiedCustomers);
		return "verifypage";
	}
	
	
	
	@PostMapping("/amdcst")
	public ModelAndView amdcst(
	        @RequestParam String email,
	        @RequestParam String mobile,
	        @RequestParam String bankAccount,
	        @RequestParam String ifscCode,
	        @RequestParam String password,
	        @RequestParam String b1) {          // b1 = "Update" / "Delete" / "Block"

	    ModelAndView mv = null;
	    User existingUser = userdao.checkExistence(email);
	    
	    if(existingUser == null || !(existingUser instanceof Customer)) {
	    	mv = new ModelAndView("amdcustomer", "msg", "No customer found with email: " + email);
	    	return mv;
	    }
	    
	    Customer cst = (Customer) existingUser;
	    
	    if(b1.equals("Update")) {
            cst.setMobile(mobile);
            cst.setBankAccount(bankAccount);
            cst.setIfscCode(ifscCode);
	        cst.setPassword(password);
	        if(userdao.updateUser(cst))
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Updated Successfully.");
	        else
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Could not be Updated");
	    }
	    if(b1.equals("Delete")) {
	    	if(userdao.deleteUser(cst))
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Deleted Successfully.");
	        else
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Could not be Deleted");
	    }
	    if(b1.equals("Block")) {
	    	cst.setAccountStatus(AccountStatus.SUSPENDED);
	    	if(userdao.updateUser(cst))
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Blocked Successfully.");
	        else
	        	mv = new ModelAndView("amdcustomer", "msg", "Customer Could not be Blocked");
	    }
	    return mv;
		
	}
	
	@PostMapping("/getcst")
	public ModelAndView getcst(
			@RequestParam String email) {
		ModelAndView mv = null;
	    User user = userdao.checkExistence(email);
	    
	    if(user == null || !(user instanceof Customer)) {
	    	mv = new ModelAndView("getcustomer", "msg", "No customer found with email: " + email);
	    	return mv;
	    }
	    mv = new ModelAndView("getcst", "user", user);
	    return mv;
	}
	
	
	@GetMapping("/amdstock")
	public String amdstockpage() {
	    return "amdstock";
	}

	@PostMapping("/amdstock")
	public ModelAndView amdstock(
	        @RequestParam String symbol,
	        @RequestParam String companyName,
	        @RequestParam double price,
	        @RequestParam long shares,
	        @RequestParam String action) {

	    ModelAndView mv;

	    Stock stock = stockdao.getStock(symbol);

	    if(action.equals("Add")) {

	        Stock s = new Stock();
	        s.setSymbol(symbol);
	        s.setCompanyName(companyName);
	        s.setCurrentPrice(new java.math.BigDecimal(price));
	        s.setPreviousClose(new java.math.BigDecimal(price));
	        s.setAvailableShares(shares);

	        if(stockdao.addStock(s))
	            mv = new ModelAndView("amdstock","msg","Stock Added");
	        else
	            mv = new ModelAndView("amdstock","msg","Stock Not Added");
	    }

	    else if(action.equals("Update")) {

	        if(stock!=null) {
	            stock.setCompanyName(companyName);
	            stock.setCurrentPrice(new java.math.BigDecimal(price));
	            stock.setAvailableShares(shares);

	            stockdao.updateStock(stock);

	            mv = new ModelAndView("amdstock","msg","Stock Updated");
	        }
	        else {
	            mv = new ModelAndView("amdstock","msg","Stock Not Found");
	        }
	    }

	    else if(action.equals("Delete")) {

	        if(stockdao.deleteStock(symbol))
	            mv = new ModelAndView("amdstock","msg","Stock Deleted");
	        else
	            mv = new ModelAndView("amdstock","msg","Stock Not Found");
	    }

	    else {
	        mv = new ModelAndView("amdstock");
	    }

	    return mv;
	}
	
	@PostMapping("/getstock")
	public ModelAndView getstock(@RequestParam String symbol) {

	    Stock stock = stockdao.getStock(symbol);

	    if(stock == null)
	        return new ModelAndView("getstock","msg","Stock Not Found");

	    return new ModelAndView("getstock","stock",stock);
	}
}
