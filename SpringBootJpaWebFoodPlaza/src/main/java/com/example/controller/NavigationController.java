package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {

    @GetMapping("/customer-login")
    public String showCustomerLoginPage() {
        return "customer-login";  // customer-login.jsp
    }

    @GetMapping("/customer-register")
    public String showCustomerRegisterPage() {
        return "customer-register";  // customer-register.jsp
    }

//    @GetMapping("/admin-login")
//    public String showAdminLoginPage() {
//        return "admin-login";  // admin-login.jsp
//    }
//    
    
}
