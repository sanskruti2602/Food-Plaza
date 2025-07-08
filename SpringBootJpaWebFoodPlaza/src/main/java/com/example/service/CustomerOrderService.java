package com.example.service;

import com.example.entity.CustomerOrder;
import com.example.entity.Customer;

import java.util.List;

public interface CustomerOrderService {

    // Save a new order (e.g., from cart)
    CustomerOrder placeOrder(Customer customer);

    // Get all orders (for admin view)
    List<CustomerOrder> getAllOrders();

    // Get all orders for a specific customer
    List<CustomerOrder> getOrdersByCustomer(Customer customer);
}
