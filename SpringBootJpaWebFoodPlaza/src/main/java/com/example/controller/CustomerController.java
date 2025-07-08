package com.example.controller;

import com.example.entity.Cart;
import com.example.entity.Customer;
import com.example.entity.CustomerOrder;
import com.example.entity.Food;
import com.example.service.CartService;
import com.example.service.CustomerOrderService;
import com.example.service.CustomerService;
import com.example.service.FoodService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private FoodService foodService;

    @Autowired
    private CartService cartService;

    @Autowired
    private CustomerOrderService customerOrderService;

    // ✅ Customer Registration
    @PostMapping("/customer/register")
    public String registerCustomer(@ModelAttribute Customer customer) {
        customerService.registerCustomer(customer);
        return "redirect:/customer-login";
    }

    // ✅ Customer Login (clears cart on new login)
    @PostMapping("/customer/login")
    public String loginCustomer(@RequestParam String customerEmail,
                                 @RequestParam String customerPassword,
                                 HttpSession session) {
        Customer customer = customerService.loginCustomer(customerEmail, customerPassword);
        if (customer != null) {
            session.setAttribute("customer", customer);
            session.setAttribute("customerId", customer.getCustomerId());

            cartService.clearCart(customer.getCustomerId()); // Optional: reset cart each login
            return "redirect:/customer-dashboard";
        } else {
            return "redirect:/customer-login?error=true";
        }
    }

    // ✅ Customer Dashboard with food list
    @GetMapping("/customer-dashboard")
    public String showDashboard(Model model,
                                HttpSession session,
                                @ModelAttribute("successMessage") String successMessage) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        List<Food> foodList = foodService.getAllFood();
        model.addAttribute("foodList", foodList);
        model.addAttribute("customerName", customer.getCustomerName());

        if (successMessage != null && !successMessage.isEmpty()) {
            model.addAttribute("successMessage", successMessage);
        }

        return "customer-dashboard";
    }

    // ✅ Add item to Cart
    @PostMapping("/customer/addToCart")
    public String addToCart(@RequestParam("foodId") long foodId,
                            @RequestParam("quantity") int quantity,
                            HttpSession session,
                            RedirectAttributes redirectAttributes) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        cartService.addToCart(customer.getCustomerId(), foodId, quantity);
        redirectAttributes.addFlashAttribute("successMessage", "🛒 Item added to cart!");
        return "redirect:/customer-dashboard";
    }

    // ✅ Show Cart Page (customer-cart.jsp)
    @GetMapping("/customer/cart")
    public String showCart(Model model, HttpSession session,
                           @ModelAttribute("orderSuccess") String orderSuccess) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        List<Cart> cartItems = cartService.getCartByCustomerId(customer.getCustomerId());
        model.addAttribute("cartItems", cartItems);

        double total = 0;
        for (Cart c : cartItems) {
            total += c.getQuantity() * c.getFood().getFoodPrice();
        }
        model.addAttribute("totalPrice", total);

        if (orderSuccess != null && !orderSuccess.isEmpty()) {
            model.addAttribute("orderSuccess", orderSuccess);
        }

        return "customer-cart"; // ✅ Your JSP is named customer-cart.jsp
    }

    // ✅ Place Order (save to DB and clear cart)
    @PostMapping("/customer/placeOrder")
    public String placeOrder(HttpSession session, RedirectAttributes redirectAttributes) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        CustomerOrder order = customerOrderService.placeOrder(customer);
        if (order == null) {
            redirectAttributes.addFlashAttribute("orderSuccess", "⚠️ Cart is empty.");
        } else {
            redirectAttributes.addFlashAttribute("orderSuccess", "✅ Your order has been placed!");
        }

        return "redirect:/customer/cart";
    }

    // ✅ View My Orders
    @GetMapping("/customer/myOrders")
    public String viewMyOrders(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        List<CustomerOrder> orders = customerOrderService.getOrdersByCustomer(customer);
        model.addAttribute("orders", orders);

        return "customer-orders"; // You need to create customer-orders.jsp
    }

    // ✅ Update Profile - Show form
    @GetMapping("/customer/updateProfile")
    public String showUpdateProfilePage(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) return "redirect:/customer-login";

        model.addAttribute("customer", customer);
        return "update-profile"; // JSP page name
    }

    // ✅ Update Profile - Save
    @PostMapping("/customer/updateProfile")
    public String updateProfile(@ModelAttribute Customer updatedCustomer,
                                HttpSession session,
                                Model model) {
        Customer sessionCustomer = (Customer) session.getAttribute("customer");
        if (sessionCustomer == null) return "redirect:/customer-login";

        updatedCustomer.setCustomerId(sessionCustomer.getCustomerId());
        customerService.updateCustomer(updatedCustomer);
        session.setAttribute("customer", updatedCustomer);

        model.addAttribute("successMessage", "✅ Profile updated successfully!");
        model.addAttribute("customer", updatedCustomer);

        return "update-profile";
    }

    // ✅ Logout
    @GetMapping("/customer/logout")
    public String logoutCustomer(HttpSession session) {
        session.invalidate();
        return "redirect:/customer-login";
    }
}
