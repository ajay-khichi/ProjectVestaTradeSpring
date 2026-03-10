package com.ignishers.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

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
	
	
}
