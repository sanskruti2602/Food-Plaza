package com.example.service;

import com.example.entity.Cart;

import com.example.entity.Customer;
import com.example.entity.CustomerOrder;
import com.example.entity.OrderItem;
import com.example.repository.CartRepository;
import com.example.repository.CustomerOrderRepository;
import com.example.repository.OrderItemRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {

    @Autowired
    private CustomerOrderRepository customerOrderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private CartRepository cartRepository;

    @Override
    public CustomerOrder placeOrder(Customer customer) {
        // Step 1: Fetch items from cart
        List<Cart> cartItems = cartRepository.findByCustomerCustomerId(customer.getCustomerId());
        if (cartItems == null || cartItems.isEmpty()) {
            return null; // Nothing to order
        }

        // Step 2: Calculate total and prepare OrderItems
        List<OrderItem> orderItems = new ArrayList<>();
        double total = 0;

        for (Cart cart : cartItems) {
            OrderItem item = new OrderItem();
            item.setFood(cart.getFood());
            item.setQuantity(cart.getQuantity());
            item.setPrice(cart.getFood().getFoodPrice());
            orderItems.add(item);

            total += cart.getQuantity() * cart.getFood().getFoodPrice();
        }

        // Step 3: Create and save CustomerOrder
        CustomerOrder order = new CustomerOrder();
        order.setCustomer(customer);
        order.setOrderDate(LocalDateTime.now());

        order.setTotalPrice(total);
        order = customerOrderRepository.save(order); 

        for (OrderItem item : orderItems) {
            item.setOrder(order);  

        }
        orderItemRepository.saveAll(orderItems);

        // Step 5: Clear the cart after successful order
        cartRepository.deleteAll(cartItems);

        // Step 6: Return the placed order
        order.setOrderItems(orderItems);
        return order;
    }

    @Override
    public List<CustomerOrder> getAllOrders() {
        return customerOrderRepository.findAll();
    }

    @Override
    public List<CustomerOrder> getOrdersByCustomer(Customer customer) {
        return customerOrderRepository.findByCustomerCustomerId(customer.getCustomerId());
    }
}
