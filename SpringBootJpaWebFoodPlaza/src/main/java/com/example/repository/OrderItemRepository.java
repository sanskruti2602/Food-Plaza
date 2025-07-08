package com.example.repository;

import com.example.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    
    // Get all order items by order ID
    List<OrderItem> findByOrderOrderId(Long orderId);
}
