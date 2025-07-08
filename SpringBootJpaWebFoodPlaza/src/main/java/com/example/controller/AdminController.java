package com.example.controller;

import com.example.service.FoodService;
import com.example.service.CustomerService;
import com.example.service.CustomerOrderService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {

    @Autowired
    private FoodService foodService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerOrderService customerOrderService;

    // Show admin login page
    @GetMapping("/admin-login")
    public String showAdminLoginPage() {
        return "admin-login";
    }

    // Handle admin login form submission
    @PostMapping("/admin/login")
    public String handleAdminLogin(@RequestParam String username,
                                   @RequestParam String password,
                                   HttpSession session) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("admin", "admin");
            return "redirect:/admin/dashboard";
        } else {
            return "redirect:/admin-login?error=true";
        }
    }

    // Admin dashboard page
    @GetMapping("/admin/dashboard")
    public String showAdminDashboard(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin-login";
        }

        model.addAttribute("foodList", foodService.getAllFood());
        model.addAttribute("customerList", customerService.getAllCustomers());
        model.addAttribute("orderList", customerOrderService.getAllOrders());

        return "admin-dashboard";
    }

    // Admin logout
    @GetMapping("/admin/logout")
    public String logoutAdmin(HttpSession session) {
        session.invalidate();
        return "redirect:/admin-login";
    }
}
